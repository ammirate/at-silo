/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: JUnitTestQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio, 15/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;

import static org.junit.Assert.assertEquals;

import java.sql.Date;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;

/**
 * Classe JUnitTestQuestionario
 * 
 * Test di unità dell'entity Questionario
 * 
 * @author Antonio
 * 
 */
public class JUnitTestQuestionario {
    
    Questionario questionario;

    @Before
    public void setUp() throws Exception {
        Date dataI = new Date(2012,1,1);
        Date dataF = new Date(2012,3,31);
        
        questionario = new Questionario("Controllo qualita", null, "Qualita", 1, dataI, dataF);
        
    }
    
    
    @After
    public void tearDown() throws Exception {
        questionario = null;
    }
    
    
    /**
     * Test method for {@link atsilo.entity.Questionario#Questionario(String, String, String, Date, Date)}.
     */
    @Test
    public void testQuestionario() {
           assertEquals(0 , questionario.getListaGenitori().size());
           assertEquals(0 , questionario.getDomande().size());
    }
    
    
    /**
     * Test method for {@link atsilo.entity.Questionario#addGenitore(atsilo.entity.Genitore)}.
     */
    @Test
    public void testAddGenitore() {
           Genitore genitore = new Genitore();
           questionario.addGenitore(genitore);
           assertEquals(1 , questionario.getListaGenitori().size());
    }
    
    /**
     * Test method for {@link atsilo.entity.Questionario#aggiungiDomanda(atsilo.entity.DomandaQuestionario)}.
     */
    @Test
    public void testAggiungiDomanda() {
        DomandaQuestionario domanda1 = new DomandaQuestionario();
        DomandaQuestionario domanda2 = new DomandaQuestionario();
        
        questionario.aggiungiDomanda(domanda1);
        questionario.aggiungiDomanda(domanda2);
        
        assertEquals(2, questionario.getDomande().size());
    }
    
    /**
     * Test method for {@link atsilo.entity.Questionario#precaricaRispostaAllaDomanda(atsilo.entity.DomandaQuestionario, atsilo.entity.RispostaQuestionario)}.
     */
   @Test
    public void testPrecaricaRispostaAllaDomanda() {
        
        DomandaQuestionario domanda1 = new DomandaQuestionario();
        domanda1.setId(5);
        RispostaQuestionario risposta1 = new RispostaQuestionario();
        risposta1.setId(1);
        
        questionario.precaricaRispostaAllaDomanda(domanda1, risposta1);
        
        List<RispostaQuestionario> risposte = questionario.getRispostePrecaricate();
        assertEquals(1, risposte.size());
        assertEquals(5, risposte.get(0).getIdDomanda());        
    }
    
}
