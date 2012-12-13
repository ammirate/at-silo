package atsilo.application;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;




import atsilo.application.notificheMail.Messaggio;
import atsilo.application.notificheMail.NotificaMail;
import atsilo.entity.Account;
import atsilo.entity.Assenza;
import atsilo.entity.Bambino;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;
import atsilo.entity.Questionario;
import atsilo.entity.Servizio;
import atsilo.entity.Utente;
import atsilo.exception.AccountException;
import atsilo.exception.BambinoException;
import atsilo.exception.DBConnectionException;
import atsilo.exception.DomandaIscrizioneException;
import atsilo.exception.GenitoreException;
import atsilo.exception.InserimentoDatiException;
import atsilo.exception.UtenteException;
import atsilo.storage.Database;
import atsilo.stub.application.StubAccount;
import atsilo.stub.application.StubBambino;
import atsilo.stub.application.StubDomandaIscrizione;
import atsilo.stub.application.StubGenitore;
import atsilo.stub.application.StubUtente;


/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlIscrizione.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Elisa D'Eugenio, 03/12/2012
 *-----------------------------------------------------------------
 */


public class ControlIscrizione {

    private static final ControlIscrizione ISTANCE = new ControlIscrizione();

    
    /**
     * Presenta domanda di iscrizione (PrimoStep) 
     * @param cf_bambino
     * @param username_account
     * @return
     * @throws DBConnectionException 
     * @throws AccountException 
     * @throws InserimentoDatiException 
     * @throws UtenteException 
     */
    public boolean presentaDomandaIscrizionePrimoStep(String codiceFiscale,String username_account) throws DBConnectionException, AccountException, InserimentoDatiException, UtenteException{
        Database db = new Database();
        StubAccount stub = new StubAccount(db); 
        StubUtente stub2 = new StubUtente(db);
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(codiceFiscale.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");     
 
        if(stub2.ricercaUtente(codiceFiscale) != null)
            throw new AccountException("L'utente esite già");
        //Generazione della password
        Random generatore = new Random(8);
        int password = generatore.nextInt(10000001) + 99999999;
        //Converesione in stringa della password
        String psw = "" + password;
        
        //Credo che in questa prima fase vengano messi tutti i dati relativi all'entità utente 
        Utente utente = new Utente(null,null, null, codiceFiscale, null,
                null, null, null, null, null, null, 
                null, null, null, null, null,
                null, null);
        
        Account account = new Account(username_account, psw, utente);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!stub2.inserisci(utente))
                throw new UtenteException("Inserimento fallito");
            if(!stub.inserisci(account))
                throw new AccountException("Inserimento fallito");
            //Decidere un messaggio di notifica
            List<Utente> ut = new ArrayList<Utente>();
            ut.add(utente);
            //Messaggio m = new NotificaMail(ut, "iscrizione", "Registrazione andata a buon fine");
            //if(!inviaMail(mess))
              //  throw new AccountException("Invio mail fallito");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
  
    }
    
    
    /**
     * crea un account, verificando che non ce ne sia giù uno esistente con il codice fiscale inserito
     * @param codice fiscale, username, dati generici dell'utente
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws UtenteException
     * @throws AccountException
     * @throws InserimentoDatiException 
     
    public Boolean Inserisci(String username, Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio) throws AccountException, DBConnectionException, UtenteException, InserimentoDatiException{
        Database db = new Database();
        StubAccount stub = new StubAccount(db); 
        StubUtente stub2 = new StubUtente(db);
        
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
        
 
        if(stub2.ricercaUtente(codiceFiscale) != null)
            throw new AccountException("L'utente esite già");
        //Generazione della password
        Random generatore = new Random(8);
        int password = generatore.nextInt(10000001) + 99999999;
        //Converesione in stringa della password
        String psw = "" + password;
        
        //Credo che in questa prima fase vengano messi tutti i dati relativi all'entità utente 
        Utente utente = new Utente(dataNascita, nome, cognome, codiceFiscale, email,
                comuneNascita, telefono, cittadinanza, indirizzoResidenza, numeroCivicoResidenza, capResidenza, 
                comuneResidenza, provinciaResidenza, indirizzoDomicilio, numeroCivicoDomicilio, capDomicilio,
                comuneDomicilio, provinciaDomicilio);
        
        Account account = new Account(username, psw, utente);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!stub2.inserisci(utente))
                throw new UtenteException("Inserimento fallito");
            if(!stub.inserisci(account))
                throw new AccountException("Inserimento fallito");
            //Decidere un messaggio di notifica
            //Messaggio mess = NotificaMail(Utente, "iscrizione", "Registrazione andata a buon fine")
            //if(!inviaMail(mess))
              //  throw new AccountException("Invio mail fallito");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
    }*/
    
    
    
