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

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import atsilo.application.ControlEvento;
import atsilo.entity.Classe;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.EventPlanner;
import atsilo.entity.Evento;
import atsilo.exception.EventoException;
import atsilo.storage.Database;

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
        Calendar data = Calendar.getInstance();
        data.set(2012, 11, 1);
        Date dataEvento= new Date(data.getTimeInMillis());
        
        EventPlanner planner = new EducatoreDidattico();
        
        evento = new Evento("riunione dei rappresentanti di classe", "riunione",
                "antoio@gmail.com, ", dataEvento, "riunione", planner, "/home/user/Scrivania/Riunione.pdf");
        /*
        Classe c1 = new Classe(2,"2A",null);
        Classe c2 = new Classe(3,"2B",null);
        List<Classe> classi = new ArrayList<Classe>();
        classi.add(c1);
        classi.add(c2);
        
        evento.setClassi(classi);
        */
        
    }
    
    
    /**
     * @throws java.lang.Exception
     */
    @After
    public void tearDown() throws Exception {
        control.eliminaEvento(evento);
        //evento = null;
    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#inserisciEvento(java.lang.String, java.lang.String, java.util.List, java.sql.Date, java.lang.String, java.sql.Date, java.util.List, atsilo.entity.EventPlanner, java.lang.String)}.
     * @throws EventoException 
     */
    @Test
    public void testInserisciEvento() throws EventoException {
        control.inserisciEvento(evento); 
        int id = evento.getId();
        assertTrue(id!=0);

    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#modificaEvento(atsilo.entity.Evento, java.lang.String, java.lang.String, java.util.List, java.sql.Date, java.lang.String, java.sql.Date, java.util.List, atsilo.entity.EventPlanner, java.lang.String)}.
     */
   // @Test
    public void testModificaEvento() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#eliminaEvento(atsilo.entity.Evento)}.
     */
    //@Test
    public void testEliminaEvento() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#getEventiPerOrganizzatore(atsilo.entity.EventPlanner)}.
     */
    //@Test
    public void testGetEventiPerOrganizzatore() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#getEventiInData(java.sql.Date)}.
     */
    //@Test
    public void testGetEventiInData() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlEvento#getEventiPerNome(java.lang.String)}.
     */
    //@Test
    public void testGetEventiPerNome() {
        fail("Not yet implemented");
    }
    
    
    
    
    Evento evento;
    ControlEvento control = ControlEvento.getIstance();
    Database db = new Database();
}
