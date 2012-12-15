package atsilo.application;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import atsilo.storage.DBBambino;
import atsilo.storage.DBDomandaIscrizione;
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
    private static final Logger LOG = Logger.getLogger("global");
    
    
    /**
     * Inserisce una Domanda di Iscrizione se non esiste e la modifica se esiste già
     * @param parametri necessaria alla creazione della domanda di iscrizione 
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     * @throws SQLException 
     */
    public boolean updateDatiDomandaIscrizionePrimoStep(Date dataPresentazione, int iD, int punteggio,
            int posizione, Genitore genitore, Bambino bambino, String statoDomanda,
            String certificatoMalattie, String certificatoVaccinazioni, String certificatoPrivacy,
            boolean bambinoDisabile, boolean genitoreInvalido, boolean genitoreSolo,
            boolean genitoreVedovo, boolean genitoreNubile, boolean genitoreSeparato,
            boolean figlioNonRiconosciuto, boolean affidoEsclusivo, boolean altriComponentiDisabili,
            String condizioniCalcoloPunteggio, float isee, Servizio servizio, String stato_convalidazione) throws DomandaIscrizioneException, DBConnectionException, SQLException{
        
        Database db = new Database();
        DBDomandaIscrizione stub = new DBDomandaIscrizione(db); 
        
        DomandaIscrizione domanda = stub.ricercaDomandaDaId(iD);
        if(domanda == null)
        {
            domanda = new DomandaIscrizione(dataPresentazione, punteggio,
                    posizione, genitore, bambino, statoDomanda, certificatoMalattie, certificatoVaccinazioni,
                    certificatoPrivacy, bambinoDisabile, genitoreInvalido, genitoreSolo, genitoreVedovo, 
                    genitoreNubile, genitoreSeparato, figlioNonRiconosciuto,affidoEsclusivo, altriComponentiDisabili,
                    condizioniCalcoloPunteggio, isee, servizio, stato_convalidazione);
            if(!db.apriConnessione())
                throw new DBConnectionException("Connessione al DB fallita");
            try{
                
                if(!stub.inserisci(domanda))
                    throw new DomandaIscrizioneException("Inserimento fallito");
            }
            finally{
                db.chiudiConnessione();
            }
        }
        else
        {
            DomandaIscrizione domandaModificata = (DomandaIscrizione) domanda.clone();
            if(dataPresentazione != null)
                domandaModificata.setDataPresentazione(dataPresentazione);
            if(punteggio != -1)
                domandaModificata.setPunteggio(punteggio);
            if(posizione != -1)
                domandaModificata.setPosizione(posizione);
            if(genitore != null)
                domandaModificata.setGenitore(genitore);
            if(bambino != null)
                domandaModificata.setBambino(bambino);
            if(statoDomanda != null)
                domandaModificata.setStatoDomanda(statoDomanda);
            if(certificatoMalattie != null)
                domandaModificata.setCertificatoMalattie(certificatoMalattie);
            if(certificatoVaccinazioni != null)
                domandaModificata.setCertificatoVaccinazioni(certificatoVaccinazioni);
            if(certificatoPrivacy != null)
                domandaModificata.setCertificatoPrivacy(certificatoPrivacy);
            if(bambinoDisabile == true)
                domandaModificata.setBambinoDisabile(bambinoDisabile);
            if(genitoreInvalido == true)
                domandaModificata.setGenitoreInvalido(genitoreInvalido);
            if(genitoreSolo == true)
                domandaModificata.setGenitoreSolo(genitoreSolo);
            if(genitoreVedovo == true)
                domandaModificata.setGenitoreVedovo(genitoreVedovo);
            if(genitoreNubile == true)
                domandaModificata.setGenitoreNubile(genitoreNubile);
            if(genitoreSeparato == true)
                domandaModificata.setGenitoreSeparato(genitoreSeparato);
            if(figlioNonRiconosciuto == true)
                domandaModificata.setFiglioNonRiconosciuto(figlioNonRiconosciuto);
            if(affidoEsclusivo == true)
                domandaModificata.setAffidoEsclusivo(affidoEsclusivo);
            if(altriComponentiDisabili == true)
                domandaModificata.setAltriComponentiDisabili(altriComponentiDisabili); 
            if(condizioniCalcoloPunteggio != null)
                domandaModificata.setCondizioniCalcoloPunteggio(condizioniCalcoloPunteggio);
            if(isee != -1)
                domandaModificata.setIsee(isee);
            if(servizio != null)
                domandaModificata.setServizio(servizio);
            if(stato_convalidazione != null)
                domandaModificata.setStato_convalidazione(stato_convalidazione);
            
            if(!db.apriConnessione())
                throw new DBConnectionException("Connessione al DB fallita");
            try{
                
                if(!stub.replace(domanda, domandaModificata))
                    throw new DomandaIscrizioneException("Modifica fallita");
            }
            finally{
                db.chiudiConnessione();
            }
        }
        return true;
    }
    
    
    /**
     * Presenta domanda di iscrizione (PrimoStep), verifica quindi che tutti i campi siano stati inseriti
     * @param cf_bambino
     * @param username_account
     * @return
     * @throws DBConnectionException 
     * @throws AccountException 
     * @throws InserimentoDatiException 
     * @throws UtenteException 
     */
    public boolean presentaDomandaIscrizionePrimoStep(String codiceFiscaleBambino) throws DBConnectionException, AccountException, InserimentoDatiException, UtenteException{
        Database db = new Database();
        
        DBBambino stub = new DBBambino(db);
        Bambino bambino = stub.ricercaBambinoPerCodFiscale(codiceFiscaleBambino);
        if(bambino == null)
            throw new BambinoException("Bambino non trovato");
        
        
        
        
        
        
        
        
        
        StubAccount stub = new StubAccount(db); 
        StubUtente stub2 = new StubUtente(db);
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(codiceFiscaleBambino.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");     
        
        if(stub2.ricercaUtente(codiceFiscaleBambino) != null)
            throw new AccountException("L'utente esite già");
        //Generazione della password
        Random generatore = new Random(8);
        int password = generatore.nextInt(10000001) + 99999999;
        //Converesione in stringa della password
        String psw = "" + password;
        
        //Credo che in questa prima fase vengano messi tutti i dati relativi all'entità utente 
        Utente utente = new Utente(null,null, null, codiceFiscaleBambino, null,
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
     * @todo copiato dall altro control, da implementare e vede a che stato sta la domanda
     * Prende lo stato di un'iscrizione: idoneo/non idoneo/domanda/?primoStepEffettuato/?domandaCompletaPresentata/Iscritto
     * 
     * @param id
     *            della domanda di iscrizione da verificare
     * @return stringa che riporti lo stato dell'iscrizione
     * @throws DBConnectionException
     * @throws DomandaIscrizioneException
     */
    public String getValoreStatoIscrizione(int id)
            throws DomandaIscrizioneException, DBConnectionException {
        /*
         * TODO questo metodo è collegato ad un control di bassa priorità, per
         * cui verrà implementato in seguito
         */
        return "";
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
    
    
    
    /**@todo questo sarebbe il secondo step della domanda di iscrizione
     * Il metodo non serve per inviare la domanda di iscriizone ma per inserire i dati della domanda
     * @param 
     * @return 
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    //ATTENDO di sapere queli parametri mi verranno passati
    public boolean inserisciDatiDomandaIscrizioneFinale(String codice_fiscale_bambino, String statoDomanda,String certificatoMalattie, String certificatoVaccinazioni,String certificatoPrivacy, boolean bambinoDisabile,boolean genitoreInvalido, boolean genitoreSolo,boolean genitoreVedovo,boolean genitoreNubile,boolean genitoreSeparato,boolean figlioNonRiconosciuto,boolean affidoEsclusivo,boolean altriComponentiDisabili,String condizioniCalcoloPunteggio,float isee) throws DomandaIscrizioneException, DBConnectionException{
        //controlli che i dati siano corretti
        //TODO
        return true;
    }
    
    /**@todo completa iscrizione finale
     * Modifica i certificati di iscrizione
     * 
     * @param id
     *            del certificato di iscrizione e valori booleani dei
     *            certificati da inserire
     * @return valore booleano
     * @throws DBConnectionException
     * @throws BambinoException
     * @throws InserimentoDatiException
     * @throws DomandaIScrizioneException
     */
    public boolean completaIscrizione(String cf_bambino, String username_account){
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        StubBambino stub2 = new StubBambino(db);
        
        // controllo sul codice fiscale che deve essere a 16 cifre
        if (cf.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            Bambino b = stub2.ricercaBambino(cf);
            if (b == null)
                throw new BambinoException("Bambino non trovato");
            int id = stub.ricercaDomandaDaBambino(b);
            DomandaIscrizione domandaIscrizioneDaModificare = stub
                    .ricercaDomandaPerId(id);
            if (domandaIscrizioneDaModificare == null)
                throw new DomandaIscrizioneException("Domanda non trovata");
            DomandaIscrizione domandaIscrizione = stub.ricercaDomandaPerId(id);
            
            // vengono modificati i campi interessati ai certificati
            if (vaccinazioni != null)
                domandaIscrizione.setCertificatoVaccinazioni(vaccinazioni);
            if (malattie != null)
                domandaIscrizione.setCertificatoMalattie(malattie);
            if (privacy != null)
                domandaIscrizione.setCertificatoPrivacy(privacy);
            
            if (!stub.replace(domandaIscrizioneDaModificare, domandaIscrizione))
                throw new DomandaIscrizioneException("Modifica fallita");
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    /**
     * @todo da modificare, copiato da controlDatiPersonali, non ho ancora capito di preciso a cosa serve
     * Convalida una domanda di iscrizione
     * 
     * @param id
     *            della domanda di iscrizione
     * @return valore booleano
     * @throws DBConnectionException
     * @throws DomandaIscrizioneException
     */
    public boolean convalidaIscrizione(int id)
            throws DomandaIscrizioneException, DBConnectionException {
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            DomandaIscrizione domandaIscrizioneDaModificare = stub
                    .ricercaDomandaPerId(id);
            if (domandaIscrizioneDaModificare == null)
                throw new DomandaIscrizioneException("Domanda non trovata");
            DomandaIscrizione domandaIscrizione = stub.ricercaDomandaPerId(id);
            // Supponendo che ci sia un campo convalida in domanda iscrizione
            // domanaIsczizione.setConvalida(true);
            if (!stub.replace(domandaIscrizioneDaModificare, domandaIscrizione))
                throw new DomandaIscrizioneException("Modifica fallita");
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    /**
     * @todo copiato dal controlDatiPersonali, modificare
     * Restituisce domanda iscrizione fatta da genitore con username=username
     * 
     * @param username
     *            username dell'account di cui si desiderano i dati dell
     *            iscriizone
     * @param cfBambino
     *            codice fiscale del bambino di cui si vogliono i dati della
     *            domanda di iscrizione, se null verranno passati tutti i dati
     *            della domanda fino ad ora inseriti, tranne il bambino
     *            collegato alla domanda
     * 
     * @return dati domanda di iscrizione: se cfBambino è null restituire solo i
     *         dati collegati all'account (Dati genitori e situazione
     *         reddituale, senza i dati dei bambini e la situazione familiare)
     *         se cfBambino diverso da null restituire tutti i dati compresi
     *         quelli del bambino e la sitauzione familiare se Domanda non
     *         esiste restituire null
     * @throws DomandaIscrizioneException
     * @throws DBConnectionException
     * @throws InserimentoDatiException
     */
    public DomandaIscrizione getDomandaIscrizione(String username, String cfBambino) {
        Database db = new Database();
        DBDomandaIscrizione dbDomandaIscrizione = new DBDomandaIscrizione(db);
        DomandaIscrizione domandaIscrizione = null;
        ControlDatiPersonali cdp= ControlDatiPersonali.getIstance();
        db.apriConnessione();
        
        if (cfBambino == null) {
            List<DomandaIscrizione> a;
            try {
                //metodo getGenitoreFromUsername presente in ControlDatiPersonali
                a = dbDomandaIscrizione
                        .ricercaDomandaDaGenitore(cdp.getGenitoreFromUsername(
                                username).getCodiceFiscale());
                if (a.size() > 0)
                    domandaIscrizione = a.get(1);
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
         * else{ List<DomandaIscrizione> a =
         * dbDomandaIscrizione.ricercaDomandaDaBambino
         * (getDatiBambino(cfBambino)); if (a.size()>0) domandaIscrizione=
         * a.get(1);//restituisce la domanda fatta dal genitore
         * 
         * }
         */
        
        
        db.chiudiConnessione();
        return domandaIscrizione;
    }
    
  
    
    /**
     * ricerca una domanda di iscrizione
     * @param id della domanda da visualizzare
     * @return Domanda di iscrizione da visualizzare
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     */
    public DomandaIscrizione getDomandaIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException{
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
     * @todo da modificare, copiato da controlDatiPersonali, manco questo ho capito a cosa serve 
     * Ricerca le domande in attesa di convalida
     * 
     * @return domande in attesa di convalide
     * @throws DBConnectionException
     * @throws DomandaIscrizioneException
     */
    public List<DomandaIscrizione> getDomandeIscrizioneNonConvalidate()
            throws DomandaIscrizioneException, DBConnectionException {
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            List<DomandaIscrizione> b = stub.ricercaDomandeInAttesa();
            if (b.isEmpty())
                throw new DomandaIscrizioneException("Lista vuota");
            return b;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * @todo da modificare, copiato da controlDatiPersonali, a me serve una rinuncia
     *  una volta iscritto all asilo e una rinuncia una volta presentata la domanda,
     *   non so es può essere sempre lo stesso metodo o dev fare più metodi
     * Esclude una domanda d'iscrizione
     * 
     * @param id
     *            della domanda di iscrizione
     * @return valore booleano
     * @throws DBConnectionException
     * @throws DomandaIscrizioneException
     */
    public Boolean rinunciaIscrizione(int id) throws DomandaIscrizioneException,
    DBConnectionException {
        Database db = new Database();
        StubDomandaIscrizione stub = new StubDomandaIscrizione(db);
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            DomandaIscrizione domandaIscrizioneDaModificare = stub
                    .ricercaDomandaPerId(id);
            if (domandaIscrizioneDaModificare == null)
                throw new DomandaIscrizioneException("Domanda non trovata");
            DomandaIscrizione domandaIscrizione = stub.ricercaDomandaPerId(id);
            // domanaIsczizione.setConvalida(false);
            if (!stub.replace(domandaIscrizioneDaModificare, domandaIscrizione))
                throw new DomandaIscrizioneException("Modifica fallita");
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    /**@todo dovrebbe essere la stessa cosa di rinuncia? cred che vada eliminato
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
    
    
    /**@todo stessa cosa ti getValoreStatoIScrizone credo che vada eliminato
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
    /**
     * Metodo costruttore
     */
    public ControlIscrizione() {
    }
    
    public static ControlIscrizione getIstance() {
        return ISTANCE;
    }
    
}