    /**
     * Il metodo non serve per inviare la domanda di iscriizone ma per inserire i dati della domanda
     * @param 
     * @return 
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    //ATTENDO di sapere queli parametri mi verranno passati
    public boolean inserisciDatiDomandaIscrizione(String codice_fiscale_bambino, String statoDomanda,String certificatoMalattie, String certificatoVaccinazioni,String certificatoPrivacy, boolean bambinoDisabile,boolean genitoreInvalido, boolean genitoreSolo,boolean genitoreVedovo,boolean genitoreNubile,boolean genitoreSeparato,boolean figlioNonRiconosciuto,boolean affidoEsclusivo,boolean altriComponentiDisabili,String condizioniCalcoloPunteggio,float isee) throws DomandaIscrizioneException, DBConnectionException{
        //controlli che i dati siano corretti
        //TODO
        return true;
    }
    
    
    
    
    /**
     * ricerca un account
     * @param codice fiscale dell'accout da visualizzare
     * @return Account da visualizzare
     * @throws DBConnectionException 
     * @throws SQLException
     * @throws AccountException
     * @throws InserimentoDatiException 
     */
    public Account getAccount(String codiceFiscale) throws AccountException, SQLException, DBConnectionException, InserimentoDatiException{
        Database db = new Database();
        StubAccount stub = new StubAccount(db);
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(codiceFiscale.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");
        
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
    public DomandaIscrizione getDomanda(int id) throws DomandaIscrizioneException, DBConnectionException{
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
     * @throws InserimentoDatiException 
     */
    public boolean inserisciIscritto(Date dataNascita, String nome, String cognome,
            String codiceFiscale,  String comuneNascita,
            String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, String categoriaAppartenenza, int classe, Genitore genitore, Genitore genitoreNonRichiedente,List<Assenza> assenze, String iscrizioneClasse) throws BambinoException, DBConnectionException, InserimentoDatiException{
        
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
     * Inserisce una Domanda di Iscrizione
     * @param parametri necessaria alla creazione della domanda di iscrizione 
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    public boolean inserisciDomandaIscrizione(Date dataPresentazione, int iD, int punteggio,
           int posizione, Genitore genitore, Bambino bambino, String statoDomanda,
            String certificatoMalattie, String certificatoVaccinazioni, String certificatoPrivacy,
            boolean bambinoDisabile, boolean genitoreInvalido, boolean genitoreSolo,
            boolean genitoreVedovo, boolean genitoreNubile, boolean genitoreSeparato,
            boolean figlioNonRiconosciuto, boolean affidoEsclusivo, boolean altriComponentiDisabili,
            String condizioniCalcoloPunteggio, float isee, Servizio servizio, String stato_convalidazione) throws DomandaIscrizioneException, DBConnectionException{
        
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db); 

        DomandaIscrizione domandaIscrizione = new DomandaIscrizione(dataPresentazione, iD, punteggio,
                posizione, genitore, bambino, statoDomanda, certificatoMalattie, certificatoVaccinazioni,
                certificatoPrivacy, bambinoDisabile, genitoreInvalido, genitoreSolo, genitoreVedovo, 
                genitoreNubile, genitoreSeparato, figlioNonRiconosciuto,affidoEsclusivo, altriComponentiDisabili,
                condizioniCalcoloPunteggio, isee, servizio, stato_convalidazione);

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
     * @throws InserimentoDatiException 
     */
    public Bambino eliminaIscritto(String cf) throws BambinoException, DBConnectionException, SQLException, InserimentoDatiException{
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
     * Inserisce genitore
     * @param tutti i dati necessari del genitore da inserire
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws GenitoreException
     * @throws InserimentoDatiException 
     */
    public boolean inserisciGenitore(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, List<Bambino> figli,
            List<Questionario> questionariCompilati, String tipo, String dipendentePresso,
            String rapportiAteneoSalerno, String rapportiComuneFisciano,
            String statusLavorativo, Date scadenzaContratto, String categoriaAppartenenza,
            String rapportoParentela, String condizioneLavorativa, String tipoContratto) throws GenitoreException, DBConnectionException, InserimentoDatiException{
        
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
     * Prende lo stato di un'iscrizione: idoneo/non idoneo
     * @param id della domanda di iscrizione da verificare
     * @return stringa che riporti lo stato dell'iscrizione
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    public String visualizzaStatoIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException{
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

    public ControlIscrizione() {
    }

    public static ControlIscrizione getIstance() {
        return ISTANCE;
    }
    
}

