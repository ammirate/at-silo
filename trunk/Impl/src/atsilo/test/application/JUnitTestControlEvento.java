/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: JUnitTestControlEvento.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio, 18/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;

import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import atsilo.application.ControlEvento;
import atsilo.entity.Evento;

/**
 * Classe JUnitTestControlEvento
 * <JUnit test dei metodi cella classe ControlEvento>
 * 
 * @author Antonio Cesarano, 18/12/2012
 * 
 */
public class JUnitTestControlEvento {
    
    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        
    }
    
    
    /**
     * @throws java.lang.Exception
     */
    @After
    public void tearDown() throws Exception {
    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#inserisciEvento(java.lang.String, java.lang.String, java.util.List, java.sql.Date, java.lang.String, java.sql.Date, java.util.List, atsilo.entity.EventPlanner, java.lang.String)}.
     */
    @Test
    public void testInserisciEvento() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#modificaEvento(atsilo.entity.Evento, java.lang.String, java.lang.String, java.util.List, java.sql.Date, java.lang.String, java.sql.Date, java.util.List, atsilo.entity.EventPlanner, java.lang.String)}.
     */
    @Test
    public void testModificaEvento() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#eliminaEvento(atsilo.entity.Evento)}.
     */
    @Test
    public void testEliminaEvento() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#getEventiPerOrganizzatore(atsilo.entity.EventPlanner)}.
     */
    @Test
    public void testGetEventiPerOrganizzatore() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#getEventiInData(java.sql.Date)}.
     */
    @Test
    public void testGetEventiInData() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#getEventiPerNome(java.lang.String)}.
     */
    @Test
    public void testGetEventiPerNome() {
        fail("Not yet implemented");
    }
    
    Evento evento;
    ControlEvento control = ControlEvento.getIstance();
}
