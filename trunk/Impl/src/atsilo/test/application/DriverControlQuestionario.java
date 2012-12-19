/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: MainPerCOntrolQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio, 04/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;
import java.sql.SQLException;
import java.util.List;

import atsilo.application.ControlQuestionario;
import atsilo.entity.Questionario;
import atsilo.exception.DBConnectionException;
import atsilo.exception.QuestionarioException;
import atsilo.test.storage.StubQuestionario;

/**
 * Classe MainPerCOntrolQuestionario
 * <Descrizione classe>
 * 
 * @author Antonio
 * 
 */


public class DriverControlQuestionario {

    public static void main(String[] args) throws SQLException, DBConnectionException, QuestionarioException{
        ControlQuestionario cq = ControlQuestionario.getIstance();
        
        
        cq.caricaQuestionarioDaCompilare(11, "DFZNDR91L14A909D");
        
    }
    
    

    
    
    
    
}
