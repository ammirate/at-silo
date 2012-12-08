package atsilo.stub.application;


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
    public Genitore getDatiGenitoreFromCF(String codiceFiscale) throws GenitoreException, DBConnectionException, SQLException{
      
        Genitore genitore = new Genitore();
        genitore.setCodiceFiscale(codiceFiscale);
        genitore.setCognome("CognomeProva");
        genitore.setNome("Nome di prova");
        genitore.setComuneDomicilio("ConuneDomicilio di prova");
        genitore.setDataNascita(new Date(1970, 05, 20));
        genitore.setTipo("personale");
        //genitore.setRapportiAteneoSalerno("I rapporti con l'ateneo");
        return genitore;
       
        
    }

    /**
     * 
     * @param username
     * @return
     */
    public Utente getUtenteFromUsername(String username){
        Utente u=new Utente();
        //ricerca utente per username
        u.setCodiceFiscale("codiceFiscaleDiPRova");
        u.setCognome("Cognome");
        u.setEmail("emailDiProva");
        u.setTelefono("telefono");
        return u ;
        
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
     * Modifica i dati di un account , SE VIENE PASSATO NULL ad un valore quest'ultimo non viene aggiornato e rimane con il vecchio valore
     * @param username username da modifica
     * @param password password da modificare
     * @param email email da modificare
     * @param profilo_appartenenza profilo di appartenenza da modificare (valido solo per i genitori)
     * @return true un caso di modifica effettuata
     *         false 
     */
    public boolean updateAccount(String username,String password,String email,String profilo_appartenenza){
        return true;
        
    }
    
    /**
     * Il metodo non serve per inviare la domanda di iscriizone ma per inserire i dati della domanda
     * @param 
     * @return 
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    
    public boolean inserisciDatiDomandaIscrizione(String codice_fiscale_bambino, String statoDomanda, boolean bambinoDisabile,boolean genitoreInvalido, boolean genitoreSolo,boolean genitoreVedovo,boolean genitoreNubile,boolean genitoreSeparato,boolean figlioNonRiconosciuto,boolean affidoEsclusivo,boolean altriComponentiDisabili,String condizioniCalcoloPunteggio,float isee) throws DomandaIscrizioneException, DBConnectionException{
        //se invocato la prima volta crea l'entità domanda di iscrizione
        //controlli che i dati siano corretti
        //
        return true;
    }
    /**
     * Presenta domanda di iscrizione (PrimoStep) 
     * @param cf_bambino
     * @param username_account
     * @return
     */
    public boolean presentaDomandaIscrizionePrimoStep(String cf_bambino,String username_account){
        //calcolo data e inserimento in iscrizione
        return false;
        
    }
    /**
     * Completa la domanda di iscrizione, dopo che il bambino è risultato idoneio in graduatoria
     * @param cf_bambino
     * @param username_account
     * @return
     */
    public boolean completaIscrizione(String cf_bambino,String username_account, String certificatoMalattie, String certificatoVaccinazioni,String servizio_scelto,String certificato_privacy){
        return true;
        
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
     * Inserisce o modifica i dati di un genitore
     * 
     * @param codiceFiscale verrà passato solo se è di un genitore non richiedente, quello del genitore richiedente non è modificabile
     * @usernmae username username dell'account che ha inviiato i dati da modificare
     * @return true in caso di inserimento riuscito
     *         false altrimenti
     * @throws DBConnectionException 
     * @throws GenitoreException
     */
    
  
    public boolean setDatiGenitore(String username,Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, List<Bambino> figli,
            List<Questionario> questionariCompilati, String tipo, String dipendentePresso,
            String rapportiAteneoSalerno, String rapportiComuneFisciano,
            String statusLavorativo, Date scadenzaContratto, String categoriaAppartenenza,
            String rapportoParentela) throws GenitoreException, DBConnectionException{
     

        Genitore genitore = new Genitore(dataNascita, nome, cognome, codiceFiscale, email, comuneNascita, telefono, cittadinanza, indirizzoResidenza, numeroCivicoResidenza, capResidenza, comuneResidenza, provinciaResidenza, indirizzoDomicilio, numeroCivicoDomicilio, capDomicilio, comuneDomicilio, provinciaDomicilio, figli, questionariCompilati, tipo, dipendentePresso, rapportiAteneoSalerno, rapportiComuneFisciano, statusLavorativo, scadenzaContratto, categoriaAppartenenza, rapportoParentela);
        return true;
   
    }
    /**
     * 
     * @param username dell'account di cui modificare i dati, a cui è associato il bambino
     * @param codiceFiscale che una volta inserito servirà per distinguere più bambini associati a quell account
     * @return
     */
    public boolean setDatiBambino(String username,Date dataNascita, String nome, String cognome,
            String codiceFiscale,  String comuneNascita,
            String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, String categoriaAppartenenza, int classe, Genitore genitore, List<Assenza> assenze){
            Bambino bambino=new Bambino(dataNascita, nome, cognome, codiceFiscale, comuneNascita, cittadinanza, indirizzoResidenza, numeroCivicoResidenza, capResidenza, comuneResidenza, provinciaResidenza, indirizzoDomicilio, numeroCivicoDomicilio, capDomicilio, comuneDomicilio, provinciaDomicilio, categoriaAppartenenza, classe, genitore, assenze);
                return true;
        
    }
    
    /**
     * Crea un nuovo utente associandolo al genitore con quel cf
     * @param cf codice fiscale
     * @return true se proceduara andata a buon fine
     *         false altrimenti
     */
    public boolean createAccount(String cf){
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
