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

import javax.mail.MessagingException;

import atsilo.application.notificheMail.ControlNotificaMail;
import atsilo.application.notificheMail.Messaggio;
import atsilo.application.notificheMail.NotificaMailRegistrazione;
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
    
    public boolean inserisciGenitoreNonRichiedentePerBambino(String username,Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, List<Bambino> figli,
            List<Questionario> questionariCompilati, String tipo, String dipendentePresso,
            String rapportiAteneoSalerno, String rapportiComuneFisciano,
            String statusLavorativo, Date scadenzaContratto, String categoriaAppartenenza,
            String rapportoParentela,String condizioneLavorativa, String tipoContratto,String cfBambino)
    {
        try {
            boolean firstResult = inserisciGenitore(username,dataNascita, nome, cognome,
                codiceFiscale, email, comuneNascita,
                telefono, cittadinanza, indirizzoResidenza,
               numeroCivicoResidenza, capResidenza, comuneResidenza,
                provinciaResidenza, indirizzoDomicilio,
                numeroCivicoDomicilio, capDomicilio, comuneDomicilio,
                provinciaDomicilio, null,
                questionariCompilati, tipo, dipendentePresso,
                rapportiAteneoSalerno, rapportiComuneFisciano,
                statusLavorativo, scadenzaContratto, categoriaAppartenenza,
                rapportoParentela,condizioneLavorativa, tipoContratto);
            if(!firstResult)
            {
                throw new GenitoreException("Genitore non richiedente non inserito.");
            }
                Database db = new Database();
                db.apriConnessione();
                DBBambino dbbamb = new DBBambino(db);
                DBGenitore dbgen = new DBGenitore(db);
                
                if(cfBambino==null || cfBambino.length() != 16)
                    throw new InserimentoDatiException("Il codice fiscale del bambino non è valido");
                Bambino b=null;//Non sicuro ma volontario
                try {
                    b = dbbamb.ricercaBambinoPerCodFiscale(cfBambino);
                } catch (SQLException e) {
                    // TODO Blocco di catch autogenerato
                    LOG.log(Level.SEVERE, "Errore di esecuzione della query. Causato da:"+e.getMessage(), e);
                }
                
                if(b==null)
                {
                    throw new InserimentoDatiException("CF Bambino non corretto");
                }
                else
                {
                    //Funziona per forza, l'ho inserito quì sopra.
                    Genitore g=null;//volontariamente così
                    try {
                        g = dbgen.getGenitorePerCF(codiceFiscale);
                    } catch (SQLException e) {
                        // TODO Blocco di catch autogenerato
                        LOG.log(Level.SEVERE, "Impossibile recuperare genitore non richiedente. Causato da: "+e.getMessage(), e);
                    }
                    if(g!=null)
                    {
                        b.setGenitoreNonRichiedente(g);
                        dbbamb.replace(b, b);
                        return true;
                    }
                    
                }
            
        } catch (GenitoreException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Errore di inserimento del genitore. Causato da:"+e.getMessage(), e);
        } catch (DBConnectionException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Errore di connessione al DB. Causato da: "+e.getMessage(), e);
        } catch (InserimentoDatiException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Errore di insermento dei dati. Causato da:"+e.getMessage(), e);
        }
        
        return false;
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
       DBGenitore dbgen = new DBGenitore(db);
        db.apriConnessione();
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(codiceFiscale==null || codiceFiscale.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");
        
       
        
        //controllo sul cap, in attesa di sapere se può essere un numero o una stringa
        
        
        
        
        Genitore genitore;
        Genitore lettoDalDb=null; //Questa inizializzazione è pericolosa ma volontaria
        try {
            lettoDalDb=dbgen.getGenitorePerCF(codiceFiscale);
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Impossibile connettersi alla base dati. Causato da:"+e.getMessage(), e);
        }
        if(lettoDalDb!=null)
        {
            //Genitore trovato nel db e caricato
            genitore=lettoDalDb;
            if(cognome!=null && cognome.length()!=0)
            {
                genitore.setCognome(cognome);
            }
            if(nome!=null && nome.length()!=0)
            {
                genitore.setNome(nome);
            }
            if(dataNascita!=null)
            {
                genitore.setDataNascita(dataNascita);
            }
            if(email!=null && email.length()!=0)
            {
                //controllo sulla mail
                Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
                Matcher m = p.matcher(email);
                boolean matchFound = m.matches();
                if (!matchFound)
                    throw new InserimentoDatiException("La mail inserita non è valida");
            }
            if(comuneNascita!=null && comuneNascita.length()!=0)
            {
                genitore.setComuneNascita(comuneNascita);
            }
            if(cittadinanza!=null && cittadinanza.length()!=0)
            {
                genitore.setCittadinanza(cittadinanza);
            }
            if(indirizzoResidenza!=null && indirizzoResidenza.length()!=0)
            {
                genitore.setIndirizzoResidenza(indirizzoResidenza);
            }
            if(numeroCivicoResidenza!=null && numeroCivicoResidenza.length()!=0)
            {
                genitore.setNumeroCivicoResidenza(numeroCivicoResidenza);
            }
            if(capResidenza!=null && capResidenza.length()!=0)
            {
                if(capResidenza.length() != 5)
                    throw new InserimentoDatiException("Il cap della residenza non è valido");
                genitore.setCapResidenza(capResidenza);
            }
            if(comuneResidenza!=null && comuneResidenza.length()!=0)
            {
                genitore.setComuneResidenza(comuneResidenza);
            }
            if(provinciaResidenza!=null && provinciaResidenza.length()!=0)
            {
                genitore.setProvinciaResidenza(provinciaResidenza);
            }
            if(indirizzoDomicilio!=null && indirizzoDomicilio.length()!=0)
            {
                genitore.setIndirizzoDomicilio(indirizzoDomicilio);
            }
            if(numeroCivicoDomicilio!=null && numeroCivicoDomicilio.length()!=0)
            {
                genitore.setNumeroCivicoDomicilio(numeroCivicoDomicilio);
            }
            if(capDomicilio!=null && capDomicilio.length()!=0)
            {
                if(capDomicilio.length() != 5)
                    throw new InserimentoDatiException("Il cap del domicilio non è valido");
                genitore.setCapDomicilio(capDomicilio);
            }
            if(comuneDomicilio!=null && comuneDomicilio.length()!=0)
            {
                genitore.setComuneDomicilio(comuneDomicilio);
            }
            if(provinciaDomicilio!=null && provinciaDomicilio.length()!=0)
            {
                genitore.setProvinciaDomicilio(provinciaDomicilio);
            }
            if(categoriaAppartenenza!=null && categoriaAppartenenza.length()!=0)
            {
                genitore.setCategoriaAppartenenza(categoriaAppartenenza);
            }
            if(figli!=null)
            {
                genitore.setFigli(figli);
            }
            if(questionariCompilati!=null)
            {
                genitore.setQuestionariCompilati(questionariCompilati);
            }
            if(tipo!=null && tipo.length()!=0)
            {
                genitore.setTipo(tipo);
            }
            if(dipendentePresso!=null && dipendentePresso.length()!=0)
            {
                genitore.setDipendentePresso(dipendentePresso);
            }
            if(rapportiAteneoSalerno!=null && rapportiAteneoSalerno.length()!=0)
            {
                genitore.setRapportiAteneoSalerno(rapportiAteneoSalerno);
            }
            if(rapportiComuneFisciano!=null && rapportiComuneFisciano.length()!=0)
            {
                genitore.setRapportiComuneFisciano(rapportiComuneFisciano);
            }
            if(statusLavorativo!=null && statusLavorativo.length()!=0)
            {
                genitore.setStatusLavorativo(statusLavorativo);
            }
            if(scadenzaContratto!=null)
            {
                genitore.setScadenzaContratto(scadenzaContratto);
            }
            if(rapportoParentela!=null && rapportoParentela.length()!=0)
            {
                genitore.setRapportoParentela(rapportoParentela);
            }
            if(condizioneLavorativa!=null && condizioneLavorativa.length()!=0)
            {
                genitore.setCondizioneLavorativa(condizioneLavorativa);
            }
            if(tipoContratto!=null && tipoContratto.length()!=0)
            {
                genitore.setTipoContratto(tipoContratto);
            }
        }
        else
        {
            genitore = new Genitore(dataNascita, nome, cognome, codiceFiscale, email, 
                    comuneNascita, telefono, cittadinanza, indirizzoResidenza, numeroCivicoResidenza, 
                    capResidenza, comuneResidenza, provinciaResidenza, indirizzoDomicilio, numeroCivicoDomicilio,
                    capDomicilio, comuneDomicilio, provinciaDomicilio, figli, questionariCompilati, tipo, 
                    dipendentePresso, rapportiAteneoSalerno, rapportiComuneFisciano,
                    statusLavorativo, scadenzaContratto, categoriaAppartenenza, rapportoParentela, condizioneLavorativa, tipoContratto);
        }
       
        try{
            if(lettoDalDb==null)
            {
                //Inserisci nuovo genitore
                if(!dbgen.inserisci(genitore))
                    throw new GenitoreException("Inserimento fallito");
            }
            else
            {
                //Aggiorna il precedente
                if(!dbgen.replace(lettoDalDb, genitore))
                    throw new GenitoreException("Aggiornamento genitore fallito");
            }
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
    
    public Utente getPersonaleAsiloFromUsername(String username)
            throws Exception, DBConnectionException, SQLException,
            InserimentoDatiException {
        Database db = new Database();
        DBPersonaleAsilo dbPersonaleAsilo = new DBPersonaleAsilo(db);
        DBAccount dbAccount = new DBAccount(db);
        Account account = dbAccount.ricercaPerUsername(username);
        
        
        // controllo sul codice fiscale che deve essere a 16 cifre
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            PersonaleAsilo g = dbPersonaleAsilo.getPersonaleAsiloPerCF(account.getOwner()
                    .getCodiceFiscale());
            
            if (g == null)
                throw new Exception("Genitore non trovato");
            return g;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public Utente getPsicoPedagogoFromUsername(String username)
            throws Exception, DBConnectionException, SQLException,
            InserimentoDatiException {
        Database db = new Database();
        DBPsicopedagogo dbpsicopedagogo = new DBPsicopedagogo(db);
        DBAccount dbAccount = new DBAccount(db);
        Account account = dbAccount.ricercaPerUsername(username);
        
        
        // controllo sul codice fiscale che deve essere a 16 cifre
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            Psicopedagogo g = dbpsicopedagogo.getPsicopedagogoPerCF(account.getOwner()
                    .getCodiceFiscale());
            
            if (g == null)
                throw new Exception("Psicopedagogo non trovato");
            return g;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public Utente getEducatoreDidatticoFromUsername(String username)
            throws Exception, DBConnectionException, SQLException,
            InserimentoDatiException {
        Database db = new Database();
        DBEducatoreDidattico dbEducatoreDidattico = new DBEducatoreDidattico(db);
        DBAccount dbAccount = new DBAccount(db);
        Account account = dbAccount.ricercaPerUsername(username);
        
        
        // controllo sul codice fiscale che deve essere a 16 cifre
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            EducatoreDidattico g = dbEducatoreDidattico.getEducatoreDidatticoPerCF(account.getOwner()
                    .getCodiceFiscale());
            
            if (g == null)
                throw new Exception("Educatore non trovato");
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
        List<Bambino> lista = new ArrayList<Bambino>();
        
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
     * @throws DomandaIscrizioneException 
     */
    public boolean inserisciBambino(String username,Date dataNascita, String nome, String cognome,
            String codiceFiscale,  String comuneNascita,
            String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, String categoriaAppartenenza, int classe, Genitore genitore_richiedente, Genitore genitore_non_richiedente, List<Assenza> assenze, String iscrizioneClasse) throws BambinoException, DBConnectionException, InserimentoDatiException, DomandaIscrizioneException{
        
        Database db = new Database();
        DBBambino dbbamb = new DBBambino(db); 
        DBDomandaIscrizione dbdi = new DBDomandaIscrizione(db);
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        //controllo sul codice fiscale che deve essere a 16 cifre
        if(codiceFiscale == null || codiceFiscale.length() != 16)
            throw new InserimentoDatiException("Il codice fiscale non è valido");

         Bambino bambino;
         DomandaIscrizione di = new DomandaIscrizione();
         DomandaIscrizione nuovaDomanda = new DomandaIscrizione();
        Bambino lettoDalDb=null; //Questa inizializzazione è pericolosa ma volontaria
        try {
            lettoDalDb=dbbamb.ricercaBambinoPerCodFiscale(codiceFiscale);
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Impossibile connettersi alla base dati. Causato da:"+e.getMessage(), e);
        }
        if(lettoDalDb!=null)
        {
            //Bambino trovato nel db e caricato
            bambino=lettoDalDb;
            if(cognome!=null)
            {
                bambino.setCognome(cognome);
            }
            if(nome!=null)
            {
                bambino.setNome(nome);
            }
            if(dataNascita!=null)
            {
                bambino.setDataNascita(dataNascita);
            }
            if(comuneNascita!=null)
            {
                bambino.setComuneNascita(comuneNascita);
            }
            if(cittadinanza!=null)
            {
                bambino.setCittadinanza(cittadinanza);
            }
            if(indirizzoResidenza!=null)
            {
                bambino.setIndirizzoResidenza(indirizzoResidenza);
            }
            if(numeroCivicoResidenza!=null)
            {
                bambino.setNumeroCivicoResidenza(numeroCivicoResidenza);
            }
            if(capResidenza!=null)
            {
                if(capResidenza.length() != 5)
                    throw new InserimentoDatiException("Il cap della residenza non è valido");
                bambino.setCapResidenza(capResidenza);
            }
            if(comuneResidenza!=null)
            {
                bambino.setComuneResidenza(comuneResidenza);
            }
            if(provinciaResidenza!=null)
            {
                bambino.setProvinciaResidenza(provinciaResidenza);
            }
            if(indirizzoDomicilio!=null)
            {
                bambino.setIndirizzoDomicilio(indirizzoDomicilio);
            }
            if(numeroCivicoDomicilio!=null)
            {
                bambino.setNumeroCivicoDomicilio(numeroCivicoDomicilio);
            }
            if(capDomicilio!=null)
            {
                if(capDomicilio.length() != 5)
                    throw new InserimentoDatiException("Il cap del domicilio non è valido");
                bambino.setCapDomicilio(capDomicilio);
            }
            if(comuneDomicilio!=null)
            {
                bambino.setComuneDomicilio(comuneDomicilio);
            }
            if(provinciaDomicilio!=null)
            {
                bambino.setProvinciaDomicilio(provinciaDomicilio);
            }
            if(categoriaAppartenenza!=null)
            {
                bambino.setCategoriaAppartenenza(categoriaAppartenenza);
            }
            if(classe!=-1)
            {
                bambino.setClasse(classe);
            }
            if(genitore_non_richiedente!=null)
            {
                
                bambino.setGenitoreNonRichiedente(genitore_non_richiedente);
            }
            if(genitore_richiedente!=null)
            {
                bambino.setGenitore(genitore_richiedente);
            }
            if(assenze!=null)
            {
                ;//Registro non implementato
            }
            if(iscrizioneClasse!=null)
            {
                bambino.setIscrizioneClasse(iscrizioneClasse);
            }
        }
        else
        {
            bambino = new Bambino(dataNascita, nome, cognome, codiceFiscale, comuneNascita,
                cittadinanza, indirizzoResidenza, numeroCivicoResidenza, capResidenza, comuneResidenza,
                provinciaResidenza, indirizzoDomicilio, numeroCivicoDomicilio, capDomicilio, comuneDomicilio, 
                provinciaDomicilio, categoriaAppartenenza, classe, genitore_richiedente, genitore_non_richiedente, assenze, iscrizioneClasse);
        }
        di.setBambino(bambino);
        di.setGenitore(bambino.getGenitore());
        try{
            if(lettoDalDb==null)
            {
                //Inserisci nuovo bambino
                if(!dbbamb.inserisci(bambino))
                    throw new BambinoException("Inserimento fallito");
                if(!dbdi.inserisci(di))
                {
                    throw new DomandaIscrizioneException("Impossibile inserire domanda iscrizione");
                }
            }
            else
            {
                //Aggiorna il precedente
                if(!dbbamb.replace(lettoDalDb, bambino))
                    throw new BambinoException("Aggiornamento bambino fallito");
            }
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
        Database db = new Database();
        db.apriConnessione();
        DBAccount dbacc = new DBAccount(db);
        DBGenitore dbgen = new DBGenitore(db);
        Account newAcc = new Account();
        Genitore newGen = new Genitore();
        newGen.setCodiceFiscale(cf);
        newGen.setNome(nome);
        newGen.setCognome(cognome);
        newGen.setEmail(mail);
        newGen.setTelefono(telefono);
        newGen.setTipo(profilo_appartenenza);
        newAcc.setOwner(newGen);
        
        //E' ora di cercare un username libero
        int usernameIndex=0;
        String selectedUsername=nome.charAt(0)+"."+cognome;
        try {
            //TODO Make it efficient, because right now it isnt
            while(dbacc.ricercaPerUsername(selectedUsername)!=null)
            {
                selectedUsername=nome.charAt(0)+"."+cognome;
                selectedUsername+=usernameIndex;
                usernameIndex++;
            }
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Errore di esecuzione della query. Causato da:"+e.getMessage(), e);
        }
       newAcc.setUserName(selectedUsername);
       Random r = new Random();
       newAcc.setPassWord(nome+r.nextInt());
       boolean result=dbgen.inserisci(newGen);
       if(result)
       {
           result=result&&dbacc.inserisci(newAcc);
       }
       if(result)
       {
           //Se inserimento di account e genitore hanno successo
           //invia la mail al genitore
           ControlNotificaMail cnm = ControlNotificaMail.getInstance();
           ArrayList<Utente> destinatari = new ArrayList<Utente>();
           destinatari.add(newGen);
           String oggetto = "Registrazione al sistema @silo";
           String testoEmail = "Benvenuto "+newGen.getNome()+" nel sistema @silo.\n" +
                   "Il tuo username è: "+newAcc.getUserName()+"\n"+
                   "La tua password è: "+newAcc.getPassWord()+"\n"+
                   "Ti auguriamo una buona permanenza nel nostro asilo!\n\n"+
                   "La gestione";
           Messaggio m = new NotificaMailRegistrazione(destinatari,oggetto,testoEmail,newAcc,newGen);
           try {
            cnm.inviaMail(m);
        } catch (MessagingException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Impossibile inviare l'email. Causato da: "+e.getMessage(), e);
        } catch (Throwable e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Eccezione generica. Causata da:"+ e.getMessage(), e);
        }
       }
       db.chiudiConnessione();
       return result;
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
