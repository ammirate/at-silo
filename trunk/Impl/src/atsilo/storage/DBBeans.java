package atsilo.storage;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 
 * Classe DBBeans contente i metodi delle operazioni piï¿½ comuni su una tabella
 * 
 * @author Angelo G. Scafuro
 *
 */
public abstract class DBBeans<B> {
    private static Logger LOG = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
    
    protected final Tabella tabella;
    private Database db;
    
    /**
     * Metodo costruttore
     * @param nomeTabella nome reale della relativa tabella del database
     * @param database connessione al database
     */
    public DBBeans(String nomeTabella,Database database ){
        tabella=new Tabella(nomeTabella,database);
        db=tabella.getDatabase();
    }
 
    /**
     * Cambia il la tabella su cui si eseguono le operazioni 
     * @param realTable nuova tabella
     * @param database  connessione al database
     * @throws UnsupportedOperationException
     * @deprecated non e' possibile modificare la tabella
     */
    public void setTabella(Tabella realTable,Database database){
       throw new UnsupportedOperationException();
    }
    
    /**
     * Restitusice il nome della tabella usata
     * @return nome della tabella usata 
     */
    public String getNomeTabella(){
        return tabella.getNomeTabella();
    }
    
    /**
     * Restituisce tutti gli elementi di una tabella in una lista nel formato
     * #Riga
     * ValoreAttN
     * ValoreAttN+1
     * @return lista di tutti i record relativi alla tabella del beans
     */
    public ArrayList<ArrayList<String>> getAll() {
       ArrayList<ArrayList<String>> risultato = new ArrayList<ArrayList<String>>();
       String query=" SELECT * FROM "+tabella.getNomeTabella();
       risultato=tabella.eseguiQuerySpecifica(query); 
       return risultato;
    }
    
    /**
     * Inserisce un beans nella relativa tabella del database
     * @param RealBeans beans da inserire nel database
     * @return true in caso di inserimento riuscito
     *         false altrimenti
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
     */
    public boolean inserisci(B realBeans) throws IllegalArgumentException, IllegalAccessException
    {   
        
        B temp=realBeans;
        ArrayList<String> valori=new ArrayList<String>();
        Map<String,String> toReturn= getMappingFields();//ottengo hashmap variabile-attributo database
        Set<String> variabili = toReturn.keySet();//ottengo un Set delle variabili
        Iterator<String> iterator_variabili = variabili.iterator();
        while( iterator_variabili.hasNext()){
            String nome_variabile = iterator_variabili.next();
            String contenuto_variabile = getFieldFromBean(temp, nome_variabile).toString();
             valori.add(contenuto_variabile);
        }
        if (tabella.insert(valori))
            return true;
        return false;
    }
    
    /**Controlla se il bean è presente nella tabella
     * @param realBeans oggetto di cui controllare la presenza nella tabella
     * @return true se oggetto presente
     *         false altrimenti
     */
    public boolean isInTable(B realBeans) {
        B temp=realBeans;
        ArrayList<String> contenuto_chiavi=new ArrayList<String>();
        Iterator<String> nome_variabili_chiave = getKeyFields().iterator();// ottengo un iteratore dei nomi delle variabili corrispondenti alle PRIMARY KEY
        while (nome_variabili_chiave.hasNext()){//scorro tutti i nomi di variabili chiave
            try {
                contenuto_chiavi.add(getFieldFromBean(temp, nome_variabili_chiave.next()).toString());
            } catch (IllegalArgumentException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (IllegalAccessException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            }//aggiungo il contenuto di una variabile chiave  
        }
       
        ArrayList<ArrayList<String>> result = tabella.selezione(null, getKeyFields(), contenuto_chiavi);//select * from tabella where chiave=contenutoChiave
        if (result.size()!=0)
            return true;
        return false;
        
    }

    /**
     * Metodo che legge un campo di nome nomeCampo da un oggetto Java realBean
     * @param realBean
     * @param nomeCampo
     * @return
     * @throws IllegalArgumentException
     * @throws IllegalAccessException
     */
    protected final Object getFieldFromBean(B realBean, String nomeCampo) throws IllegalArgumentException, IllegalAccessException
    {
        Class beanClass = realBean.getClass();
        Field field=null;
        try {
            field = beanClass.getDeclaredField(nomeCampo);
            if(field!=null)
            {
                field.setAccessible(true);
                return field.get(realBean);
            }
        } catch (NoSuchFieldException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Campo ricercato non conosciuto", e);
        } catch (SecurityException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Operazione non consentita", e);
        }
        /**
         * Solo se il campo non esiste o l'operazione non consentita viene restituito null.
         */
        return null;
    }
    
    /**
     * Sostituisce un beans con un nuovo beans.
     * @param RealBeans beans presente nel databse
     * @param NewRealBeans nuovo beans che sostituirï¿½ il suo corrispondente  nel database
     * @return
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
     */
    public  boolean replace(B realBeans,B newRealBeans) throws IllegalArgumentException, IllegalAccessException{
        if (isInTable(realBeans)){
        B temp_old = realBeans;
        B temp_new=newRealBeans;
        boolean cancAvvenuta=false;
        boolean insAvvenuto=false;
        if (delete(realBeans))
            cancAvvenuta=true;
        if (inserisci(newRealBeans))
            insAvvenuto=true;
        if (cancAvvenuta && insAvvenuto)
            return true;
        if (cancAvvenuta && !insAvvenuto) // è avvenuta cancellazione ma l'inserimento non è andato a buon fine
            inserisci(temp_old);//inserisco di nuovo l'oggetto eliminato in precedenza
        if (!cancAvvenuta && insAvvenuto) //non è avvenuta cancellazione e l'inserimento  è andato a buon fine
            delete(temp_new);//elimino dal database newRealBeans poiche' non ha sostituito realBeans
        LOG.log(Level.SEVERE, "Replace non andato a buon fine");
      return false;
        }
        else{ 
            LOG.log(Level.SEVERE, "Non è possibile effettuare la replace perchè l'oggetto da sostituire non è presente nella tabella");
            return false;
            }
        
    }
    
    /**
     * Cancella una beans dal database riferendosi alla PRIMARY KEY
     * @param RealBeans bean da cancellare
     * @return true in caso di successo
     *         false altrimenti
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
     */
    public  boolean delete(B realBeans) throws  IllegalArgumentException, IllegalAccessException{
        B temp=realBeans;
        ArrayList<String> contenuto_chiavi=new ArrayList<String>();
        Iterator<String> nome_variabili_chiave = getKeyFields().iterator();// ottengo un iteratore dei nomi delle variabili corrispondenti alle PRIMARY KEY
        while (nome_variabili_chiave.hasNext()){//scorro tutti i nomi di variabili chiave
            contenuto_chiavi.add(getFieldFromBean(temp, nome_variabili_chiave.next()).toString());//aggiungo il contenuto di una variabile chiave  
        }
       if( tabella.rimuovi(getKeyFields(), contenuto_chiavi))
            return true;
        return false;
        
    }
    
    /**
     * Restituisce il database con la relativa connessione
     * @return oggetto database con relativa connessione
     */
    public Database getDatabase(){
        return db;
    }
    
    /**
     * Metodo astratto che associa, per ogni Bean, in una mappa hash secondo lo schema <chiave,valore> 
     * <variabile_bean , colonna_database>.
     * @return
     */
    protected abstract Map<String,String> getMappingFields();
    
    /**
     * Metodo che restituisce la lista dei campi chiave nel database per questo bean.
     * @return
     */
    protected abstract List<String> getKeyFields();
}
