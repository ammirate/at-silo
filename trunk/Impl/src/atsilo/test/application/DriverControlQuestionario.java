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

import test.storage.StubQuestionario;
import atsilo.entity.Questionario;
import atsilo.exception.DBConnectionException;
import atsilo.exception.QuestionarioException;

/**
 * Classe MainPerCOntrolQuestionario
 * <Descrizione classe>
 * 
 * @author Antonio
 * 
 */


public class DriverControlQuestionario {

    public static void main(String[] args) throws SQLException, DBConnectionException, QuestionarioException{
        ControlQuestionarioTest cq = ControlQuestionarioTest.getIstance();
        StubQuestionario stub = new StubQuestionario();
        
        //Test getQuestionario()
        Questionario prova1 = null;
        try {
            prova1 = stub.getQuestionario(1);
            System.out.println("Questionario caricato: " + prova1);

        } catch (SQLException e) { System.out.println("nada...");
        }
        
        
        
        //Test ricercaPerNOme()
        List<Questionario> prova2 = null;
        prova2 = stub.ricercaQuestionariPerNome("inizio");
        stampaList("\nProva #2: ",prova2);
        
        
        //Test3
        List<Questionario> prova3 = cq.getQuestionariDaCompilare("csrntn91l26c129j");
        stampaList("\nProva #3: ",prova3);
        
        //Test 4
        Questionario q = cq.caricaQuestionarioDaCompilare(1, "csrntn91l26c129j");
        System.out.println("\nProva #4: "+q);
        
        //Test 5
        cq.compilaQuestionario(1, null, "csrntn91l26c129j");
        
        
    }
    
    
    
    
    
    
    public static void stampaList(String s, List<Questionario> lista){
        System.out.println(s);
        for(int i=0; i<lista.size(); i++)
            System.out.println(lista.get(i));
    }
    
    
    
    
    
}
