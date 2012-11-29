package atsilo.application;

import atsilo.entity.*;
import atsilo.exception.DBConnectionException;
import atsilo.exception.RegistroException;
import atsilo.storage.Database;
import java.sql.Date;
import java.util.List;
import test.storage.*;
import atsilo.exception.*;

/**
 * Class that control and manages a questionnaire
 *
 * @author Antonio Cesarano
 */
public class ControlQuestionario {

    private static final ControlQuestionario INSTANCE = new ControlQuestionario();
     StubQuestionario sQuestionario;
     StubDomandaQuestionario sDomanda;
     StubCampoDomandaQuestionario sCampoDomanda;
     StubRispostaQuestionario sRisposta;
    Database db;
    
    
    
    /**
     * Contructor
     */
    private ControlQuestionario() {
    }
    
    
    /**
     * Adds a new questionnaire in the database
     * @param questionario is the questionnaire to add
     * @return true if the questionnaire was added correctly, else false
     */
    public void inserisciQuestionario(Questionario questionario) throws DBConnectionException, QuestionarioException {
       
        StubQuestionario sQuestionario = new StubQuestionario();
        Database db = new Database();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!sQuestionario.inserisciQuestionario(questionario))
                throw new QuestionarioException("Inserimento fallito");
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    
    
    
    
    /**
     * Deletes a quiestionnaire from the database
     * @param id is the quiestionnaire identificative
     * @return the questionnaire deleted
     */
    public Questionario eliminaQuestionario(String id) throws DBConnectionException, QuestionarioException {
        StubQuestionario sQuestionario = new StubQuestionario();
        Database db = new Database();
        Questionario toReturn;
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            toReturn = sQuestionario.eliminaQuestionario(id);
            if(toReturn == null)
                throw new QuestionarioException("Questionario inesistente");
            return toReturn;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Substitutes the questionnaire questions list with a new quiestions list
     * @param idQquestionario is the quiestionnaire identificative
     * @param domande is the new quistions list to add
     * @return true if the list was substituted correctly, else false
     */
    public void modificaQuestionario(String idQuestionario, List<DomandaQuestionario> domande) throws DBConnectionException,
                                                                               QuestionarioException {
        StubQuestionario sQuestionario = new StubQuestionario();
        Database db = new Database();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!sQuestionario.modificaQuestionario(idQuestionario, domande))
                throw new QuestionarioException("Inserimento domande nel questionario fallito");
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Changes the quiestionnaire start date
     * @param newData is the new start date
     * @return true if the date was setted correctly, else false
     */
    public void spostaDataInizio(String idQuestionario, Date newData) throws DBConnectionException,
                                                                               QuestionarioException {
        StubQuestionario sQuestionario = new StubQuestionario();
        Database db = new Database();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!sQuestionario.setDataInizio(idQuestionario, newData))
                throw new QuestionarioException("Operazione fallita");
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Changes the quiestionnaire end date
     * @param newData is the new end date
     * @return true if the date was setted correctly, else false
     */
    public void spostaDataFine(String idQuestionario, Date newData) throws DBConnectionException,
                                                                           QuestionarioException {
        StubQuestionario sQuestionario = new StubQuestionario();
        Database db = new Database();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!sQuestionario.setDataFine(idQuestionario,newData))
                throw new QuestionarioException("Operazione fallita");
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Insert a answers list in a questionnaire
     * @param questionario is the questionnaire compiled
     * @param risposte is a answers list
     * @return true if the list was added correctly, else false
     */
    public boolean compilaQuestionario(String idQuestionario, List<RispostaQuestionario> risposte, Genitore chiCompila) throws DBConnectionException,
                                                                                   QuestionarioException {
        StubQuestionario sQuestionario = new StubQuestionario();
        Database db = new Database();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!sQuestionario.setRisposte(idQuestionario, risposte))
                throw new QuestionarioException("Questionario non compilato");
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Gets all the questionnaires compiled by a parent
     * @param genitore is the parent
     * @return a questionnaires list
     */
    public List<Questionario> getQuestionariCompilati(Genitore genitore){
        return null;
    }
    
    
    /**
     * Gets all the questionnaire not yet compiled by a parent
     * @param genitore is the parent
     * @return a questionnaires list
     */
    public List<Questionario> getQuestionariDaCompilare(Genitore genitore){
        return null;
    }
    
    
    /**
     * gets all the renunciation questionnaires
     * @return a questionnaires list
     */
    public List<Questionario> getQuestionariRinuncia(){
        return null;
    }
    
    
    /**
     * Gets the statistics from a questionnaire
     * @param questionario is the questionnaire to analyze
     * @return the questionnaire statistics 
     */
    public List<String> getStatistische(Questionario questionario){
        return null;
    }
    
    
    /**
     * Search a questionnaie by name
     * @param nome is the questionnaire name
     * @return a questionnaire
     */
    public List<Questionario> ricercaQuestionario(String nome){
        return null;
    }
    
    
    /**
     * Gets the single istance of this class
     * @return a new ControlQuestionario
     */
    public ControlQuestionario getIstance(){
        return INSTANCE;
    }
    
}
