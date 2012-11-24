package atsilo.application;

import atsilo.entity.*;


/**
 * Class that controls and manages the questionnaire answers
 * 
 * @author Antonio Cesarano
 */
public class ControlRispostaQuestionario {
    
    /**
     * Constructor
     */
    public ControlRispostaQuestionario() {}
    
    
    /** 
     * Adds an answers into a question
     * @param idQuestionario is the questionnaire identifier
     * @param idDomanda is the quiestion identifier
     * @param risposta is the answer to the question
     * @return true if the answer was added correctly, else false
     */
    public boolean inserisciRisposta(String idQuestionario, String idDomanda, RispostaQuestionario risposta){
        return false;
    }
    
    
    /**
     * Gets an answer about a question
     * @param idQuestionario is the questionnaire identifier
     * @param idDomanda is the quiestion identifier
     * @return the answer value
     */
    public String getRisposta(String idQuestionario, String idDomanda){
        return null;
    }
    
    
    /**
     * Gets the author answer about a question
     * @param idQuestionario is the questionnaire identifier
     * @param idDomanda is the quiestion identifier
     * @return the answer value
     */
    public Genitore getAutoreRisposta(RispostaQuestionario risposta){
        return null;
    }
    
    
    
}
