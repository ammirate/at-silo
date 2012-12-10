/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: TestDBAssenza.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Luigi, 05/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.storage;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import atsilo.entity.Assenza;
import atsilo.storage.DBAssenza;
import atsilo.storage.Database;

/**
 * Classe TestDBAssenza
 * <Descrizione classe>
 * 
 * @author Luigi
 * 
 */
public class TestDBAssenza {
    
    Database db;
    /**
     * 
     * @throws Exception
     */
    @Before
    public void setUp() throws Exception {
        db = new Database();
        if (!db.apriConnessione()) {
            throw new RuntimeException("Connessione fallita");
        }
        DBUtil.execScript(db, "atsilopopolato.sql");
    }
    
    /**
     * @throws java.lang.Exception
     */
    @After
    public void tearDown() throws Exception {
        db.chiudiConnessione();
    }

    
    /**
     * Testa il metodo di ricerca per data, inserendo una data presente nel database.
     * @throws SQLException
     */
    
    @Test
    public void testRicercaAssenzaPerDataCorretta() throws SQLException
    {
        List<Assenza> u= new ArrayList<Assenza>();
        DBAssenza dba = new DBAssenza(db);
        Calendar data1=Calendar.getInstance();
        data1.set(2012,11,6);
        
        u=dba.ricercaAssenzaPerData(new java.sql.Date(data1.getTimeInMillis()));
        
        assertNotNull(u);
        for(Assenza a: u)
           assertEquals(a.getData(),u);
    }
    
    /**
     * testa il metodo di ricerca per data, con data non presente nel database
     * @throws SQLException
     */
    @Test
    public void testRicercaAssenzaPerDatabagliata() throws SQLException
    {
        List<Assenza> u= new ArrayList<Assenza>();
        DBAssenza dba = new DBAssenza(db);
        Calendar data1=Calendar.getInstance();
        data1.set(2012,11,8);
        
        u=dba.ricercaAssenzaPerData(new java.sql.Date(data1.getTimeInMillis()));
        
        
        for(Assenza a: u)
           assertEquals(a.getData(),null);
    }
    
    /**
     * testa il metodo di ricerca per data, con data nulla
     * @throws SQLException
     */
    
    
    
    @Test
    public void testRicercaAssenzaPerDataNulla() throws SQLException
    {
        List<Assenza> u= new ArrayList<Assenza>();
        DBAssenza dba = new DBAssenza(db);
        Date d=null;
        
        u=dba.ricercaAssenzaPerData(d);
        
        
        for(Assenza a: u)
           assertEquals(a.getData(),null);
    }
    
    /**
     * testa il metodo che ricerca l'assenza per il codice fiscale di un bambino(codice fiscale presente)
     * @throws SQLException
     */
    @Test
    public void testRicercaAssenzaPerCodiceFiscaleCorretto() throws SQLException
    {
        List<Assenza> l=new ArrayList<Assenza>();
        DBAssenza dba= new DBAssenza(db);
        String cf="DFZGNN12L14A909D";
        
        l=dba.ricercaAssenzaPerBambino(cf);
  
        for (Assenza a: l )
            assertEquals(a.getBambino().getCodiceFiscale(),cf);
        
    }
    
    
    
    /**
     * testa il metodo che ricerca l'assenza per il codice fiscale di un bambino(codice fiscale non presente)
     * @throws SQLException
     */
    @Test
    public void testRicercaAssenzaPerCodiceFiscaleSbagliato() throws SQLException
    {
        List<Assenza> l=new ArrayList<Assenza>();
        DBAssenza dba= new DBAssenza(db);
        String cf="DFZGNN12L14A909";
        
        l=dba.ricercaAssenzaPerBambino(cf);
        
        for (Assenza a: l )
          assertEquals(a.getBambino().getCodiceFiscale(),null);
        
    }
}
