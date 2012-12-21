package atsilo.application;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.CompilaQuestionario;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;
import atsilo.entity.StatisticheQuestionario;
import atsilo.exception.DBConnectionException;
import atsilo.exception.QuestionarioException;
import atsilo.storage.DBCampoDomandaQuestionario;
import atsilo.storage.DBCompilaQuestionario;
import atsilo.storage.DBDomandaQuestionario;
import atsilo.storage.DBGenitore;
import atsilo.storage.DBQuestionario;
import atsilo.storage.DBRispostaQuestionario;
import atsilo.storage.Database;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012
 *-----------------------------------------------------------------
 */

/**
 * Class that control and manages a questionnaire
 */
public class ControlQuestionario {
    
    private static final ControlQuestionario INSTANCE = new ControlQuestionario();   
    
    
    /**
     * Contructor
     */
    private ControlQuestionario() {}
    
    
    /**
     * Adds a new questionnaire in the database
     * @param questionario is the questionnaire to add
     * @pre questionario != null
     * @return true if the questionnaire was added correctly, else false
     */
    public void inserisciQuestionario(Questionario questionario) throws DBConnectionException, QuestionarioException {
        
        Database db = new Database();
        DBQuestionario storageQ = new DBQuestionario(db);
        DBDomandaQuestionario storageD = new DBDomandaQuestionario(db);
        DBCampoDomandaQuestionario storageC = new DBCampoDomandaQuestionario(db);
        List<DomandaQuestionario> domande = questionario.getDomande();
        List<CampoDomandaQuestionario> campi;
        
        //TODO inserire campi e domande
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!storageQ.inserisci(questionario))
                throw new QuestionarioException("Inserimento fallito");
            for(DomandaQuestionario d : domande)
            {
                d.setIdQuestionario(questionario.getId());
                storageD.inserisci(d);
                campi = d.getCampi();
                for(CampoDomandaQuestionario c : campi)
                {   c.setIdDomandaQuestionario(d.getId());  
                storageC.inserisci(c);
                }
            }
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    public DomandaQuestionario getDomanda(int idDomanda) throws DBConnectionException, SQLException
    {
        Database db = new Database();
        DBDomandaQuestionario dbdomande = new DBDomandaQuestionario(db);
        if(!db.apriConnessione())
        { throw new DBConnectionException("Connessione al DB fallita");}
        DomandaQuestionario domanda = dbdomande.getDomanda(idDomanda);
        return domanda;
    }
    /**
     * Deletes a quiestionnaire from the database if the questionnaire is not active
     * (the actually date is not between the start date and the end date)
     * @param id is the quiestionnaire identificative
     * @pre id > 0
     * @return the questionnaire deleted
     */
    public void eliminaQuestionario(int id) throws DBConnectionException, QuestionarioException {
        
        Database db = new Database();
        DBQuestionario storageQ = new DBQuestionario(db);
        DBRispostaQuestionario storageR= new DBRispostaQuestionario(db);
        DBDomandaQuestionario storageD= new DBDomandaQuestionario(db);
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            try {
                
                Questionario daCancellare = storageQ.getQuestionario(id);
                List<DomandaQuestionario> domande = storageD.getDomandeQuestionario(id);
                
                for(DomandaQuestionario domanda : domande)
                {
                    List<RispostaQuestionario> risposte_domanda = storageR.getRisposteDomandaSpecifica(domanda.getId());
                    for(RispostaQuestionario risposta_domanda : risposte_domanda)
                    {
                        storageR.delete(risposta_domanda);
                    }
                }
                if(!this.isEditable(daCancellare)){
                    throw new QuestionarioException("Impossibile eliminare un questionario attivo");
                }
                else {
                    storageQ.delete(daCancellare);
                }
            } catch (SQLException e) {
                throw new QuestionarioException("Questionario non trovato");
            }
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    /**
     * This method check if the questionario is editable
     * A questionario is editable if the actual date is before the inital date of questionario
     * and the actual date is after the final date of questionario
     * @param Questionario 
     * @pre q != null
     * @return true if the questionario is deletable, false is the questionario isnt deletable
     */
    public boolean isEditable(Questionario q)
    {
        Calendar dataAttuale = Calendar.getInstance();
        int anno = dataAttuale.get(Calendar.YEAR);
        int mese = dataAttuale.get(Calendar.MONTH) + 1;
        int giorno = dataAttuale.get(Calendar.DAY_OF_MONTH);
        Date dataNow = new Date(dataAttuale.getTimeInMillis());
        
        Date dataInizio = q.getPeriodo_inizio();
        Date dataFine = q.getPeriodo_fine();
        
        if(dataNow.after(dataInizio) &&  dataNow.before(dataFine)){
            return false;
        }
        else
        {
            return true;
        }
        
    }
    
    
    /**
     * Substitutes the questionnaire questions list with a new quiestions list
     * 
     * @param idQquestionario is the quiestionnaire identificative
     * @param domande is the new quistions list to add
     * @pre id>0 AND newQuestionario != null
     * @return true if the list was substituted correctly, else false
     */
    public void modificaQuestionario(int idQuestionario, Questionario newQuestionario) throws DBConnectionException,
    QuestionarioException {
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);
        DBDomandaQuestionario storageD = new DBDomandaQuestionario(db);
        DBCampoDomandaQuestionario storageC = new DBCampoDomandaQuestionario(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            try {
                if(!storage.replace(storage.getQuestionario(idQuestionario), newQuestionario))
                    throw new QuestionarioException("Inserimento domande nel questionario fallito");
                
                List<DomandaQuestionario> domande_nuove = newQuestionario.getDomande();
                List<DomandaQuestionario> domande_vecchie = storageD.getDomandeQuestionario(idQuestionario);
                
                //cancello le domande vecchie
                for(DomandaQuestionario domanda_vecchia : domande_vecchie )
                {
                    storageD.delete(domanda_vecchia);
                }
                //inserisco le domande nuove
                for(DomandaQuestionario domanda_nuova : domande_nuove )
                {
                    domanda_nuova.setId(0);
                    domanda_nuova.setIdQuestionario(newQuestionario.getId());
                    storageD.inserisci(domanda_nuova);
                }
                
                //cancello i campi vecchi
                for(DomandaQuestionario domanda_vecchia : domande_vecchie)
                {
                    List<CampoDomandaQuestionario> campi_vecchi = storageC.getCampiDomandaQuestionario(domanda_vecchia.getId());
                    for(CampoDomandaQuestionario c : campi_vecchi)
                    {
                        storageC.delete(c);
                    }
                }
                
                //inserisco i campi nuovi
                for(DomandaQuestionario domanda_nuova : domande_nuove)
                {
                    List<CampoDomandaQuestionario> campi_nuovi = domanda_nuova.getCampi();
                    for(CampoDomandaQuestionario c : campi_nuovi)
                    {
                        c.setIdDomandaQuestionario(domanda_nuova.getId());
                        c.setId(0);
                        storageC.inserisci(c);
                    }
                }
               
                /*
                for(DomandaQuestionario d: domande){
                    
                        DomandaQuestionario vecchia = storageD.getDomanda(d.getId());
                        storageD.replace(vecchia,d);
                        List<CampoDomandaQuestionario> campi_nuovi = d.getCampi();
                        List<CampoDomandaQuestionario> campi_vecchi = vecchia.getCampi();
                        
                        for(CampoDomandaQuestionario c:campi_vecchi){
                        
                           storageC.delete(c);
                        }
                        
                        for(CampoDomandaQuestionario c:campi_nuovi){
                            
                            storageC.inserisci(c);
                         }
                    
                
                
                }*/
            }
                
             catch (SQLException e) {
                new QuestionarioException("Impossibile scrivere nel Database");
            }
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Changes the questionnaire start date
     * @param newData is the new start date
     * @pre id>0 AND newData != null
     * @return true if the date was set correctly, else false
     */
    public void spostaDataInizio(int idQuestionario, Date newData) throws DBConnectionException,
    QuestionarioException {
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            Questionario q = storage.getQuestionario(idQuestionario);
            q.setPeriodo_inizio(newData);
            //sostituisco il questionario con la nuova data
            if(!storage.replace(storage.getQuestionario(idQuestionario), q))
                throw new QuestionarioException("Operazione fallita");
        }
        catch (SQLException e) {
            throw new QuestionarioException("Impossibile modificare la data di inizio del questionario");   
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Changes the questionnaire end date
     * @param newData is the new end date
     * @pre id>0 AND newData != null
     * @return true if the date was set correctly, else false
     */
    public void spostaDataFine(int idQuestionario, Date newData) throws DBConnectionException,
    QuestionarioException {
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);
        
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            Questionario q = storage.getQuestionario(idQuestionario);
            q.setPeriodo_fine(newData);
            //sostituisco il questionario con la nuova data
            if(!storage.replace(storage.getQuestionario(idQuestionario), q))
                throw new QuestionarioException("Operazione fallita");
        }
        catch (SQLException e) {
            throw new QuestionarioException("Impossibile modificare la data di fine del questionario");   
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    
    
    /**
     * Search a questionnaire by name
     * @param nome is the questionnaire name
     * @return a questionnaire
     */
    public List<Questionario> ricercaQuestionario(String nome) throws DBConnectionException, QuestionarioException {
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);
        
        List<Questionario> toReturn;
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            toReturn = storage.ricercaQuestionariPerNome(nome);
            if(toReturn== null || toReturn.isEmpty())
                throw new QuestionarioException("Nessun questionario con nome"+nome);
            return toReturn;
        } 
        catch (SQLException e) {
            throw new DBConnectionException("Ricerca fallita");
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    
    
    /**
     * Insert a answers list in a questionnaire. Every answer correspond to its question.
     * @param questionario is the questionnaire compiled
     * @param risposte is a answers list
     * @param CFchiCompila is the parent key
     * @pre id>0 AND risposte != null AND CFchiCompila != null
     * @return true if the list was added correctly, else false
     * @throws DBConnectionException 
     * @throws QuestionarioException 
     */
    public void compilaQuestionario(int idQuestionario, List<RispostaQuestionario> risposte, String CFchiCompila) throws DBConnectionException, QuestionarioException{
        Database db = new Database();    
        
        DBRispostaQuestionario storageRisposte = new DBRispostaQuestionario(db);
        DBCompilaQuestionario storageCompila = new DBCompilaQuestionario(db);
        
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(risposte==null ||risposte.isEmpty())
                throw new QuestionarioException("risposte non valide");
            
            //inserisce il questionario compilato nel database
            CompilaQuestionario c = new CompilaQuestionario(idQuestionario, CFchiCompila);
            storageCompila.inserisci(c); 
            
            //inserisco le risposte nel database
            for(RispostaQuestionario r : risposte)
                storageRisposte.inserisci(r);
            
            
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Gets all the questionnaires not yet compiled by a 
     * parent from all questionnaires compilable
     * @param genitore is the parent
     * @pre CFgenitore != null
     * @return a questionnaires list
     * @throws QuestionarioException 
     */
    public List<Questionario> getQuestionariDaCompilare(String CFgenitore) throws DBConnectionException, QuestionarioException {
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);
        DBCompilaQuestionario compila =new DBCompilaQuestionario(db);
        List<Questionario> toReturn = new ArrayList<Questionario>();
        List<Questionario> allQuestComp= new ArrayList<Questionario>();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            allQuestComp = storage.visualizzaQuestionariCompilabili();
            for(Questionario q : allQuestComp)
            {
                //controllo se quel questionario non è gia stato compilato in precedenza
                //dal genitore
                if(!(compila.isCompilatoDa(q.getId(), CFgenitore)))
                {
                    //System.out.println("id questionario"+q.getId());
                    toReturn.add(q);
                }
            }
        } 
        catch (SQLException e){
            throw new QuestionarioException("Errore caricamento questionari");
        }
        finally{
            db.chiudiConnessione();
        }
        return toReturn;
    }
    
    
    
    /**
     * This method has to be called when you want a full questionnaire
     * @param idQuestionario is the questionnaire key
     * @param CFgenitore is the parent key for whom the method loads the questionnaires
     * @pre id>0 AND CFgenitore != null
     * @post return Questionario != null
     * @return a full questionnaire with all questions and all question fields
     * @throws DBConnectionException
     * @throws SQLException 
     * @throws QuestionarioException 
     */
    public Questionario caricaQuestionarioDaCompilare(int idQuestionario, String CFgenitore) throws DBConnectionException, SQLException, QuestionarioException{
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);
        DBDomandaQuestionario storageDomande= new DBDomandaQuestionario(db);
        DBCampoDomandaQuestionario storageCampi = new DBCampoDomandaQuestionario(db);
        DBRispostaQuestionario storageRisposte = new DBRispostaQuestionario(db);
        List<DomandaQuestionario> domande;
        List<RispostaQuestionario> risposte;
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Questionario toReturn = storage.getQuestionario(idQuestionario);
            //setto le domande del questionario
            domande = storageDomande.getDomandeQuestionario(idQuestionario);
            if(domande == null || domande.isEmpty()){
                throw new QuestionarioException("Nessuna domanda presente nel questionario");
            }
            else{
                toReturn.setDomande(domande);
            }
            List<CampoDomandaQuestionario> campi =new ArrayList<CampoDomandaQuestionario>();
            
            //setto i campi per ogni domanda
            for(DomandaQuestionario d : toReturn.getDomande()){
                campi = storageCampi.getCampiDomandaQuestionario(d.getId());
                this.precaricaDomande(toReturn,campi,db,CFgenitore);
                d.setCampi(campi);
            }
            
            return toReturn;
            
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Sets an answer to the relative question
     * @param q is the questionnaire to compile
     * @param campi is a list of a question field 
     * @param cf is the parent key
     * @pre q!=null AND campi!=null AND cf!=null
     * @throws SQLException
     */
    private void precaricaDomande (Questionario q,List<CampoDomandaQuestionario> campi, Database db, String cf) throws SQLException
    {
        DBDomandaQuestionario storageDomande= new DBDomandaQuestionario(db);
        DBRispostaQuestionario storageRisposte = new DBRispostaQuestionario(db);
        DBCampoDomandaQuestionario storageCampi = new DBCampoDomandaQuestionario(db);
        List<RispostaQuestionario> risposte= storageRisposte.getRisposteGenitore(cf);
        //per tutte le risposte mai date dal genitore
        for(RispostaQuestionario r : risposte){
            
            DomandaQuestionario domandaRisposta = storageDomande.getDomanda(r.getIdDomanda());
            domandaRisposta.setCampi(storageCampi.getCampiDomandaQuestionario(domandaRisposta.getId()));
            
            
            if(domandaIsEqual(domandaRisposta,campi,db))
            {
             
                q.precaricaRispostaAllaDomanda(r);
            }
        }
        
    }
    
    
    
    /**
     * Controls if two questions are equals
     * @param idDomanda is question key to compare
     * @param d1 is the quistion to compare with d1
     * @pre idDomanda>0 AND d1!=null
     * @return true if the questions are equals, else false
     * @throws SQLException
     */
    public boolean domandaIsEqual(int idDomanda, DomandaQuestionario d1) throws SQLException
    { 
        Database db = new Database();
        db.apriConnessione();
        DBCampoDomandaQuestionario storageCampi = new DBCampoDomandaQuestionario(db);
        DBDomandaQuestionario storageDomanda= new DBDomandaQuestionario(db);
        DomandaQuestionario d = storageDomanda.getDomanda(idDomanda);
        
        int sent=0;
        List<CampoDomandaQuestionario> campi =storageCampi.getCampiDomandaQuestionario(d.getId());
        d.setCampi(campi);
        List<CampoDomandaQuestionario> campi2 =storageCampi.getCampiDomandaQuestionario(d1.getId());
        d1.setCampi(campi2);
        
        
        
        int numCampiDomanda = campi.size();
        int numCampiDomanda2 = campi2.size();
        String descr1= d.getDescrizione();
     
        if(d.getDescrizione().endsWith("'"))
        {
            descr1  = d.getDescrizione().substring(1,d.getDescrizione().length()-1);
        }
     
        if(!(descr1.equalsIgnoreCase(d1.getDescrizione())))
        {
            return false;
        }
        
        if(numCampiDomanda != numCampiDomanda2)
        {
            return false;
        }
        
        for(CampoDomandaQuestionario campiGenitore : campi)
        {
            for(CampoDomandaQuestionario campiQuest : campi2)
            {
                if((campiQuest.getDescrizione().equals(campiGenitore.getDescrizione()))&&((campiQuest.getTipo().equals(campiGenitore.getTipo())))){
                    sent ++;
                }
                
            }
            
        }
        db.chiudiConnessione();
        if(sent==campi.size())
        {
           
            return true;
        }
        else
        {
            return false;
        }
        
    }
    
    
    
    
    /**
     * Controls if a question has a precise list of fields
     * @param d question to compare
     * @param c are the fields to compare with the question fields
     * @pre D!= null AND c!=null
     * @param db connessione al db
     * @return true if the fields are equals, else false
     */
    private boolean domandaIsEqual(DomandaQuestionario d, List<CampoDomandaQuestionario> c,Database db)
    {
        int sent=0;
        List<CampoDomandaQuestionario> campi =d.getCampi();
        
        if(campi==null)
        {return false;}
        
        int numCampiDomanda =campi.size();
        
        if(numCampiDomanda != c.size())
        {
            return false;
        }
        
        for(CampoDomandaQuestionario campiGenitore : campi)
        {
            for(CampoDomandaQuestionario campiQuest : c)
            {
                if((campiQuest.getDescrizione().equalsIgnoreCase(campiGenitore.getDescrizione()))&&((campiQuest.getTipo().equals(campiGenitore.getTipo())))){
                    sent ++;
                }
                
            }
            
        }
        if(sent==campi.size())
        {
            // System.out.println("si sono uguali:id domanda del genitore passata:::"+d.getId());
            return true;
        }
        else
        {return false;}
        
    }
    
    /**
     * Insert a new question in a questionnaire and all its fields
     * if the fields is null or empty, the method exit with a QuestionarioException
     * @param idQuestionario is the questionnaire identifier
     * @param domanda is the question to add in the questionnaire
     * @pre idQuestionario>0 AND domanda != null
     * @post questionario.getDomande.size() = @pre questionario.getDomande.size() +1
     * @throws DBConnectionException
     * @throws QuestionarioException
     */
    public void inserisciDomanda(int idQuestionario, DomandaQuestionario domanda) throws DBConnectionException, QuestionarioException{
        Database db = new Database();
        DBDomandaQuestionario storageDomanda = new DBDomandaQuestionario(db);
        DBCampoDomandaQuestionario storageC = new DBCampoDomandaQuestionario(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(domanda.getCampi()==null || domanda.getCampi().isEmpty())
                throw new QuestionarioException("Campi domanda non validi");
            
            if(!storageDomanda.inserisci(domanda))
                throw new QuestionarioException("Errore inserimento domanda in questionario");
            
            for(CampoDomandaQuestionario c : domanda.getCampi() )
                storageC.inserisci(c);
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    
    
    
    /**
     * Delete a question from a questionnaire
     * @param idDomanda is the question identifier
     * @pre idDomanda>0
     * @post questionario.getDomande.size() = @pre questionario.getDomande.size() -1
     * @throws DBConnectionException
     * @throws QuestionarioException
     */
    public void eliminaDomanda(int idDomanda) throws DBConnectionException, QuestionarioException{
        Database db = new Database();
        DBDomandaQuestionario storageDomanda = new DBDomandaQuestionario(db);
        
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            try {
                storageDomanda.delete(storageDomanda.getDomanda(idDomanda));
            } catch (SQLException e) {
                throw new QuestionarioException("Impossibile rimuovere la domanda");
            }
        } 
        finally{
            db.chiudiConnessione();
        }
        
    }
    
    
    
    
    /**
     * Replace an old question with a new one
     * @param idVecchiaDomanda is the old question identifier
     * @param newDomanda is the new question 
     * @pre idVecchiDomanda>0 AND new Domanda!=null
     * @throws DBConnectionException
     * @throws QuestionarioException
     */
    public void modificaDomanda(int idVecchiaDomanda, DomandaQuestionario newDomanda) throws DBConnectionException, QuestionarioException{
        Database db = new Database();
        DBDomandaQuestionario storageDomanda = new DBDomandaQuestionario(db);
        
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            try {
                storageDomanda.replace(storageDomanda.getDomanda(idVecchiaDomanda), newDomanda);
                
            } catch (SQLException e) {
                throw new QuestionarioException("Impossibile rimuovere la domanda");
            }
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    /**
     * Gets the statistics from a questionnaire
     * @param questionario is the questionnaire to analyze
     * @pre idQuestionario>0
     * @return the questionnaire statistics 
     * @throws QuestionarioException 
     */
    public StatisticheQuestionario getStatistische(int idQuestionario) throws QuestionarioException{
        Database db = new Database();
        db.apriConnessione();
        StatisticheQuestionario statq= new StatisticheQuestionario();
        
        DBQuestionario dbq =new DBQuestionario (db);
        DBCompilaQuestionario dbcq=new DBCompilaQuestionario(db);
        DBDomandaQuestionario dbdq = new DBDomandaQuestionario(db);
        DBRispostaQuestionario dbrq =new DBRispostaQuestionario(db);
        DBCampoDomandaQuestionario dbcmp = new DBCampoDomandaQuestionario(db);
        HashMap<Integer,Map<Integer, Integer>> statistiche = new HashMap<Integer,Map<Integer, Integer>>();
        
        try {
            Questionario sq= dbq.getQuestionario(idQuestionario);
            statq.setQuestionario(sq);
            statq.setNumber_comp(dbcq.getNumeroCompilazioniQuestionario(idQuestionario));
            //dato un questionario prelevo le domande del questionario stesso
            List<DomandaQuestionario> domande = dbdq.getDomandeQuestionario(idQuestionario);
            
            for(DomandaQuestionario d : domande)
            {
                //data una domanda prelevo le risposte possibili
                List<CampoDomandaQuestionario> campi = dbcmp.getCampiDomandaQuestionario(d.getId());
                HashMap<Integer, Integer> statistiche_risposte =new HashMap<Integer, Integer>();
                //data un campo prelevo le risposte che sono associate a quel campo
                int sentinella=0;
                
                for(CampoDomandaQuestionario c: campi)
                {
                    if((c.getTipo().equals("text")))
                    {
                        sentinella=1;
                        break;
                    }
                    if((statq.getNumeroComp()!=0))
                    {
                        int num_risp = dbrq.getNumberOfCompiler(d.getId(), c.getValore());
                        int perc_num_risp= num_risp;
                        //System.out.println("campo id: "+c.getId());
                        //System.out.println("perc: "+perc_num_risp);
                        statistiche_risposte.put(c.getId(), perc_num_risp);
                    }
                    else
                    {
                        statistiche_risposte.put(c.getId(),0);
                    }
                    
                    
                }
                if(sentinella!=1)
                {statistiche.put(d.getId(), statistiche_risposte);}
                else
                {sentinella=0;}
                
            }
            
            statq.setRisposte(statistiche);
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            throw new QuestionarioException("Errore statistiche");
        }
        db.chiudiConnessione();
        return statq;
        
    }
    
    
    /**
     * Gets all the questionnaires 
     * @return a list of all questionnaire in the database
     * @throws DBConnectionException
     */
    public List<Questionario> getAllQuestionari() throws DBConnectionException{
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);
        
        Iterable<Questionario> iter;
        List<Questionario> toReturn = new ArrayList<Questionario>();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            iter = storage.getAll();
            Iterator<Questionario>itq =iter.iterator();
            while(itq.hasNext())
                toReturn.add(itq.next());
            return toReturn;
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    /**
     * Gets all the questions answered by a parent
     * @param CFgenitore is the parent key
     * @return a List of DomandaQuestionario
     * @throws DBConnectionException
     * @throws SQLException
     */
    private List<DomandaQuestionario> getDomandeRisposteDaGenitore(String CFgenitore) throws DBConnectionException, SQLException{
        Database db = new Database();
        DBRispostaQuestionario storageR = new DBRispostaQuestionario(db);
        DBDomandaQuestionario storageD = new DBDomandaQuestionario(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        
        try{
            List<RispostaQuestionario> risposte = storageR.getRisposteGenitore(CFgenitore);
            List<DomandaQuestionario> toReturn = new ArrayList<DomandaQuestionario>();
            
            for(RispostaQuestionario r : risposte)
                toReturn.add(storageD.getDomanda(r.getIdDomanda()));
            
            return toReturn;
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    /**
     * restituisce le risposte aperte di una determinata domanda di un determinato questionario
     * l'arraylist sarà vuoto nel caso in cui quella domanda o quel questionario non esistano,
     * o nel caso in cui la domanda non sia di tipo text (cioè aperta)
     * @param idQuestionario
     * @param idDomanda
     * @return
     * @throws DBConnectionException 
     * @throws SQLException 
     */
    public List<String> getRisposteAperte(int idDomanda) throws DBConnectionException, SQLException
    {  
        Database db = new Database();
        ArrayList<String> toReturn = new ArrayList<String>();
        if(!db.apriConnessione())
        {
            throw new DBConnectionException("Connessione al DB fallita");
        }
        try {
            
            DBCampoDomandaQuestionario dbcd= new DBCampoDomandaQuestionario(db);
            List<CampoDomandaQuestionario> campo= dbcd.getCampiDomandaQuestionario(idDomanda);
            
            for(CampoDomandaQuestionario n : campo)
            {
                if(n.getTipo().equals("text"))
                {
                    DBRispostaQuestionario dbrisposta= new DBRispostaQuestionario(db);
                    List<RispostaQuestionario> risp= dbrisposta.getRisposteDomandaSpecifica(idDomanda);
                    
                    for(RispostaQuestionario r : risp)
                    {
                        toReturn.add(r.getValore());
                    }
                }
            }
            
            return toReturn;
            
        } finally{
            db.chiudiConnessione();
            
        }
        
    }
    
    
    
    
    /**
     * Gets the single istance of this class
     * @return a new ControlQuestionario
     */
    public static ControlQuestionario getIstance(){
        return INSTANCE;
    }
    
    
    
    /**
     * Gets a questionnaire with a precise id 
     * @param id id the questionnaire id to get
     * @pre id>0
     * @return a questionnaire
     * @throws SQLException 
     */
    public Questionario getQuestionario(int id) throws SQLException {
        // TODO Scheletro generato automaticamente
        Database db = new Database();
        DBQuestionario storageQ = new DBQuestionario(db);
        db.apriConnessione();
        Questionario q=storageQ.getQuestionario(id);
        db.chiudiConnessione();
        return q;
    }
    
}
