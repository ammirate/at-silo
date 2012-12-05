package atsilo.application;

import atsilo.entity.*;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlDomandaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012
 *-----------------------------------------------------------------
 */

/**
 * Class that controls and mannages the questions of a questionnaire
 */
public class ControlDomandaQuestionario {
    
    public static final ControlDomandaQuestionario control;
    
    
    /**
     * Contrusctor
     */
    private ControlDomandaQuestionario() {}
    
    
    /**
     * Adds a new question in a questionnaire
     * @param idQuestionario is the identificative number of a questionnaire
     * @param domanda is the question to add
     * @return true if the question was added correctly, else false
     */
    public boolean inserisciDomanda(String idQuestionario, DomandaQuestionario domanda){
        return false;
    }


    /**
     * Changes a quiestion in a questionnaire
     * @param idQuestionario is the identificative number of a questionnaire
     * @param idDomanda is the identificative number of a question
     * @param newDomanda is the new question that substitutes the question with id idDomanda
     * @return true if the question was changed correctly, else false
     */
    public boolean modificaDomanda(String idQuestionario,String idDomanda, DomandaQuestionario newDomanda){
        return false;
   }
    
    
    /**
     * Deletes a question from a questionnaire (and all its fields)
     * @param idQuestionario is the identificative number of a questionnaire
     * @param idDomanda is the identificative number of a question
     * @return the quiestion deleted
     */
    public DomandaQuestionario eliminaDomanda(String idQuestionario, String idDomanda){
        return null;
    }


    /**
     * Adds to a question a List of fields
     * @param idQuestionario is the identificative number of a questionnaire
     * @param idDomanda is the identificative number of a question
     * @param campi is a list of fields for the question
     * @return true if the fields were added correctly, else false
     */
    public boolean inserisciCampi(String idQuestionario, String idDomanda, List<CampoDomandaQuestionario> campi){
        return false;
    }
    
    
    /**
     * Gets a list of fields about a quiestion
     * @param idQuestionario is the identificative number of a questionnaire
     * @param idDomanda is the identificative number of a question
     * @return a List of CampoDomandaQuestionario
     */
    public List<CampoDomandaQuestionario> getCampiDomanda(String idQuestionario,String idDomanda){
        return null;
    }
    
    /**
     * Gets the single istance of this class
     * @return a new ControlDomandaQuestionario
     */
    public ControlDomandaQuestionario getIstance(){
        return null;
    }
}
