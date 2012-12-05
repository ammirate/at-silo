package atsilo.application;



import java.sql.SQLException;
import java.util.List;

import test.storage.*;
import atsilo.entity.*;
import atsilo.exception.*;
import atsilo.storage.*;

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
    ControlDatiPersonali() {
    }


    /**
     * Prende lo stato di un'iscrizione: idoneo/non idoneo
     * @param id della domanda di iscrizione da verificare
     * @return stringa che riporti lo stato dell'iscrizione
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    String getValoreStatoIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException{
        /* I dati mostrati dal sistema sono: lo stato dell'iscrizione, 
         * se attivo o meno, saldo pagamenti, prossimo pagamento, 
         * eventuali ritardi nei pagamenti, infine una parte dedicata ad avvisi vari.
         * Non trovo queste informazioni nelle entity, non so come comportarmi*/
        return "";
    }

    
    /**
     * Prende la classe genitore
     * @param codice fiscale del genitore da visualizzare
     * @return genitore
     * @throws DBConnectionException 
     * @throws GenitoreException
     * @throws SQLException 
     */
    Genitore getDatiGenitore(String codiceFiscale) throws GenitoreException, DBConnectionException, SQLException{
        Database db = new Database();
        StubGenitore stub = new StubGenitore(db);
        //DBGenitore genitore = new DBGenitore(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{            
            Genitore g = stub.ricercaGenitore(codiceFiscale);
            //Genitore g = genitore.ricercaGenitoreCf(codiceFiscale);
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
     */
    Bambino getDatiBambino(String codiceFiscale) throws BambinoException, DBConnectionException, SQLException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        //DBBambino bambino = new DBBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Bambino b = stub.ricercaBambino(codiceFiscale);
            //Bambino b = bambino.ricercaBambinoPerCodFiscale(codiceFiscale);
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
     */
    public Utente getValoriUtente(String cf) throws UtenteException, DBConnectionException{
        Database db = new Database();
        StubUtente stub = new StubUtente(db);
        
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
    //da completare
    public boolean modificaCertificatiIscrizione(int id, Boolean vaccinazioni, Boolean malattie, Boolean privacy) throws DomandaIscrizioneException, DBConnectionException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            DomandaIscrizione domandaIscrizioneDaModificare = stub.ricercaDomandaPerId(id);
            if(domandaIscrizioneDaModificare == null)
                throw new DomandaIscrizioneException("Domanda non trovata");
            DomandaIscrizione domandaIscrizione = stub.ricercaDomandaPerId(id);
            //si presume che la domanda iscrizione contenga tre valodi booleani relativo ai tre certificati
            //domanaIsczizione.setCertificatoVaccinazioni(vaccinazioni);
            //domanaIsczizione.setCertificatoMalattie(malattie);
            //domanaIsczizione.setCertificatoPrivacy(privacy);
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
    // qui si dovrebbero inserire tipo di servizio desiderato e situazione sanitaria del bambino, ma non so cosa si intende
    //se per situazione sanitaria intendiamo i tre tipo di certificati, allora per quello esiste già un metodo
    public boolean completaIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException{
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
            if(b == null)
                throw new DomandaIscrizioneException("Bambino non trovato");
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
