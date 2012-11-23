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
 * Classe DBBeans contente i metodi delle operazioni pi� comuni su una tabella
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
     * Restituisce tutti gli elementi di una tabella
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
            String contenuto_variabile = (String) getFieldFromBean(temp, iterator_variabili.next());
            valori.add(contenuto_variabile);
        }

        if (tabella.insert(valori))
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
         * Solo se il campo non esiste o l'operazione non � consentita viene restituito null.
         */
        return null;
    }
    
    /**
     * Sostituisce un beans con un nuovo beans.
     * @param RealBeans beans presente nel databse
     * @param NewRealBeans nuovo beans che sostituir� il suo corrispondente  nel database
     * @return
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
     */
    public  boolean replace(B realBeans,B newRealBeans) throws IllegalArgumentException, IllegalAccessException{
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
        if (!cancAvvenuta)
            inserisci(temp_old);//inserisco di nuovo l'oggetto eliminato
        LOG.log(Level.SEVERE, "Replace non andato a buon fine");
      return false;
        
    }
    
    /**
     * Cancella una beans dal database
     * @param RealBeans bean da cancellare
     * @return true in caso di successo
     *         false altrimenti
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
     */
    public  boolean delete(B realBeans) throws  IllegalArgumentException, IllegalAccessException{
        B temp=realBeans;
        ArrayList<String> contenuto_chiavi=new ArrayList<String>();
        Map<String,String> toReturn= getMappingFields();//ottengo hashmap variabile-attributo database
        Set<String> variabili = toReturn.keySet();//ottengo un Set delle variabili
        Iterator<String> iterator_variabili = variabili.iterator();
        Iterator<String> nome_variabili_chiave = getKeyFields().iterator();
        //nei seguenti while confronto i nomi di tutte le variabile con quelle chiave e quando 
        //corrisponde prendo il valore della variabile e lo aggiungo a contenuto_chiavi
        while( iterator_variabili.hasNext()){//scorro tutti i nomi di variabili
            String valore_variabile_corrispondente = null;
            while (nome_variabili_chiave.hasNext()){//scorro tutti i nomi di variabili chiave
                String nome_variabile_attuale = iterator_variabili.next();
                if ( nome_variabile_attuale.equals(nome_variabili_chiave.next()))//se nome variabile attuale == nome variabile chiave
                    valore_variabile_corrispondente =  (String) getFieldFromBean(temp, nome_variabile_attuale);
            }
            contenuto_chiavi.add(valore_variabile_corrispondente);//aggiungo il contenuto di una variabile chiave
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
