package atsilo.application;


import test.storage.*;
import atsilo.entity.*;
import atsilo.exception.*;
import atsilo.storage.Database;

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
     * TODO
     */
    String getValoreStatoIscrizione(Bambino bambino) {
        /**
         * Non è ancora possibile implementare questo metodo in quanto mancano alcuni attributi nell'entità bando
         */
        return null;
    }

    
    /**
     * Prende la classe genitore
     * @param genitore da visualizzare
     * @return genitore
     * @throws DBConnectionException 
     * @throws GenitoreException
     */
    Genitore getDatiGenitore(Genitore genitore) throws GenitoreException, DBConnectionException{
        Database db = new Database();
        StubGenitore stub = new StubGenitore(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            Genitore g = stub.ricercaGenitore(genitore);
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
     * @param bambino da visualizzare
     * @return bambino
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    Bambino getDatiBambino(Bambino bambino) throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            Bambino b = stub.ricercaBambino(bambino);
            if(b == null)
                throw new BambinoException("Bambino non trovato");
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Inserisce una Domanda di Iscrizione
     * @param domanda di iscrizione da visualizzare
     * @return domanda di iscrizione
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    public void inserisciDomandaIscrizione(DomandaIscrizione domandaIscrizione) throws DomandaIscrizioneException, DBConnectionException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!stub.inserisciDomandaIscizione(domandaIscrizione))
                throw new DomandaIscrizioneException("Inserimento fallito");
        }
        finally{
            db.chiudiConnessione();
        }
    }
     
    
    /**
     * Elimina una domanda di iscrizione
     * @param domanda di iscrizione da eliminare
     * @return domanda di iscrizione
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    public DomandaIscrizione eliminaDomandaIscrizione(DomandaIscrizione domandaIscrizione) throws DomandaIscrizioneException, DBConnectionException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            DomandaIscrizione toReturn = stub.rimuoviDomandaIscizione(domandaIscrizione);
            if(toReturn==null)
                throw new DomandaIscrizioneException("Domanda di iscrizione inesistente");
            return toReturn;
        }
        finally{
            db.chiudiConnessione();
        } 
    }
    
    
    /**
     * Elimina un iscritto
     * @param iscritto(bambino) da eliminare
     * @return bambino
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    public Bambino eliminaIscritto(Bambino bambino) throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Bambino toReturn = stub.rimuoviIscritto(bambino);
            if(toReturn==null)
                throw new BambinoException("Iscritto inesistente");
            return toReturn;
        }
        finally{
            db.chiudiConnessione();
        } 
    }
    
    
    /**
     * Inserisce genitore
     * @param genitore da inserire
     * @return 
     * @throws DBConnectionException 
     * @throws GenitoreException
     */
    public void inserisciGenitore(Genitore genitore) throws GenitoreException, DBConnectionException{
        Database db = new Database();
        StubGenitore stub = new StubGenitore(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!stub.inserisciGenitore(genitore))
                throw new GenitoreException("Inserimento fallito");
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    /**
     * Prende i valori di un utente
     * @param utente visualizzare
     * @return utente
     * @throws DBConnectionException 
     * @throws UtenteException
     */
    public Utente getValoriUtente(Utente utente) throws UtenteException, DBConnectionException{
        Database db = new Database();
        StubUtente stub = new StubUtente(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            Utente u = stub.ricercaUtente(utente);
            if(u == null)
                throw new UtenteException("Utente non trovato");
            return u;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Prende la classe genitore
     * @param genitore da visualizzare
     * @return genitore
     * @throws DBConnectionException 
     * @throws GenitoreException
     */
    //da completare
    public boolean modificaCertificatiIscrizione(DomandaIscrizione domandaIscrizione) throws DomandaIscrizioneException, DBConnectionException{
        return true;
    }
    
    
    /**
     * Prende la classe genitore
     * @param genitore da visualizzare
     * @return genitore
     * @throws DBConnectionException 
     * @throws GenitoreException
     */
    //da completare
    public boolean convalidaIscrizione(DomandaIscrizione domandaIscrizione) throws DomandaIscrizioneException, DBConnectionException{
        return true;
    }
    
    
    /**
     * Prende la classe genitore
     * @param genitore da visualizzare
     * @return genitore
     * @throws DBConnectionException 
     * @throws GenitoreException
     */
    //da completare
    public boolean completaIscrizione(DomandaIscrizione domandaIscrizione) throws DomandaIscrizioneException, DBConnectionException{
        return true;
    }
    
    
    /**
     * Prende la classe genitore
     * @param genitore da visualizzare
     * @return genitore
     * @throws DBConnectionException 
     * @throws GenitoreException
     */
    //da completare
    public DomandaIscrizione getValoriIscrizioniNonConvalidate() throws DomandaIscrizioneException, DBConnectionException{
        return null;
    }
    
    
    /**
     * Prende la classe genitore
     * @param genitore da visualizzare
     * @return genitore
     * @throws DBConnectionException 
     * @throws GenitoreException
     */
    //da completare
    public DomandaIscrizione escludiIscrizione(DomandaIscrizione domandaIscrizione) throws DomandaIscrizioneException, DBConnectionException{
        return null;
    }
       
    
    /**
     * Gets the single istance of this class
     * @return a new ControlDatiPersonali
     */
    public static ControlDatiPersonali getIstance(){
        return INSTANCE;
    }
}
