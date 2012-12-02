/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: TESTControlQuestionarioTestTest.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio, 02/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;

import static org.junit.Assert.fail;

import org.junit.Test;

import atsilo.entity.DomandaQuestionario;

import test.storage.StubQuestionario;

/**
 * Classe TESTControlQuestionarioTestTest
 * <Descrizione classe>
 * 
 * @author Antonio
 * 
 */
public class TESTControlQuestionarioTestTest {
    
    @Test
    public void test() {
        fail("Not yet implemented");
    }
    //Logger
    /*
     * private static final java.util.Logger LOG
     *         = Logger.getLogger(TESTControlQuestionarioTestTest.class.getName());
     */
    
    //Variabili di istanza
    StubQuestionario stub = new StubQuestionario();
    ControlQuestionarioTest c = ControlQuestionarioTest.getIstance();
    
    
    //Costruttori
    
    public void inserimentoTest(){
    }
    //Metodi
}
