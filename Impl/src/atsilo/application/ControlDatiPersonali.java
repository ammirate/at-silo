package atsilo.application;



import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import atsilo.entity.*;
import atsilo.exception.*;
import atsilo.storage.*;
import atsilo.stub.application.StubBambino;
import atsilo.stub.application.StubDomandaIscrizione;
import atsilo.stub.application.StubGenitore;
import atsilo.stub.application.StubUtente;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:

 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlDatiPersonali.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Elisa D'Eugenio,Angelo Scafuro 28/11/2012
 *-----------------------------------------------------------------
 */
public class ControlDatiPersonali {
    private static final ControlDatiPersonali INSTANCE = new ControlDatiPersonali();
    private static final Logger LOG = Logger.getLogger("global");


    /**
     * Contructor
     */
    public ControlDatiPersonali() {
    }


    /**
     * Prende lo stato di un'iscrizione: idoneo/non idoneo
     * @param id della domanda di iscrizione da verificare
     * @return stringa che riporti lo stato dell'iscrizione
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    public String getValoreStatoIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException{
        /* TODO
         * questo metodo è collegato ad un control di bassa priorità, per cui verrà implementato in seguito*/
        return "";
    }

    
    /**
     * Prende la classe genitore
     * @param codice fiscale del genitore da visualizzare
     * @return genitore
     * @throws DBConnectionException 
     * @throws GenitoreException
     * @throws SQLException 
     * @throws InserimentoDatiException 
     */
    public Genitore getDatiGenitore(String codiceFiscale) throws GenitoreException, DBConnectionException, SQLException, InserimentoDatiException{
        Database db = new Database();
        DBGenitore dbGenitore= new DBGenitore(db);
        
        //StubGenitore stub = new StubGenitore(db);//canc
        
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(codiceFiscale.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");   
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{            
            Genitore g = dbGenitore.getGenitorePerCF(codiceFiscale);
           
            if(g == null)
                throw new GenitoreException("Genitore non trovato");
            return g;
        }
        finally{
            db.chiudiConnessione();
        }
    }
   
    public Genitore getGenitoreFromUsername(String user) throws GenitoreException, DBConnectionException, SQLException, InserimentoDatiException{
        Database db = new Database();
        StubGenitore stub = new StubGenitore(db);
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{            
            Genitore g = stub.getGenitoreFromUsername(user);
           
            if(g == null)
                throw new GenitoreException("Genitore non trovato");
            return g;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    /**
     * Prende la classe bambino
     * @param codice fiscale del bambino da visualizzare
     * @return bambino
     * @throws DBConnectionException 
     * @throws BambinoException
     * @throws SQLException 
     * @throws InserimentoDatiException 
     */
    public Bambino getDatiBambino(String codiceFiscale) {
        Database db = new Database();
        DBBambino dbBambino= new DBBambino(db);

        //controllo sul codice fiscale che deve essere a 16 cifre
       
        Bambino b=null;
       
           
        try{
            db.apriConnessione();
            b = dbBambino.ricercaBambinoPerCodFiscale(codiceFiscale);
            
        
    } catch (SQLException e) {
        // TODO Blocco di catch autogenerato
        LOG.log(Level.SEVERE, "Errore query", e.getMessage());
        return b;
    }
        
        finally{
            db.chiudiConnessione();
        }
        return b;
        
    }
    
    /**
     * Prende i valori di un utente
     * @param codice fiscale dell'utente visualizzare
     * @return utente
     * @throws DBConnectionException 
     * @throws UtenteException
     * @throws InserimentoDatiException 
     */
    public Utente getValoriUtenteFromCf(String cf) throws UtenteException, DBConnectionException, InserimentoDatiException{
        Database db = new Database();
        StubUtente stub = new StubUtente(db);
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(cf.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");
                
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            Utente u = stub.ricercaUtente(cf);
            if(u == null)
                throw new UtenteException("Utente non trovato");
            return u;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    /**
     * Ricerca utente tramite lo username dell'account
     * @param username
     * @return
     * @throws UtenteException
     * @throws DBConnectionException
     * @throws InserimentoDatiException
     */
    public Utente getValoriUtente(String username) throws DBConnectionException {
        Database db = new Database();
        DBAccount dbAccount= new DBAccount(db);
        Account account_chiamante = null;
        Utente utente;
        
        try {
            db.apriConnessione();
            account_chiamante = dbAccount.ricercaPerUsername(username);
            utente=account_chiamante.getOwner();
      
            
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Errore query", e.getMessage());
            return new Utente();
        }
        finally{
            db.chiudiConnessione();
        }
        return utente;
 
    }
    
    /**
     * Modifica i certificati di iscrizione
     * @param id del certificato di iscrizione e valori booleani dei certificati da inserire
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws BambinoException 
     * @throws InserimentoDatiException 
     * @throws DomandaIScrizioneException
     */
    public boolean completaIscrizione(String cf, String vaccinazioni, String malattie, String privacy) throws DomandaIscrizioneException, DBConnectionException, BambinoException, InserimentoDatiException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        StubBambino stub2 = new StubBambino(db);
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(cf.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Bambino b = stub2.ricercaBambino(cf);
            if(b == null)
                throw new BambinoException("Bambino non trovato");
            int id = stub.ricercaDomandaDaBambino(b);
            DomandaIscrizione domandaIscrizioneDaModificare = stub.ricercaDomandaPerId(id);
            if(domandaIscrizioneDaModificare == null)
                throw new DomandaIscrizioneException("Domanda non trovata");
            DomandaIscrizione domandaIscrizione = stub.ricercaDomandaPerId(id);
            
            //vengono modificati i campi interessati ai certificati
            if(vaccinazioni != null)
               domandaIscrizione.setCertificatoVaccinazioni(vaccinazioni);
            if(malattie != null)
               domandaIscrizione.setCertificatoMalattie(malattie);
            if(privacy != null)
               domandaIscrizione.setCertificatoPrivacy(privacy);
            
            if(!stub.replace(domandaIscrizioneDaModificare, domandaIscrizione))
                throw new DomandaIscrizioneException("Modifica fallita");
            return true;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Convalida una domanda di iscrizione
     * @param id della domanda di iscrizione
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    public boolean convalidaIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            DomandaIscrizione domandaIscrizioneDaModificare = stub.ricercaDomandaPerId(id);
            if(domandaIscrizioneDaModificare == null)
                throw new DomandaIscrizioneException("Domanda non trovata");
            DomandaIscrizione domandaIscrizione = stub.ricercaDomandaPerId(id);
            //Supponendo che ci sia un campo convalida in domanda iscrizione           
            //domanaIsczizione.setConvalida(true);
            if(!stub.replace(domandaIscrizioneDaModificare, domandaIscrizione))
                throw new DomandaIscrizioneException("Modifica fallita");
            return true;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * riceve nuovi dati della domanda iscrizione
     * @param id della domanda di iscrizione
     * @param i dati della nuova domanda iscrizione
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    public boolean completaIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException{
        /*
         * TODO
         * questo control è legato ad un control con bassa priorità ancora da implementare */
        return true;
    }
    
    
    /**
     * Ricerca le domande in attesa di convalida
     * @return domande in attesa di convalide
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    public List<DomandaIscrizione> getValoriIscrizioniNonConvalidate() throws DomandaIscrizioneException, DBConnectionException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<DomandaIscrizione> b = stub.ricercaDomandeInAttesa();
            if(b.isEmpty())
                throw new DomandaIscrizioneException("Lista vuota");
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Esclude una domanda d'iscrizione
     * @param id della domanda di iscrizione
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    public Boolean escludiIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            DomandaIscrizione domandaIscrizioneDaModificare = stub.ricercaDomandaPerId(id);
            if(domandaIscrizioneDaModificare == null)
                throw new DomandaIscrizioneException("Domanda non trovata");
            DomandaIscrizione domandaIscrizione = stub.ricercaDomandaPerId(id);        
            //domanaIsczizione.setConvalida(false);
            if(!stub.replace(domandaIscrizioneDaModificare, domandaIscrizione))
                throw new DomandaIscrizioneException("Modifica fallita");
            return true;
        }
        finally{
            db.chiudiConnessione();
        }
    }
       
   /* 
    /**
    * Restituisce il cf dei bambini associati all account con username in input
    * @return
     * @throws BambinoException 
     * @throws DBConnectionException 
    */
   /* public List<String> getCfBambini(String username) throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{        
            List<String> cf= stub.ricercaCfBambiniPerUsername(username);
            if(cf.isEmpty())
                throw new BambinoException("Bambini non trovati");    
            return cf;
        }
        finally{
            db.chiudiConnessione();
        }
    }*/
    
    public List<Bambino> getFigli(String cf_genitore){
        Database db = new Database();
        DBBambino dbBambino=new DBBambino(db);
        
       db.apriConnessione();
       List<Bambino> cf=null;
           
        try{        
            cf= dbBambino.ricercaFigliGenitore(cf_genitore);
            
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Sql Error", e);
        }
        finally{
            db.chiudiConnessione();
        }
        return cf;
    }
    
    /**
     * Restituisce domanda iscrizione fatta da genitore con username=username 
     * @param username username dell'account di cui si desiderano i dati dell iscriizone
     * @param cfBambino codice fiscale del bambino di cui si vogliono i dati della domanda di iscrizione, se null verranno passati tutti i dati della domanda fino ad ora inseriti, tranne il bambino collegato alla domanda
     *        
     * @return dati domanda di iscrizione: se cfBambino è null restituire solo i dati collegati all'account (Dati genitori e situazione reddituale, senza i dati dei bambini e la situazione familiare)
     *                                     se cfBambino diverso da null restituire tutti i dati compresi quelli del bambino e la sitauzione familiare
     *                                     se Domanda non esiste restituire null
     * @throws DomandaIscrizioneException 
     * @throws DBConnectionException 
     * @throws InserimentoDatiException 
     */
    public DomandaIscrizione getDatiIscrizione(String username,String cfBambino) {
        Database db = new Database();
        DBDomandaIscrizione dbDomandaIscrizione = new DBDomandaIscrizione(db);
        DomandaIscrizione domandaIscrizione=null;
        
        db.apriConnessione();
       
        if (cfBambino==null){
            List<DomandaIscrizione> a;
            try {
                a = dbDomandaIscrizione.ricercaDomandaDaGenitore(getGenitoreFromUsername(username));
                if (a.size()>0)
                    domandaIscrizione= a.get(1);
            } catch (SQLException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (GenitoreException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (DBConnectionException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (InserimentoDatiException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            }
            
        }
        /* 
        else{
            List<DomandaIscrizione> a = dbDomandaIscrizione.ricercaDomandaDaBambino(getDatiBambino(cfBambino));
            if (a.size()>0)
                domandaIscrizione= a.get(1);//restituisce la domanda fatta dal genitore
            
        }
        */
        
        
            db.chiudiConnessione();
       return domandaIscrizione;
    }
    
    /**
     * Gets the single istance of this class
     * @return a new ControlDatiPersonali
     */
    public static ControlDatiPersonali getIstance(){
        return INSTANCE;
    }
    
  
}
