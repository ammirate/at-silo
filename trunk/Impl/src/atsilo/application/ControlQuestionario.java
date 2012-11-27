package atsilo.application;

import atsilo.entity.*;
import java.sql.Date;

import java.util.List;

/**
 * Class that control and manages a questionnaire
 * 
 * @author Antonio Cesarano
 */
public class ControlQuestionario {

    private static  ControlQuestionario control;


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
    public boolean inserisciQuestionario(Questionario questionario){
        return false;
    }
    
    
    /**
     * Deletes a quiestionnaire from the database
     * @param id is the quiestionnaire identificative
     * @return the questionnaire deleted
     */
    public Questionario eliminaQuestionario(String id){
        return null;
    }
    
    
    /**
     * Substitutes the questionnaire questions list with a new quiestions list
     * @param idQquestionario is the quiestionnaire identificative
     * @param domande is the new quistions list to add
     * @return true if the list was substituted correctly, else false
     */
    public boolean modificaQuestionario(String idQuestionario, List<DomandaQuestionario> domande){
        return false;
    }
    
    
    /**
     * Changes the quiestionnaire start date
     * @param newData is the new start date
     * @return true if the date was setted correctly, else false
     */
    public boolean spostaDataInizio(Questionario questionario, Date newData){
        return false;
    }
    
    
    /**
     * Changes the quiestionnaire end date
     * @param newData is the new end date
     * @return true if the date was setted correctly, else false
     */
    public boolean spostaDataFine(Questionario questionario, Date newData){
        return false;
    }
    
    
    /**
     * Insert a answers list in a questionnaire
     * @param questionario is the questionnaire compiled
     * @param risposte is a answers list
     * @return true if the list was added correctly, else false
     */
    public boolean compilaQuestionario(Questionario questionario, List<RispostaQuestionario> risposte){
        return false;
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
        return null;
    }
    
}
