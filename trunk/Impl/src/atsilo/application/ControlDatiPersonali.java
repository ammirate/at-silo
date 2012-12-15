package atsilo.application;


import java.sql.Date;
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
     * @todo da implementare e modificare
     * Inserisce genitore
     * @param tutti i dati necessari del genitore da inserire
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws GenitoreException
     * @throws InserimentoDatiException 
     */
    public boolean inserisciGenitore(String username,Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, List<Bambino> figli,
            List<Questionario> questionariCompilati, String tipo, String dipendentePresso,
            String rapportiAteneoSalerno, String rapportiComuneFisciano,
            String statusLavorativo, Date scadenzaContratto, String categoriaAppartenenza,
            String rapportoParentela,String condizioneLavorativa, String tipoContratto) throws GenitoreException, DBConnectionException, InserimentoDatiException{
        
        Database db = new Database();
        StubGenitore stub = new StubGenitore(db);
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(codiceFiscale.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");
        
        //controllo sulla mail
        Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
        Matcher m = p.matcher(email);
        boolean matchFound = m.matches();
        if (!matchFound)
            throw new InserimentoDatiException("La mail inserita non è valida");
        
        //controllo sul cap, in attesa di sapere se può essere un numero o una stringa
        if(capDomicilio.length() != 5)
            throw new InserimentoDatiException("Il cap del domicilio non è valido");
        if(capResidenza.length() != 5)
            throw new InserimentoDatiException("Il cap della residenza non è valido");
        
        Genitore genitore = new Genitore(dataNascita, nome, cognome, codiceFiscale, email, 
                comuneNascita, telefono, cittadinanza, indirizzoResidenza, numeroCivicoResidenza, 
                capResidenza, comuneResidenza, provinciaResidenza, indirizzoDomicilio, numeroCivicoDomicilio,
                capDomicilio, comuneDomicilio, provinciaDomicilio, figli, questionariCompilati, tipo, 
                dipendentePresso, rapportiAteneoSalerno, rapportiComuneFisciano,
                statusLavorativo, scadenzaContratto, categoriaAppartenenza, rapportoParentela, condizioneLavorativa, tipoContratto);
        
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
     * Prende la classe genitore
     * 
     * @param codice
     *            fiscale del genitore da visualizzare
     * @return genitore
     * @throws DBConnectionException
     * @throws GenitoreException
     * @throws SQLException
     * @throws InserimentoDatiException
     */
    public Genitore getDatiGenitore(String codiceFiscale) {
        Database db = new Database();
        DBGenitore dbGenitore = new DBGenitore(db);
        Genitore genitore = null;
        try {
            db.apriConnessione();
            
            try {
                genitore = dbGenitore.getGenitorePerCF(codiceFiscale);
            } catch (SQLException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            }
        } finally {
            db.chiudiConnessione();
        }
        return genitore;
    }
    
    /**
     * 
     * @param username
     * @return
     * @throws GenitoreException
     * @throws DBConnectionException
     * @throws SQLException
     * @throws InserimentoDatiException
     */
    public Genitore getGenitoreFromUsername(String username)
            throws GenitoreException, DBConnectionException, SQLException,
            InserimentoDatiException {
        Database db = new Database();
        DBGenitore dbGenitore = new DBGenitore(db);
        DBAccount dbAccount = new DBAccount(db);
        Account account = dbAccount.ricercaPerUsername(username);
        
        
        // controllo sul codice fiscale che deve essere a 16 cifre
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            Genitore g = dbGenitore.getGenitorePerCF(account.getOwner()
                    .getCodiceFiscale());
            
            if (g == null)
                throw new GenitoreException("Genitore non trovato");
            return g;
        } finally {
            db.chiudiConnessione();
        }
    }
    /** Restituisce il cf dei bambini associati all account con username in
     * input
     * 
     * @return
     * 
     * @throws BambinoException
     * 
     * @throws DBConnectionException
     */
    /*
     * public List<String> getCfBambini(String username) throws
     * BambinoException, DBConnectionException{ Database db = new Database();
     * StubBambino stub = new StubBambino(db);
     * 
     * if(!db.apriConnessione()) throw new
     * DBConnectionException("Connessione al DB fallita"); try{ List<String> cf=
     * stub.ricercaCfBambiniPerUsername(username); if(cf.isEmpty()) throw new
     * BambinoException("Bambini non trovati"); return cf; } finally{
     * db.chiudiConnessione(); } }
     */
    
    public List<Bambino> getFigli(String cf_genitore) {
        Database db = new Database();
        DBBambino dbBambino = new DBBambino(db);
        
        db.apriConnessione();
        List<Bambino> lista = null;
        
        try {
            lista = dbBambino.ricercaFigliGenitore(cf_genitore);
            
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Sql Error", e);
        } finally {
            db.chiudiConnessione();
        }
        return lista;
    }
    
    
    /**
     * @todo DA MODIFICARE !
     * inserisce bambino nel db
     * @param dati del bambino da inserire
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws BambinoException
     * @throws InserimentoDatiException 
     */
    public boolean inserisciBambino(String username,Date dataNascita, String nome, String cognome,
            String codiceFiscale,  String comuneNascita,
            String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, String categoriaAppartenenza, int classe, Genitore genitore_richiedente, List<Assenza> assenze) throws BambinoException, DBConnectionException, InserimentoDatiException{
        
        Database db = new Database();
        StubBambino stub = new StubBambino(db); 
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(codiceFiscale.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");
        
        //controllo sul cap, in attesa di sapere se può essere un numero o una stringa
        if(capDomicilio.length() != 5)
            throw new InserimentoDatiException("Il cap del domicilio non è valido");
        if(capResidenza.length() != 5)
            throw new InserimentoDatiException("Il cap della residenza non è valido");
        
        Bambino bambino = new Bambino(dataNascita, nome, cognome, codiceFiscale, comuneNascita,
                cittadinanza, indirizzoResidenza, numeroCivicoResidenza, capResidenza, comuneResidenza,
                provinciaResidenza, indirizzoDomicilio, numeroCivicoDomicilio, capDomicilio, comuneDomicilio, 
                provinciaDomicilio, categoriaAppartenenza, classe, genitore, genitoreNonRichiedente, assenze, iscrizioneClasse);
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
     * Elimina un iscritto
     * @param iscritto(bambino) da eliminare
     * @return codice fiscale del bambino
     * @throws DBConnectionException 
     * @throws BambinoException
     * @throws SQLException 
     * @throws InserimentoDatiException 
     */
    public Bambino eliminaBambino(String cf) throws BambinoException, DBConnectionException, SQLException, InserimentoDatiException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(cf.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");
        
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
     * Prende la classe bambino
     * 
     * @param codice
     *            fiscale del bambino da visualizzare
     * @return bambino
     * @throws DBConnectionException
     * @throws BambinoException
     * @throws SQLException
     * @throws InserimentoDatiException
     */
    public Bambino getDatiBambino(String codiceFiscale) {
        Database db = new Database();
        DBBambino dbBambino = new DBBambino(db);
        
        // controllo sul codice fiscale che deve essere a 16 cifre
        
        Bambino b = null;
        
        
        try {
            db.apriConnessione();
            b = dbBambino.ricercaBambinoPerCodFiscale(codiceFiscale);
            
            
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Errore query", e.getMessage());
            return b;
        }
        
        finally {
            db.chiudiConnessione();
        }
        return b;
        
    }
    
    /**
     * Prende i valori di un utente
     * 
     * @param codice
     *            fiscale dell'utente visualizzare
     * @return utente
     * @throws DBConnectionException
     * @throws UtenteException
     * @throws InserimentoDatiException
     */
    public Utente getValoriUtenteFromCf(String cf) throws UtenteException,
    DBConnectionException, InserimentoDatiException {
        Database db = new Database();
        StubUtente stub = new StubUtente(db);
        
        // controllo sul codice fiscale che deve essere a 16 cifre
        if (cf.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            
            Utente u = stub.ricercaUtente(cf);
            if (u == null)
                throw new UtenteException("Utente non trovato");
            return u;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    /**
     * Ricerca utente tramite lo username dell'account
     * 
     * @param username
     * @return
     * @throws UtenteException
     * @throws DBConnectionException
     * @throws InserimentoDatiException
     */
    public Utente getValoriUtente(String username) throws DBConnectionException {
        Database db = new Database();
        DBAccount dbAccount = new DBAccount(db);
        DBGenitore dbGenitore = new DBGenitore(db);
        
        Account account_chiamante = null;
        Utente utente = new Utente();
        
        try {
            db.apriConnessione();
            account_chiamante = dbAccount.ricercaPerUsername(username);
            String cf = account_chiamante.getOwner().getCodiceFiscale();// codice
            // fiscale
            // account
            
            // aggiungere controlli per altre tipologie di utente
            if (dbGenitore.getGenitorePerCF(cf) != null)
                utente = dbGenitore.getGenitorePerCF(cf);
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Errore query", e.getMessage());
            return utente;
        } finally {
            db.chiudiConnessione();
        }
        return utente;
        
    }
    
    
    
    /*@todo da implementare e richiamare istruzione per inviare email all'utente, dopo la creazione dell'account*/
    /**Crea un account, crea una nuova entità genitore e vi associa l'account
     * @param cf
     * @return
     */
    public boolean createAccount(String cf,String nome,String cognome,String mail, String telefono,String profilo_appartenenza) {
        // TODO Scheletro generato automaticamente
        return false;
    }
    
    /**@todo Questo metodo dovrebbe già funzionare e quindi non dovrebbe essere modificato
     * Aggiorna i dati di un account
     * @param username
     * @param password
     * @param email
     * @param tipologia_genitore
     * @return
     */
    public boolean updateAccount(String username, String password,
            String email, String tipologia_genitore) {
        Database db = new Database();
        db.apriConnessione();
        DBAccount dbAccount = new DBAccount(db);
        DBGenitore dbGenitore = new DBGenitore(db);
        DBEducatoreDidattico dbEducatoreDidattico = new DBEducatoreDidattico(db);
        DBPersonaleAsilo dbPersonaleAsilo = new DBPersonaleAsilo(db);
        DBPsicopedagogo dpPsicopedagogo = new DBPsicopedagogo(db);
        
        // creo il nuovo account che sostituirà il vecchio
        Account newAccount = new Account();
        try {
            newAccount.setOwner(getValoriUtente(username));
        } catch (DBConnectionException e1) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "<Descrizione del problema>", e1);
        }// cambio owner
        newAccount.setUserName(username);// setto username che non varierà mai
        if (password == null)
            try {
                Account account = new Account();
                account = dbAccount.ricercaPerUsername(username);
                newAccount.setPassWord((dbAccount.ricercaPerUsername(username))
                        .getPassWord());
            } catch (SQLException e1) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e1);
            }
        else
            newAccount.setPassWord(password);// cambio password
        
        
        // creo il nuovo utente, con tutti i campi che aveva in precedenza ma
        // con l'email aggiornata
        Utente newUtente = new Utente();
        try {
            newUtente = getValoriUtente(username);
        } catch (DBConnectionException e1) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "<Descrizione del problema>", e1);
        }// risetto tutti i campi come prima
        if (email == null)
            try {
                newUtente.setEmail(getValoriUtente(username).getEmail());
            } catch (DBConnectionException e1) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e1);
            }
        else
            newUtente.setEmail(email);// cambio email
        
        
        try {
            
            
            if (!dbAccount.replace(dbAccount.ricercaPerUsername(username),
                    newAccount))// modifica dati account
                return false;
            
            // controlla se utente è Personale asilo ed in quel caso aggiorna la
            // mail
            if (dbPersonaleAsilo.getPersonaleAsiloPerCF(getValoriUtente(
                    username).getCodiceFiscale()) != null) {
                PersonaleAsilo realBean = dbPersonaleAsilo
                        .getPersonaleAsiloPerCF(newUtente.getCodiceFiscale());
                PersonaleAsilo newRealBean = realBean;
                newRealBean.setEmail(newUtente.getEmail());
                dbPersonaleAsilo.replace(realBean, newRealBean);
            }
            // controlla se utente è genitore ed in quel caso aggiorna la mail
            if (dbGenitore.getGenitorePerCF(getValoriUtente(username)
                    .getCodiceFiscale()) != null) {
                Genitore realBean = dbGenitore.getGenitorePerCF(newUtente
                        .getCodiceFiscale());
                Genitore newRealBean = realBean;
                newRealBean.setEmail(newUtente.getEmail());
                dbGenitore.replace(realBean, newRealBean);
            }
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
        } catch (DBConnectionException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
        }
        
        
        finally {
            db.chiudiConnessione();
        }
        return true;
    }
    
    
    /**Restituisce l'account associato al codice fiscale dato in input
     * @param cf
     * @return
     * @throws SQLException 
     */
    public Account getAccount(String cf) throws SQLException {
        Database db= new Database();
        DBAccount dbAccount= new DBAccount(db);
        
        try{
            db.apriConnessione();
            return dbAccount.ricercaPerCodiceFiscale(cf);
            
        }finally {
            db.chiudiConnessione();
        }
    }
    
    /**
     * Gets the single istance of this class
     * 
     * @return a new ControlDatiPersonali
     */
    public static ControlDatiPersonali getIstance() {
        return INSTANCE;
    }
    
}
