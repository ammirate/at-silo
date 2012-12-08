package atsilo.application;



import java.sql.SQLException;
import java.util.List;
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
 * Elisa D'Eugenio, 28/11/2012
 *-----------------------------------------------------------------
 */
public class ControlDatiPersonali {
    private static final ControlDatiPersonali INSTANCE = new ControlDatiPersonali();

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
        StubGenitore stub = new StubGenitore(db);

        //controllo sul codice fiscale che deve essere a 16 cifre
        if(codiceFiscale.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");   
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{            
            Genitore g = stub.ricercaGenitore(codiceFiscale);
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
    public Bambino getDatiBambino(String codiceFiscale) throws BambinoException, DBConnectionException, SQLException, InserimentoDatiException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);

        //controllo sul codice fiscale che deve essere a 16 cifre
        if(codiceFiscale.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");
   
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Bambino b = stub.ricercaBambino(codiceFiscale);
            if(b == null)
                throw new BambinoException("Bambino non trovato");
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    /**
     * Prende i valori di un utente
     * @param codice fiscale dell'utente visualizzare
     * @return utente
     * @throws DBConnectionException 
     * @throws UtenteException
     * @throws InserimentoDatiException 
     */
    public Utente getValoriUtente(String cf) throws UtenteException, DBConnectionException, InserimentoDatiException{
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
     * Modifica i certificati di iscrizione
     * @param id del certificato di iscrizione e valori booleani dei certificati da inserire
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws DomandaIScrizioneException
     */
    public boolean modificaCertificatiIscrizione(int id, String vaccinazioni, String malattie, String privacy) throws DomandaIscrizioneException, DBConnectionException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
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
       
    
    /**
     * Gets the single istance of this class
     * @return a new ControlDatiPersonali
     */
    public static ControlDatiPersonali getIstance(){
        return INSTANCE;
    }
    
  
}
