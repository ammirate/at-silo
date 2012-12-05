package atsilo.application;

import atsilo.entity.*;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlRispostaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

/**
 * Class that controls and manages the questionnaire answers
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
