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
import atsilo.entity.OrarioUtente;
import atsilo.entity.Questionario;
import atsilo.entity.Servizio;
import atsilo.entity.Utente;
import atsilo.exception.AccountException;
import atsilo.exception.BambinoException;
import atsilo.exception.DBConnectionException;
import atsilo.exception.DomandaIscrizioneException;
import atsilo.exception.GenitoreException;
import atsilo.exception.InserimentoDatiException;
import atsilo.exception.ServizioException;
import atsilo.exception.UtenteException;
import atsilo.storage.DBBambino;
import atsilo.storage.DBDomandaIscrizione;
import atsilo.storage.DBGenitore;
import atsilo.storage.DBOrarioUtente;
import atsilo.storage.DBServizio;
import atsilo.storage.Database;
import atsilo.stub.application.StubAccount;
import atsilo.stub.application.StubBambino;
import atsilo.stub.application.StubDomandaIscrizione;
import atsilo.stub.application.StubGenitore;
import atsilo.stub.application.StubUtente;
import atsilo.util.AtsiloConstants;


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
     * Inserisce una Domanda di Iscrizione se non esiste e la modifica se esiste già
     * @param parametri necessaria alla creazione della domanda di iscrizione 
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     * @throws SQLException 
     */
    public boolean updateDatiDomandaIscrizionePrimoStep(String cf_bambino, boolean bambinoDisabile, boolean genitoreInvalido,
            boolean genitoreSolo, boolean genitoreVedovo, boolean genitoreNubile, boolean genitoreSeparato, 
            boolean figlioNonRiconosciuto, boolean affidoEsclusivo, boolean altriComponentiDisabili,
            String condizioniCalcoloPunteggio, float isee) throws DomandaIscrizioneException, DBConnectionException, SQLException{
        
        Database db = new Database();
        DBDomandaIscrizione bdDomandaIscrizione = new DBDomandaIscrizione(db); 
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");

        DomandaIscrizione domanda = bdDomandaIscrizione.ricercaDomandaDaBambino(cf_bambino);
        if(domanda == null)
        {
            java.util.Date d = new java.util.Date();
            java.sql.Date oggi = new java.sql.Date(d.getTime());
            
            domanda = new DomandaIscrizione(oggi, bambinoDisabile, genitoreInvalido, genitoreSolo, genitoreVedovo, 
                    genitoreNubile, genitoreSeparato, figlioNonRiconosciuto,affidoEsclusivo, altriComponentiDisabili,
                    condizioniCalcoloPunteggio, isee);
            if(!db.apriConnessione())
                throw new DBConnectionException("Connessione al DB fallita");
            try{
                
                if(!bdDomandaIscrizione.inserisci(domanda))
                    throw new DomandaIscrizioneException("Inserimento fallito");
            }
            finally{
                db.chiudiConnessione();
            }
        }
        else
        {
            DomandaIscrizione domandaModificata = (DomandaIscrizione) domanda.clone();
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

            
            if(!db.apriConnessione())
                throw new DBConnectionException("Connessione al DB fallita");
            try{                
                if(!bdDomandaIscrizione.replace(domanda, domandaModificata))
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
     * @throws GenitoreException 
     * @throws SQLException 
     * @throws DomandaIscrizioneException 
     * @throws BambinoException 
     */
    public boolean presentaDomandaIscrizionePrimoStep(String codiceFiscaleBambino) throws DBConnectionException, AccountException, InserimentoDatiException, UtenteException, GenitoreException, SQLException, DomandaIscrizioneException, BambinoException{
        Database db = new Database();
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        DBDomandaIscrizione bdDomandaIscrizione = new DBDomandaIscrizione(db);
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(codiceFiscaleBambino.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");    
        
        DomandaIscrizione d = bdDomandaIscrizione.ricercaDomandaDaBambino(codiceFiscaleBambino);
        if(d == null)
            throw new DomandaIscrizioneException("Domanda di iscrizione non trovata");
        
        //il metodo valuta che tutti i campi dell'iscrizione siano stati inseriti
        Genitore richiedente = d.getGenitore();
        if(richiedente == null)
            throw new GenitoreException("Genitore richiedente non trovato");
        
        if( (richiedente.getDataNascita() == null) ||
            (richiedente.getNome() == null) ||
            (richiedente.getCognome() == null) ||
            (richiedente.getCodiceFiscale() == null) ||
            (richiedente.getEmail() == null) ||
            (richiedente.getComuneNascita() == null) ||
            (richiedente.getTelefono() == null) || 
            (richiedente.getcittadinanza() == null) ||
            (richiedente.getIndirizzoResidenza() == null) ||
            (richiedente.getNumeroCivicoResidenza() == null) ||
            (richiedente.getCapResidenza() == null) ||
            (richiedente.getComuneResidenza() == null) ||
            (richiedente.getProvinciaResidenza() == null) ||
            (richiedente.getIndirizzoDomicilio() == null) ||
            (richiedente.getNumeroCivicoDomicilio() == null) ||
            (richiedente.getCapDomicilio() == null) ||
            (richiedente.getComuneDomicilio() == null) ||
            (richiedente.getProvinciaDomicilio() == null) ||
            (richiedente.getTipo() == null) ||
            (richiedente.getDipendentePresso() == null) ||
            (richiedente.getRapportiAteneoSalerno() == null) ||
            (richiedente.getRapportiComuneFisciano() == null) ||
            (richiedente.getStatusLavorativo() == null) ||
            (richiedente.getScadenzaContratto() == null) ||
            (richiedente.getCategoriaAppartenenza() == null) ||
            (richiedente.getRapportoParentela() == null) ||
            (richiedente.getCondizioneLavorativa() == null) ||
            (richiedente.getTipoContratto() == null) ||
            (richiedente.getFigli().isEmpty())
        )
            throw new GenitoreException("Mancano alcune informazioni del genitore richiedente");
        
        if( (d.getFiglioNonRiconosciuto() == false) && (d.getGenitoreSolo() == false) && (d.getGenitoreNubile() == false)
          && (d.getGenitoreVedovo() == false) && (d.getGenitoreSeparato() == false) && (d.getAffidoEsclusivo() == false) )
        {
            Genitore nonRichiedente = d.getGenitoreNonRichiedente();
            if(nonRichiedente == null)
                throw new GenitoreException("Genitore non richiedente non trovato");
            
            if( (nonRichiedente.getDataNascita() == null) ||
                (nonRichiedente.getNome() == null) ||
                (nonRichiedente.getCognome() == null) ||
                (nonRichiedente.getCodiceFiscale() == null) ||
                (nonRichiedente.getEmail() == null) ||
                (nonRichiedente.getComuneNascita() == null) ||
                (nonRichiedente.getTelefono() == null) || 
                (nonRichiedente.getcittadinanza() == null) ||
                (nonRichiedente.getIndirizzoResidenza() == null) ||
                (nonRichiedente.getNumeroCivicoResidenza() == null) ||
                (nonRichiedente.getCapResidenza() == null) ||
                (nonRichiedente.getComuneResidenza() == null) ||
                (nonRichiedente.getProvinciaResidenza() == null) ||
                (nonRichiedente.getIndirizzoDomicilio() == null) ||
                (nonRichiedente.getNumeroCivicoDomicilio() == null) ||
                (nonRichiedente.getCapDomicilio() == null) ||
                (nonRichiedente.getComuneDomicilio() == null) ||
                (nonRichiedente.getProvinciaDomicilio() == null) ||
                (nonRichiedente.getTipo() == null) ||
                (nonRichiedente.getDipendentePresso() == null) ||
                (nonRichiedente.getRapportiAteneoSalerno() == null) ||
                (nonRichiedente.getRapportiComuneFisciano() == null) ||
                (nonRichiedente.getStatusLavorativo() == null) ||
                (nonRichiedente.getScadenzaContratto() == null) ||
                (nonRichiedente.getCategoriaAppartenenza() == null) ||
                (nonRichiedente.getRapportoParentela() == null) ||
                (nonRichiedente.getCondizioneLavorativa() == null) ||
                (nonRichiedente.getTipoContratto() == null) ||
                (nonRichiedente.getFigli().isEmpty())
            )
                throw new GenitoreException("Mancano alcune informazioni del genitore non richiedente");
        }
        
        Bambino bambino = d.getBambino();
        if(bambino == null)
            throw new BambinoException("Bambino non trovato");
        
        if( (bambino.getDataNascita() == null) ||
            (bambino.getNome() == null) ||
            (bambino.getCognome() == null) ||
            (bambino.getCodiceFiscale() == null) ||
            (bambino.getComuneNascita() == null) ||
            (bambino.getcittadinanza() == null) ||
            (bambino.getIndirizzoResidenza() == null) ||
            (bambino.getNumeroCivicoResidenza() == null) ||
            (bambino.getCapResidenza() == null) ||
            (bambino.getComuneResidenza() == null) ||
            (bambino.getProvinciaResidenza() == null) ||        
            (bambino.getIndirizzoDomicilio() == null) ||
            (bambino.getNumeroCivicoDomicilio() == null) ||
            (bambino.getCapDomicilio() == null) ||
            (bambino.getComuneDomicilio() == null) ||
            (bambino.getProvinciaDomicilio() == null) ||
            (bambino.getCategoriaAppartenenza() == null) ||
            (bambino.getGenitore() == null) ||
            (bambino.getGenitoreNonRichiedente() == null) 
        )
            throw new GenitoreException("Mancano alcune informazioni del bambino");  
   
        if(d.getIsee() == -1)
            throw new DomandaIscrizioneException("Mancano i dati relativi al documento isee");
            
        DomandaIscrizione domandaModificata = (DomandaIscrizione) d.clone();
        domandaModificata.setStato_convalidazione(AtsiloConstants.STATO_DOMANDA_PRIMO_STEP);

        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(bdDomandaIscrizione.replace(d, domandaModificata))
                throw new DomandaIscrizioneException("Modifica fallita");         
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
        
    }
    
    /**
     * Prende lo stato di un'iscrizione
     * @param id della domanda di iscrizione da verificare
     * @return stringa che riporti lo stato dell'iscrizione
     * @throws DBConnectionException
     * @throws DomandaIscrizioneException
     * @throws SQLException 
     */
    public String getValoreStatoIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException, SQLException {
        Database db = new Database();        
        DBDomandaIscrizione dbDomandaIscrizione = new DBDomandaIscrizione(db);
        String stato = null;

        DomandaIscrizione d = dbDomandaIscrizione.ricercaDomandaDaId(id);
        if(d == null)
            throw new DomandaIscrizioneException("Domanda di iscrizione non trovata");
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            stato = d.getStatoDomanda();         
        }
        finally{
            db.chiudiConnessione();
        }
        return stato;
    }
    
    
    
    /**@todo questo sarebbe il secondo step della domanda di iscrizione
     * Il metodo non serve per inviare la domanda di iscriizone ma per inserire i dati della domanda
     * @param 
     * @return 
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     * @throws InserimentoDatiException 
     * @throws SQLException 
     * @throws ServizioException 
     */
    public boolean inserisciDatiDomandaIscrizioneFinale(String cf_bambino, String statoDomanda,
            String malattieInfettive, String vaccinazioni, String idOrario) throws DomandaIscrizioneException, DBConnectionException, InserimentoDatiException, SQLException, ServizioException{

      Database db = new Database();
      DBDomandaIscrizione bdDomandaIscrizione = new DBDomandaIscrizione(db);
      DBOrarioUtente dbOrarioUtente = new DBOrarioUtente(db);
      DBServizio dbServizio = new DBServizio(db);
      
      // controllo sul codice fiscale che deve essere a 16 cifre
      if (cf_bambino.length() != 16)
          throw new InserimentoDatiException("Il codice fiscale non è valido");
      
      if (!db.apriConnessione())
          throw new DBConnectionException("Connessione al DB fallita");
      try {
          
          DomandaIscrizione domanda = bdDomandaIscrizione.ricercaDomandaDaBambino(cf_bambino);
          if (domanda == null)
              throw new DomandaIscrizioneException("Domanda non trovata");
          if(!domanda.getStato_convalidazione().equals(AtsiloConstants.STATO_DOMANDA_SECONDO_STEP))
          {
              throw new DomandaIscrizioneException("La domanda non è risultata accettata in graduatoria");
          }
          DomandaIscrizione domandaModificata = (DomandaIscrizione) domanda.clone();
          
          domandaModificata.setStato_convalidazione(AtsiloConstants.STATO_DOMANDA_PRESENTAZIONE_DOCUMENTI);
          // vengono modificati i campi passati come parametri
          if (malattieInfettive != null)
              domandaModificata.setMalattieInfettive(malattieInfettive);
          if (vaccinazioni != null)
              domandaModificata.setVaccinazioni(vaccinazioni);
          
          int idorario = Integer.parseInt(idOrario);
          OrarioUtente orario = dbOrarioUtente.ricercaOrarioUtenteDaId(idorario);
          Servizio servizio = new Servizio(cf_bambino, orario);      
          
          if (!dbServizio.inserisci(servizio))
              throw new ServizioException("Modifica fallita");
          if(!bdDomandaIscrizione.replace(domanda, domandaModificata))
          {
              throw new DomandaIscrizioneException("Domanda non correttamente inoltrata");
          }
          return true;
      } finally {
          db.chiudiConnessione();
      }
    }
    
    /**@todo completa iscrizione finale
     * Modifica i certificati di iscrizione
     * 
     * @param id
     *            del certificato di iscrizione e valori booleani dei
     *            certificati da inserire
     * @return valore booleano
     * @throws DomandaIscrizioneException 
     * @throws DBConnectionException
     * @throws BambinoException
     * @throws InserimentoDatiException
     * @throws SQLException 
     * @throws DomandaIScrizioneException
     */
    public boolean aggiornaCertificati(String cfBambino, String certificato_privacy, String certificato_vaccinazioni, 
            String certificato_malattie) throws DomandaIscrizioneException, InserimentoDatiException, DBConnectionException, SQLException{
        Database db = new Database();
        DBDomandaIscrizione bdDomandaIscrizione = new DBDomandaIscrizione(db);
        
        // controllo sul codice fiscale che deve essere a 16 cifre
        if (cfBambino.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            
            DomandaIscrizione domanda = bdDomandaIscrizione.ricercaDomandaDaBambino(cfBambino);
            if (domanda == null)
                throw new DomandaIscrizioneException("Domanda non trovata");
             if(!domanda.getStato_convalidazione().equals(AtsiloConstants.STATO_DOMANDA_PRESENTAZIONE_DOCUMENTI))
                 throw new DomandaIscrizioneException("La domanda non è nello stato corretto.");
             
            DomandaIscrizione domandaModificata = (DomandaIscrizione) domanda.clone();
            
            // vengono modificati i campi interessati ai certificati
            if (certificato_vaccinazioni != null)
                domandaModificata.setCertificatoVaccinazioni(certificato_vaccinazioni);
            if (certificato_malattie != null)
                domandaModificata.setCertificatoMalattie(certificato_malattie);
            if (certificato_privacy != null)
                domandaModificata.setCertificatoPrivacy(certificato_privacy);
            
            if (!bdDomandaIscrizione.replace(domanda, domandaModificata))
                throw new DomandaIscrizioneException("Modifica fallita");
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    /**
     * Metodo che restituisce la lista delle domande confermate da convalidare poi con i certificati. 
     * @return
     * @throws DBConnectionException
     * @throws SQLException
     */
    public List<DomandaIscrizione> ricercaDomandeConfermateDaConvalidare() throws DBConnectionException, SQLException
    {
        Database db = new Database();
        DBDomandaIscrizione bdDomandaIscrizione = new DBDomandaIscrizione(db);
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            
           List<DomandaIscrizione> domande = bdDomandaIscrizione.ricercaDomandeCompletateDaConvalidare();
           for(DomandaIscrizione d : domande)
           {
               DBBambino dbb = new DBBambino(db);
               DBGenitore dbg = new DBGenitore(db);
               Bambino b = dbb.ricercaBambinoPerCodFiscale(d.getBambino().getCodiceFiscale());
               d.setBambino(b);
               Genitore g = dbg.getGenitorePerCF(d.getGenitore().getCodiceFiscale());
               Genitore gnr = dbg.getGenitorePerCF(d.getGenitoreNonRichiedente().getCodiceFiscale());
               d.setGenitore(g);
               d.setGenitoreNonRichiedente(gnr);
           }
            return domande;
        } finally {
            db.chiudiConnessione();
        }
        
    }
    
    /**
     * @todo prende i tre certificati e li inserisce 
     * 
     * @param id
     *            della domanda di iscrizione
     * @return valore booleano
     * @throws DBConnectionException
     * @throws DomandaIscrizioneException
     * @throws SQLException 
     */
    public boolean convalidaIscrizione(int id)
            throws DomandaIscrizioneException, DBConnectionException, SQLException {
        Database db = new Database();
        DBDomandaIscrizione bdDomandaIscrizione = new DBDomandaIscrizione(db);
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            DomandaIscrizione domanda = bdDomandaIscrizione.ricercaDomandaDaId(id);
            if (domanda == null)
                throw new DomandaIscrizioneException("Domanda non trovata");
            if(!domanda.getStato_convalidazione().equals(AtsiloConstants.STATO_DOMANDA_PRESENTAZIONE_DOCUMENTI))
                throw new DomandaIscrizioneException("La domanda non è nello stato corretto.");
            
            if( (!domanda.getCertificatoMalattie().equals(AtsiloConstants.CERTIFICATO_IN_ATTESA)) &&
            (!domanda.getCertificatoVaccinazioni().equals(AtsiloConstants.CERTIFICATO_IN_ATTESA)) &&
            (!domanda.getCertificatoPrivacy().equals(AtsiloConstants.CERTIFICATO_IN_ATTESA)))
            {
                DomandaIscrizione domandaModificata = (DomandaIscrizione) domanda.clone();
                domandaModificata.setStato_convalidazione(AtsiloConstants.STATO_DOMANDA_ACCETTATA);
                bdDomandaIscrizione.replace(domanda,domandaModificata);
                return true;
            }
            else return false;
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
     * @throws SQLException 
     */
    public DomandaIscrizione getDomandaIscrizione(String cfBambino) throws InserimentoDatiException, DBConnectionException, DomandaIscrizioneException, SQLException {
        Database db = new Database();
        DBDomandaIscrizione dbDomandaIscrizione = new DBDomandaIscrizione(db);
        
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(cfBambino.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido"); 
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            DomandaIscrizione domanda = dbDomandaIscrizione.ricercaDomandaDaBambino(cfBambino);
            if (domanda == null)
                throw new DomandaIscrizioneException("Domanda non trovata");           
            
            return domanda;
        } finally {
            db.chiudiConnessione();
        }
    }
    
  
    
    /**
     * ricerca una domanda di iscrizione
     * @param id della domanda da visualizzare
     * @return Domanda di iscrizione da visualizzare
     * @throws DBConnectionException 
     * @throws DomandaIscrizioneException
     * @throws SQLException 
     */
    public DomandaIscrizione getDomandaIscrizione(int id) throws DomandaIscrizioneException, DBConnectionException, SQLException{
        Database db = new Database();
        DBDomandaIscrizione bdDomandaIscrizione = new DBDomandaIscrizione(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{            
            DomandaIscrizione di = bdDomandaIscrizione.ricercaDomandaDaId(id);
            if(di == null)
                throw new DomandaIscrizioneException("Domanda di iscrizione non trovato");
            return di;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
  
    
    
    //Dato che ora la vonvalida è una stringa, devo sapere se questo metodo serve ancora
    /**
     * @todo da modificare, copiato da controlDatiPersonali, manco questo ho capito a cosa serve 
     * Ricerca le domande in attesa di convalida
     * 
     * @return domande in attesa di convalide
     * @throws DBConnectionException
     * @throws DomandaIscrizioneException
     
    public List<DomandaIscrizione> getDomandeIscrizioneNonConvalidate()
            throws DomandaIscrizioneException, DBConnectionException {
        Database db = new Database();
        DBDomandaIscrizione dbDomandaIscrizione = new DBDomandaIscrizione(db);
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            List<DomandaIscrizione> b = dbDomandaIscrizione.ricercaDomandeInAttesa();
            if (b.isEmpty())
                throw new DomandaIscrizioneException("Lista vuota");
            return b;
        } finally {
            db.chiudiConnessione();
        }
    }*/
    
    
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
     
    public Boolean rinunciaIscrizione(int id) throws DomandaIscrizioneException,
    DBConnectionException {
        Database db = new Database();
        DBDomandaIscrizione dbDomandaIscrizione = new DBDomandaIscrizione(db);
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            DomandaIscrizione domanda = dbDomandaIscrizione.ricercaDomandaDaId(id);
            if (domanda == null)
                throw new DomandaIscrizioneException("Domanda non trovata");
            DomandaIscrizione domandaModificata = (DomandaIscrizione) domanda.clone();
            // domanaIsczizione.setConvalida(false);
            if (!stub.replace(domanda, domandaModificata))
                throw new DomandaIscrizioneException("Modifica fallita");
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }*/
    
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
        DBDomandaIscrizione dbDomandaIscrizione = new DBDomandaIscrizione(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            DomandaIscrizione domandaIscrizione = dbDomandaIscrizione.ricercaDomandaDaId(id);
            if(domandaIscrizione == null)
                throw new DomandaIscrizioneException("Domanda di iscrizione inesistente");
            Boolean toReturn = dbDomandaIscrizione.delete(domandaIscrizione);
            if(!toReturn)
                throw new DomandaIscrizioneException("Cancellazione domanda di iscrizione fallita");
            return domandaIscrizione;
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

