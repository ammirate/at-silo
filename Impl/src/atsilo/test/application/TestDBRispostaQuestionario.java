/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: TestDBRispostaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Lindig, 12/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;

import java.sql.SQLException;

import atsilo.application.ControlQuestionario;
import atsilo.entity.StatisticheQuestionario;
import atsilo.exception.QuestionarioException;
import atsilo.storage.DBRispostaQuestionario;
import atsilo.storage.Database;

/**
 * Classe TestDBRispostaQuestionario
 * <Descrizione classe>
 * 
 * @author Lindig
 * 
 */
public class TestDBRispostaQuestionario {
    
    /**
     * @param args
     * @throws SQLException 
     * @throws QuestionarioException 
     */
    public static void main(String[] args) throws SQLException, QuestionarioException {
        // TODO Scheletro generato automaticamente
        Database db =new Database();
        db.apriConnessione();
       /* DBRispostaQuestionario dbrq=new DBRispostaQuestionario(db);
       int i= dbrq.getNumberOfCompiler(1, "a");
        System.out.println("numero risposte con quel valore:"+i);
       */
        
        
        ControlQuestionario cq =ControlQuestionario.getIstance();
        StatisticheQuestionario statistiche =cq.getStatistische(1);
        System.out.println("numero compilazioni:"+statistiche.getNumeroComp());
        System.out.println("numero compilazioni campo 1: "+statistiche.getPercentualiFromCampo(1, 1));
        System.out.println("numero compilazioni campo 2: "+statistiche.getPercentualiFromCampo(1, 2));
        System.out.println("numero compilazioni campo 3: "+statistiche.getPercentualiFromCampo(1, 3));
        db.chiudiConnessione();
    }
   
}
