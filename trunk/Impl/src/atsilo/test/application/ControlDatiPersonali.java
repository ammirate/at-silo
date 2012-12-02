package atsilo.test.application;


import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import test.storage.*;
import atsilo.entity.*;
import atsilo.exception.*;
import atsilo.storage.*;

/**
 * 
 * Servlet implementation class ControlDatiPersonali
 * <Descrizione classe>
 * 
 * @author Angelo G. Scafuro
 *
 */
public class ControlDatiPersonali {
    private static final ControlDatiPersonali INSTANCE = new ControlDatiPersonali();

    /**
     * Contructor
     */
    ControlDatiPersonali() {
    }


    /**
     * Prende lo stato di un'iscrizione
     * @param domanda di iscrizione da eliminare
     * @return domanda di iscrizione
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    String getValoreStatoIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            String stato = stub.verificaStato(id);
            if(stato.equals(""))
                throw new DomandaIscrizioneException("Domanda di iscrizione non trovata");
            return stato;
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
     * @throws SQLException 
     */
    Genitore getDatiGenitore(String codiceFiscale) throws GenitoreException, DBConnectionException, SQLException{
        Database db = new Database();
        DBGenitore genitore = new DBGenitore(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            Genitore g = genitore.ricercaGenitoreCf(codiceFiscale);
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
     * @throws SQLException 
     */
    Bambino getDatiBambino(String codiceFiscale) throws BambinoException, DBConnectionException, SQLException{
        Database db = new Database();
        DBBambino bambino = new DBBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Bambino b = bambino.ricercaBambinoPerCodFiscale(codiceFiscale);
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
    //ATTENDO di sapere queli parametri mi verranno passati
    public void inserisciDomandaIscrizione() throws DomandaIscrizioneException, DBConnectionException{
        Database db = new Database();
        DomandaIscrizione domandaIscrizione = new DomandaIscrizione();
        DBDomandaIscrizione di = new DBDomandaIscrizione(db);
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!di.inserisci(domandaIscrizione))
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
     * @throws SQLException 
     */
    public DomandaIscrizione eliminaDomandaIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException, SQLException{
        Database db = new Database();
        DBDomandaIscrizione di = new DBDomandaIscrizione(db);
       
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            DomandaIscrizione domandaIscrizione = di.ricercaDomandaDaId(id);
            if(domandaIscrizione == null)
                throw new DomandaIscrizioneException("Domanda di iscrizione inesistente");
            Boolean toReturn = di.delete(domandaIscrizione);
            if(!toReturn)
                throw new DomandaIscrizioneException("Cancellazione domanda di iscrizione fallita");
            return domandaIscrizione;
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
     * @throws SQLException 
     */
    public Bambino eliminaIscritto(String cf) throws BambinoException, DBConnectionException, SQLException{
        Database db = new Database();
        DBBambino b = new DBBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Bambino bambino = b.ricercaBambinoPerCodFiscale(cf);
            if(bambino == null)
                throw new BambinoException("Bambino inesistente");
            Boolean toReturn = b.delete(bambino);
            if(!toReturn)
                throw new BambinoException("Cancellazione bambino fallita");
            return bambino;
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
    public void inserisciGenitore(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String residenza, String tipo, List<Bambino> figli,
            List<Questionario> questionariCompilati) throws GenitoreException, DBConnectionException{
        Database db = new Database();
        DBGenitore g = new DBGenitore(db);
        Genitore genitore = new Genitore(dataNascita, nome, cognome, codiceFiscale, email, comuneNascita,
                telefono, residenza, tipo, figli, questionariCompilati);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!g.inserisci(genitore))
                throw new GenitoreException("Inserimento fallito");
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    /**
     * 
     * @param cf
     * @return
     */
    public boolean createUtente(String cf){
        return true;
    }
     
    /**
     * Restituisce un account associato al cf
     * @param cf
     * @return
     */
    public Account getAccount(String cf){
        Account a=new Account();
        a.setUserName("Angelo");
        a.setPassWord("passwordAngelo");
        return a;
    }
  
    
    /**
     * 
     * @param utente visualizzare
     * @return utente
     * @throws DBConnectionException 
     * @throws UtenteException
     */
    public Utente getValoriUtente(Utente utente) throws UtenteException, DBConnectionException{
        Database db = new Database();
        StubUtente stub = new StubUtente(db);
        
        if(!db.apriConnessione())
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
