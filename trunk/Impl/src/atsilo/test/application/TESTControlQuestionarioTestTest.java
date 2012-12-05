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

import static org.junit.Assert.*;

import java.io.FileNotFoundException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Before;
import org.junit.Test;

import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.Questionario;
import atsilo.exception.DBConnectionException;
import atsilo.exception.QuestionarioException;
import atsilo.storage.Database;

import sun.util.resources.CalendarData;
import test.storage.DBUtil;
import test.storage.StubQuestionario;

/**
 * Classe TESTControlQuestionarioTestTest
 * <Descrizione classe>
 * 
 * @author Antonio
 * 
 */
public class TESTControlQuestionarioTestTest {
    
    @Before
    public void setUp() throws FileNotFoundException, SQLException {
        Database db = new Database();
        db.apriConnessione();
        DBUtil.execScript(db, "D:\\Tony\\Unisa\\IS\\PROGETTO\\atsilo\\SDD\\Dati Persistenti\\atsilo popolato.sql");
        db.chiudiConnessione();
    }
    
    @Test
    public void testGetQuestionarioDaCompilare() throws DBConnectionException, QuestionarioException {
        ControlQuestionarioTest cq = ControlQuestionarioTest.getIstance();
        
       Date dataI = new Date(2012, 1, 1);
       Date dataF = new Date(2012,3,1);
        /*
         * ('Giovanna', 'Di Costanzo', 'DCSGVN74A23B224X', '0828123456',
         * 'gds@hotmail.it', '1974-12-30', 'Barano d''Ischia (NA)',
         * 'via Ferreria, 12 - Baronissi (SA)', 'INSEGNANTE', 'ISCRITTO')
         */
        List<Questionario> res = cq.getQuestionariDaCompilare("csrntn91l26c129j");
        
        //Oracolo: questionari da compilare (preso da atsilo popolato.sql)
        Set<Questionario> oracolo = new HashSet<Questionario>(Arrays.asList(
                new Questionario("QUESTIONARIO CONTROLLO QUALITA ASILO NIDO - GRADIMENTO DEI GENITORI",
                        null, "Controllo qualità", 1, dataI,  dataF),
                new Questionario("Questionario relativo a X",
                        null, "Questionario X", 2 ,dataI,dataF)
                ));
        Set<Questionario> risultato = new HashSet<Questionario>(res);
        
        assertEquals(oracolo, risultato);
    }

    
    //Variabili di istanza
    StubQuestionario stub = new StubQuestionario();
    ControlQuestionarioTest control = ControlQuestionarioTest.getIstance();
    Date dataInizio = new Date(2012, 1, 1);
    Date dataFine = new Date(2012,3,31);
    
    Questionario q1 = new Questionario("inizio anno", "no", "inizio", 1, dataInizio, dataFine);
    Questionario q2 = new Questionario("meta anno", "no", "meta", 2, dataInizio, dataFine);
    
    DomandaQuestionario d1 = new DomandaQuestionario("1",1,"quanti anni hai?",null);
    DomandaQuestionario d2 = new DomandaQuestionario("2",1,"dove abiti?",null);
    DomandaQuestionario d3 = new DomandaQuestionario("3",1,"quanti figli hai?",null);

    CampoDomandaQuestionario c1 = new CampoDomandaQuestionario("check", "dai 22 a 26", "22-26", "1");
    CampoDomandaQuestionario c2 = new CampoDomandaQuestionario("check", "dai 26 ai 30", "26-30", "1");
    CampoDomandaQuestionario c3 = new CampoDomandaQuestionario("check", "dai 31 ai 36", "31-36", "1");
    
    CampoDomandaQuestionario c4 = new CampoDomandaQuestionario("check", "uno", "1", "3");
    CampoDomandaQuestionario c5 = new CampoDomandaQuestionario("check", "due", "2", "3");
    CampoDomandaQuestionario c6 = new CampoDomandaQuestionario("check", "pi� di due", "2+", "3");
    
   
    
    
    
    //Costruttori
    
    public void inserimentoTest() throws DBConnectionException, QuestionarioException{
        d1.aggiungiCampo(c1);
        d1.aggiungiCampo(c2);
        d1.aggiungiCampo(c3);
        
        d3.aggiungiCampo(c4);
        d3.aggiungiCampo(c5);
        d3.aggiungiCampo(c6);
        
        control.inserisciDomanda(q1.getId(), d1);
        control.inserisciDomanda(q1.getId(), d2);
        control.inserisciDomanda(q1.getId(), d3);
 
    }
    
    public void getQuestionario(String id) throws DBConnectionException, QuestionarioException{
        control.eliminaDomanda(d3.getId());
        
    }
    
}
