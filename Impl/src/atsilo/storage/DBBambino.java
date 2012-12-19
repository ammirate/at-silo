package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;
import atsilo.storage.DBBeans.Assegnazione;
import atsilo.util.AtsiloConstants;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Collections;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBBambino.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, Luigi Lomasto, Elisa D'Eugenio 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBBambino extends DBBeans<Bambino> {    
   
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 

    /**
     * Costruttore 
     * @param db 
     */
    public DBBambino(Database db){super("bambino",db);}

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() { return MAPPINGS; }


    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {return CHIAVE;}
    
    
    /**
     * metodo che asocia alla chiave(nome campo db)
     *  il rispettivo valore(nome attributo classe)
     * @return
     */
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        
        res.put("nome","nome");
        res.put("dataNascita","data_di_nascita");
        res.put("categoriaAppartenenza","categoria_appartenenza");
        res.put("cognome","cognome");
        res.put("codiceFiscale","codice_fiscale");
        res.put( "comuneNascita","comune_di_nascita");
        res.put("cittadinanza", "cittadinanza");
        res.put( "indirizzoResidenza","indirizzo_residenza");
        res.put( "numeroCivicoResidenza","numero_civico_residenza");
        res.put( "provinciaResidenza","provincia_residenza");
        res.put("indirizzoDomicilio","indirizzo_domicilio" );
        res.put( "numeroCivicoDomicilio","numero_civico_domicilio");
        res.put("capDomicilio","cap_domicilio" );
        res.put( "capResidenza","cap_residenza");
        res.put( "comuneDomicilio","comune_domicilio");
        res.put( "provinciaDomicilio","provincia_domicilio");
        res.put("iscrizioneClasse", "iscrizione_classe");
        
        
        return Collections.unmodifiableMap(res);
    }
    
    
    /**
     * Metodo che crea la chiave
     * @return
     */
    private static List<String> creaChiave(){
        List<String> res=  Arrays.asList("codiceFiscale");
        
        return Collections.unmodifiableList(res);
    }

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Bambino creaBean(ResultSet r) throws SQLException {
        Bambino b=new Bambino();
        
            b.setNome(r.getString("nome"));
            b.setCognome(r.getString("cognome"));
            b.setCodiceFiscale(r.getString("codice_fiscale"));
            b.setDataNascita(r.getDate("data_di_nascita"));
            b.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            b.setClasse(r.getInt("classe"));
            b.setIscrizioneClasse(r.getString("iscrizione_classe"));
            Genitore gen=new Genitore();
           String g=r.getString("genitore");
           gen.setCodiceFiscale(g);
            b.setGenitore(gen);
            Genitore gg=new Genitore();
            String s=r.getString("cf_genitore_nonrichiedente");
            gg.setCodiceFiscale(s);
            b.setGenitoreNonRichiedente(gg);
            b.setComuneNascita(r.getString("comune_di_nascita"));
            b.setCittadinanza(r.getString("cittadinanza"));
            b.setIndirizzoResidenza(r.getString("indirizzo_residenza"));
            b.setIndirizzoDomicilio(r.getString("indirizzo_domicilio"));
            b.setNumeroCivicoResidenza(r.getString("numero_civico_residenza"));
            b.setNumeroCivicoDomicilio(r.getString("numero_civico_domicilio"));
            b.setProvinciaDomicilio(r.getString("provincia_domicilio"));
            b.setProvinciaResidenza(r.getString("provincia_residenza"));
            b.setComuneDomicilio(r.getString("comune_domicilio"));
            b.setCapResidenza(r.getString("cap_residenza"));
            b.setCapDomicilio(r.getString("cap_domicilio"));
            b.setIscrizioneClasse(r.getString("iscrizione_classe"));
            
             
        return b;
    }

    
    /**
     * ricerca un bambino per codicefiscale
     * @param codicefiscale da ricercare per trovare il bambino
     * @return restituisce un bambino se è presente il codice fiscale nel database o un oggetto vuoto
     * @throws SQLException nel caso in cui si verificano errori di connessione
     */
    public Bambino ricercaBambinoPerCodFiscale(String codicefiscale) throws SQLException
    {
        Bambino b=new Bambino();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE codice_fiscale = ?");
            tabella.setParam(stmt, 1, "codice_fiscale", codicefiscale);
            ResultSet r = stmt.executeQuery();
        if(r.next())
        {
            
            b.setNome(r.getString("nome"));
            b.setCognome(r.getString("cognome"));
            b.setCodiceFiscale(r.getString("codice_fiscale"));
            b.setDataNascita(r.getDate("data_di_nascita"));
            b.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            b.setClasse(r.getInt("classe"));
            b.setIscrizioneClasse(r.getString("iscrizione_classe"));
            Genitore gen=new Genitore();
           String g=r.getString("genitore");
           gen.setCodiceFiscale(g);
            b.setGenitore(gen);
            Genitore gg=new Genitore();
            String s=r.getString("cf_genitore_nonrichiedente");
            gg.setCodiceFiscale(s);
            b.setGenitoreNonRichiedente(gg);
            b.setComuneNascita(r.getString("comune_di_nascita"));
            b.setCittadinanza(r.getString("cittadinanza"));
            b.setIndirizzoResidenza(r.getString("indirizzo_residenza"));
            b.setIndirizzoDomicilio(r.getString("indirizzo_domicilio"));
            b.setNumeroCivicoResidenza(r.getString("numero_civico_residenza"));
            b.setNumeroCivicoDomicilio(r.getString("numero_civico_domicilio"));
            b.setProvinciaDomicilio(r.getString("provincia_domicilio"));
            b.setProvinciaResidenza(r.getString("provincia_residenza"));
            b.setComuneDomicilio(r.getString("comune_domicilio"));
            b.setCapResidenza(r.getString("cap_residenza"));
            b.setCapDomicilio(r.getString("cap_domicilio"));
            b.setIscrizioneClasse(r.getString("iscrizione_classe"));

        }
        else
        {
            b=null;
        }
        r.close();
        return b;
    } 
    
    
  
    /**
     * ricerca classe di un bambino
     * @param b codice fiscale del bambino di cui ricercare la classe
     * @return int  l id della classe 
     * @throws SQLException
     */
    public int ricercaClasseBambino(String b) throws SQLException{
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE codice_fiscale = ?");
            tabella.setParam(stmt, 1, "codice_fiscale", b);
            ResultSet r = stmt.executeQuery();
        int c = 0;
        if(r.next())
            c=r.getInt("classe");
        
        r.close();
        return c;
    }
    /**
     * 
     * @param CFGenitore codice fiscale del genitore di cui ricercare
     * i bambini figli
     * @return lista dei bambini figli del genitore con codice fiscale=CFGenitore
     * @throws SQLException
     */
    public List<Bambino> ricercaFigliGenitore(String CFGenitore) throws SQLException {
        
        List<Bambino>l=new ArrayList<Bambino>();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE genitore = ?");
            tabella.setParam(stmt, 1, "genitore", CFGenitore);
            ResultSet r = stmt.executeQuery();
            
            
            while (r.next()){
            
            Bambino b=new Bambino();
            
            b.setNome(r.getString("nome"));
            b.setCognome(r.getString("cognome"));
            b.setCodiceFiscale(r.getString("codice_fiscale"));
            b.setDataNascita(r.getDate("data_di_nascita"));
            b.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            b.setClasse(r.getInt("classe"));
            b.setIscrizioneClasse(r.getString("iscrizione_classe"));
            Genitore gen=new Genitore();
           String g=r.getString("genitore");
           gen.setCodiceFiscale(g);
            b.setGenitore(gen);
            Genitore gg=new Genitore();
            String s=r.getString("cf_genitore_nonrichiedente");
            gg.setCodiceFiscale(s);
            b.setGenitoreNonRichiedente(gg);
            b.setComuneNascita(r.getString("comune_di_nascita"));
            b.setCittadinanza(r.getString("cittadinanza"));
            b.setIndirizzoResidenza(r.getString("indirizzo_residenza"));
            b.setIndirizzoDomicilio(r.getString("indirizzo_domicilio"));
            b.setNumeroCivicoResidenza(r.getString("numero_civico_residenza"));
            b.setNumeroCivicoDomicilio(r.getString("numero_civico_domicilio"));
            b.setProvinciaDomicilio(r.getString("provincia_domicilio"));
            b.setProvinciaResidenza(r.getString("provincia_residenza"));
            b.setComuneDomicilio(r.getString("comune_domicilio"));
            b.setCapResidenza(r.getString("cap_residenza"));
            b.setCapDomicilio(r.getString("cap_domicilio"));
            b.setIscrizioneClasse(r.getString("iscrizione_classe"));

            l.add(b);
            } 
            if(l.size()==0){
                r.close();
                return l;
            }else{
            r.close();
            
        return l;
            }
    }
    
    
    
    /**
     * 
     * @return lista dei bambini non assegnati ad alcuna classe
     * @throws SQLException
     */
    public List<Bambino> ricercaBambiniSenzaClasse() throws SQLException {
        
        List<Bambino>l=new ArrayList<Bambino>();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE classe IS NULL OR iscrizione_classe= ?");
            stmt.setString(1, AtsiloConstants.ISCRIZIONE_CLASSE_RIFIUTATA);
            ResultSet r = stmt.executeQuery();
            
            
            while (r.next()){
            
            Bambino b=new Bambino();
            
            b.setNome(r.getString("nome"));
            b.setCognome(r.getString("cognome"));
            b.setCodiceFiscale(r.getString("codice_fiscale"));
            b.setDataNascita(r.getDate("data_di_nascita"));
            b.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            b.setClasse(r.getInt("classe"));
            b.setIscrizioneClasse(r.getString("iscrizione_classe"));
            Genitore gen=new Genitore();
           String g=r.getString("genitore");
           gen.setCodiceFiscale(g);
            b.setGenitore(gen);
            Genitore gg=new Genitore();
            String s=r.getString("cf_genitore_nonrichiedente");
            gg.setCodiceFiscale(s);
            b.setGenitoreNonRichiedente(gg);
            b.setComuneNascita(r.getString("comune_di_nascita"));
            b.setCittadinanza(r.getString("cittadinanza"));
            b.setIndirizzoResidenza(r.getString("indirizzo_residenza"));
            b.setIndirizzoDomicilio(r.getString("indirizzo_domicilio"));
            b.setNumeroCivicoResidenza(r.getString("numero_civico_residenza"));
            b.setNumeroCivicoDomicilio(r.getString("numero_civico_domicilio"));
            b.setProvinciaDomicilio(r.getString("provincia_domicilio"));
            b.setProvinciaResidenza(r.getString("provincia_residenza"));
            b.setComuneDomicilio(r.getString("comune_domicilio"));
            b.setCapResidenza(r.getString("cap_residenza"));
            b.setCapDomicilio(r.getString("cap_domicilio"));
            b.setIscrizioneClasse(r.getString("iscrizione_classe"));

            l.add(b);
            } 
            
            r.close();
            
        return l;
            
    }
    /**
     * 
     * @return lista dei bambini con classi da convalidare da parte del delegato del rettore
     * @throws SQLException
     */
    public List<Bambino> ricercaBambiniConClasseDaConvalidare() throws SQLException {
        
        List<Bambino>l=new ArrayList<Bambino>();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE classe IS NULL OR iscrizione_classe= ?");
        stmt.setString(1, AtsiloConstants.ISCRIZIONE_CLASSE_DA_CONVALIDARE);
            ResultSet r = stmt.executeQuery();
            
            
            while (r.next()){
            
            Bambino b=new Bambino();
            
            b.setNome(r.getString("nome"));
            b.setCognome(r.getString("cognome"));
            b.setCodiceFiscale(r.getString("codice_fiscale"));
            b.setDataNascita(r.getDate("data_di_nascita"));
            b.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            b.setClasse(r.getInt("classe"));
            b.setIscrizioneClasse(r.getString("iscrizione_classe"));
            Genitore gen=new Genitore();
           String g=r.getString("genitore");
           gen.setCodiceFiscale(g);
            b.setGenitore(gen);
            Genitore gg=new Genitore();
            String s=r.getString("cf_genitore_nonrichiedente");
            gg.setCodiceFiscale(s);
            b.setGenitoreNonRichiedente(gg);
            b.setComuneNascita(r.getString("comune_di_nascita"));
            b.setCittadinanza(r.getString("cittadinanza"));
            b.setIndirizzoResidenza(r.getString("indirizzo_residenza"));
            b.setIndirizzoDomicilio(r.getString("indirizzo_domicilio"));
            b.setNumeroCivicoResidenza(r.getString("numero_civico_residenza"));
            b.setNumeroCivicoDomicilio(r.getString("numero_civico_domicilio"));
            b.setProvinciaDomicilio(r.getString("provincia_domicilio"));
            b.setProvinciaResidenza(r.getString("provincia_residenza"));
            b.setComuneDomicilio(r.getString("comune_domicilio"));
            b.setCapResidenza(r.getString("cap_residenza"));
            b.setCapDomicilio(r.getString("cap_domicilio"));
            b.setIscrizioneClasse(r.getString("iscrizione_classe"));

            l.add(b);
            } 
            
            r.close();
            
        return l;
    }
    
    /**
     * Preso in input il codice fiscale di un Bambino , restituisce
     * una lista di stringhe con il codice fiscale del genitore e del
     * genitore non richiedente del bambino 
     * @param codiceFiscale codice fiscale del bambino di cui ricercare i genitori
     * @return lista di string o null
     * @throws SQLException
     */
    public List<String> getGenitoriBambino(String codiceFiscale) 
            throws SQLException {
        List<String> l=new ArrayList<String>();
        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM "
                + tabella.getNomeTabella() + " WHERE codice_fiscale= ?");
        tabella.setParam(stmt, 1, "codice_fiscale", codiceFiscale);
        ResultSet r = stmt.executeQuery();    
        
        if(r.next()){
         l.add(r.getString("genitore"));
         l.add(r.getString("cf_genitore_nonrichiedente"));
        return l;
        }
        else return null;
    }
    /**
     * Metodo utilizzato dagli altri metodi di DBBeans per ricavare le
     * assegnazioni predefinite relativamente a un bean.<br/>
     * Nella sua implementazione predefinita, questo metodo restituisce sempre
     * {@link #NESSUNA_ASSEGNAZIONE}. Le classi estendenti possono sovrascrivere
     * questo metodo per indicare in modo comodo delle assegnazioni predefinite
     * per tutti i metodi di modifica della base di dati.
     * 
     * @param bean
     *            Bean per cui valutare le assegnazioni
     * @return Array di assegnazioni
     */
    protected Assegnazione[] creaAssegnazioni(Bambino bean) {
        String gen_non_rich="";
        if(bean.getGenitoreNonRichiedente()!=null)
        {
            gen_non_rich=bean.getGenitoreNonRichiedente().getCodiceFiscale();
        }
        else
        {
            gen_non_rich=null;
        }
        
        Assegnazione DBBambino_assegnazione = new Assegnazione("cf_genitore_nonrichiedente",gen_non_rich);
        Assegnazione DBBambino_assegnazione1 = new Assegnazione("genitore",bean.getGenitore().getCodiceFiscale());
        Assegnazione DBBambino_assegnazione2 = new Assegnazione("classe",bean.getClasse());

        Assegnazione[] DBAssign = new Assegnazione[3];
       
        DBAssign[0]=DBBambino_assegnazione;
        DBAssign[1]=DBBambino_assegnazione1;
        DBAssign[2]=DBBambino_assegnazione2;

        return DBAssign;
    }



    
}
