/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: TestControlQuestionarioConStorage.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio, 07/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import test.storage.DBUtil;
import atsilo.application.ControlQuestionario;
import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Questionario;
import atsilo.exception.DBConnectionException;
import atsilo.exception.QuestionarioException;
import atsilo.storage.Database;

/**
 * Classe TestControlQuestionarioConStorage
 * <Descrizione classe>
 * 
 * @author Antonio
 * 
 */
public class TestControlQuestionarioConStorage {
    
    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        db = new Database();
        if(!db.apriConnessione())
            System.out.println("connessione al db fallita");

    }
    
    //Logger
    /*
     * private static final java.util.Logger LOG
     *         = Logger.getLogger(TestControlQuestionarioConStorage.class.getName());
     */
    
    /**
     * @throws java.lang.Exception
     */
    @After
    public void tearDown() throws Exception {
        db.chiudiConnessione();
    }
    
    @Test
    public void test() throws DBConnectionException, QuestionarioException {
       // fail("Not yet implemented");
        inserimentoTest();
    }
    
    //Variabili di istanza
    Database db;
    Date dataInizio = new Date(2012, 1, 1);
    Date dataFine = new Date(2012,3,31);
    
    Questionario q1 = new Questionario("inizio anno", "no", "inizio", 21, dataInizio, dataFine);
    Questionario q2 = new Questionario("meta anno", "no", "meta", 22, dataInizio, dataFine);
    
    DomandaQuestionario d1 = new DomandaQuestionario(10,21,"quanti anni hai?",null);
    CampoDomandaQuestionario c1 = new CampoDomandaQuestionario("check", "dai 22 a 26", "22-26", 10);
    CampoDomandaQuestionario c2 = new CampoDomandaQuestionario("check", "dai 26 ai 30", "26-30", 10);
    CampoDomandaQuestionario c3 = new CampoDomandaQuestionario("check", "dai 31 ai 36", "31-36", 10);  
    
    DomandaQuestionario d2 = new DomandaQuestionario(11,21,"dove abiti?",null);
    CampoDomandaQuestionario c4 = new CampoDomandaQuestionario("check", "italia", "italia",11);
    CampoDomandaQuestionario c5 = new CampoDomandaQuestionario("check", "europa", "europa",11);
    CampoDomandaQuestionario c6 = new CampoDomandaQuestionario("check", "altro", "altro", 11);
  
    DomandaQuestionario d3 = new DomandaQuestionario(12,21,"quanti figli hai?",null);
    CampoDomandaQuestionario c7 = new CampoDomandaQuestionario("check", "uno", "1",12);
    CampoDomandaQuestionario c8 = new CampoDomandaQuestionario("check", "due", "2",12);
    CampoDomandaQuestionario c9 = new CampoDomandaQuestionario("check", "piu di due", "2+", 12);
    
   
    
    //Metodi
    public void inserimentoTest() throws DBConnectionException, QuestionarioException{
        d1.aggiungiCampo(c1);
        d1.aggiungiCampo(c2);
        d1.aggiungiCampo(c3);
        
        d2.aggiungiCampo(c4);
        d2.aggiungiCampo(c5);
        d2.aggiungiCampo(c6);
        
        d3.aggiungiCampo(c7);
        d3.aggiungiCampo(c8);
        d3.aggiungiCampo(c9);
        
        List<DomandaQuestionario> domande = new ArrayList<DomandaQuestionario>();
        domande.add(d1);
        domande.add(d2);
        domande.add(d3);
        
        q1.setDomande(domande);
        
        ControlQuestionario control = ControlQuestionario.getIstance();
        control.inserisciQuestionario(q1);
    }
    
    
    
    
}
