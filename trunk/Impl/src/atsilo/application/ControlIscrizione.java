package atsilo.application;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import test.storage.StubAccount;
import test.storage.StubBambino;
import test.storage.StubDomandaIscrizione;
import test.storage.StubGenitore;
import test.storage.StubUtente;
import atsilo.entity.Account;
import atsilo.entity.Assenza;
import atsilo.entity.Bambino;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;
import atsilo.entity.Questionario;
import atsilo.entity.Utente;
import atsilo.exception.AccountException;
import atsilo.exception.BambinoException;
import atsilo.exception.DBConnectionException;
import atsilo.exception.DomandaIscrizioneException;
import atsilo.exception.GenitoreException;
import atsilo.exception.UtenteException;
import atsilo.storage.Database;

public class ControlIscrizione {

    private static final ControlIscrizione ISTANCE = new ControlIscrizione();

    /**
     * crea un account, verificando che non ce ne sia giù uno esistente con il codice fiscale inserito
     * @param codice fiscale, username, dati generici dell'utente
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws UtenteException
     * @throws AccountException
     */
    Boolean creaAccount(String cf, String username, Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String residenza) throws AccountException, DBConnectionException, UtenteException{
        Database db = new Database();
        StubAccount stub = new StubAccount(db); 
        StubUtente stub2 = new StubUtente(db);
        if(stub2.ricercaUtente(cf) != null)
            throw new AccountException("L'utente esite già");
        //Si suppone che la password sia un codice numerico composto di 8 cifre, si suppone.. intero
        Random generatore = new Random(8);
        int password = generatore.nextInt(10000001) + 99999999;
        String psw = "" + password;
        
        //Credo che in questa prima fase vengano messi tutti i dati relativi all'entità utente 
        Utente utente = new Utente(dataNascita, nome, cognome, codiceFiscale, email, comuneNascita,
                telefono, residenza);
        
        Account account = new Account(username, psw, utente);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!stub2.inserisci(utente))
                throw new UtenteException("Inserimento fallito");
            if(!stub.inserisci(account))
                throw new AccountException("Inserimento fallito");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
    }
    
    
    /**
     * ricerca un account
     * @param codice fiscale dell'accout da visualizzare
     * @return Account da visualizzare
     * @throws DBConnectionException 
     * @throws SQLException
     * @throws AccountException
     */
    Account getAccount(String codiceFiscale) throws AccountException, SQLException, DBConnectionException{
        Database db = new Database();
        StubAccount stub = new StubAccount(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{            
            Account a = stub.ricercaAccount(codiceFiscale);
            if(a == null)
                throw new AccountException("Account non trovato");
            return a;
        }
        finally{
            db.chiudiConnessione();
        }
    }


    /**
     * ricerca una domanda di iscrizione
     * @param id della domanda da visualizzare
     * @return Domanda di iscrizione da visualizzare
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    DomandaIscrizione getDomanda(int id) throws DomandaIscrizioneException, DBConnectionException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{            
            DomandaIscrizione di = stub.ricercaDomandaPerId(id);
            if(di == null)
                throw new DomandaIscrizioneException("Domanda di iscrizione non trovato");
            return di;
        }
        finally{
            db.chiudiConnessione();
        }
    }

    
    /**
     * inserisce bambino nel db
     * @param dati del bambino da inserire
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    boolean inserisciIscritto(String nome, Date dataNascita, String categoriaAppartenenza,
            String indirizzo, int classe, String cognome, Genitore genitore,
            String codiceFiscale, List<Assenza> assenze) throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db); 
        Bambino bambino = new Bambino(nome, dataNascita, categoriaAppartenenza, indirizzo, classe, cognome, 
                genitore, codiceFiscale, assenze);
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!stub.inserisci(bambino))
                throw new BambinoException("Inserimento fallito");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
        
    }

    
    /**
     * Inserisce una Domanda di Iscrizione
     * @param parametri necessaria alla creazione della domanda di iscrizione 
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    //ATTENDO di sapere queli parametri mi verranno passati
    public boolean inserisciDomandaIscrizione(String dataPresentazione, int iD, int punteggio,
            String posizione, Genitore genitore, Bambino bambino) throws DomandaIscrizioneException, DBConnectionException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db); 
        DomandaIscrizione domandaIscrizione = new DomandaIscrizione(dataPresentazione, iD, punteggio,
                posizione, genitore, bambino);
        //DBDomandaIscrizione di = new DBDomandaIscrizione(db);
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!stub.inserisci(domandaIscrizione))
                throw new DomandaIscrizioneException("Inserimento fallito");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
    }

    
    /**
     * Elimina una domanda di iscrizione
     * @param id della domanda di iscrizione da eliminare
     * @return domanda di iscrizione
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     * @throws SQLException 
     */
    public DomandaIscrizione eliminaDomandaIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException, SQLException{
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        //DBDomandaIscrizione di = new DBDomandaIscrizione(db);
       
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            DomandaIscrizione domandaIscrizione = stub.ricercaDomandaPerId(id);
            if(domandaIscrizione == null)
                throw new DomandaIscrizioneException("Domanda di iscrizione inesistente");
            Boolean toReturn = stub.delete(domandaIscrizione);
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
     * @return codice fiscale del bambino
     * @throws DBConnectionException 
     * @throws BambinoException
     * @throws SQLException 
     */
    public Bambino eliminaIscritto(String cf) throws BambinoException, DBConnectionException, SQLException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        //DBBambino b = new DBBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Bambino bambino = stub.ricercaBambino(cf);
            if(bambino == null)
                throw new BambinoException("Bambino inesistente");
            Boolean toReturn = stub.delete(bambino);
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
     * @param tutti i dati necessari del genitore da inserire
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws GenitoreException
     */
    public boolean inserisciGenitore(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String residenza, String tipo, List<Bambino> figli,
            List<Questionario> questionariCompilati) throws GenitoreException, DBConnectionException{
        Database db = new Database();
        StubGenitore stub = new StubGenitore(db);
        //DBGenitore g = new DBGenitore(db);
        Genitore genitore = new Genitore(dataNascita, nome, cognome, codiceFiscale, email, comuneNascita,
                telefono, residenza, tipo, figli, questionariCompilati);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!stub.inserisciGenitore(genitore))
                throw new GenitoreException("Inserimento fallito");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
    }
    
    
    /**
     * Prende lo stato di un'iscrizione: idoneo/non idoneo
     * @param id della domanda di iscrizione da verificare
     * @return stringa che riporti lo stato dell'iscrizione
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    String visualizzaStatoIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException{
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

    ControlIscrizione() {
    }

    public static ControlIscrizione getIstance() {
        return null;
    }
    
}

