/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: TestDBAttivita.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Luigi, 06/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.storage;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import atsilo.entity.Attivita;
import atsilo.storage.DBAttivita;
import atsilo.storage.Database;

/**
 * Classe TestDBAttivita
 * <Descrizione classe>
 * 
 * @author Luigi
 * 
 */
public class TestDBAttivita {
    
    Database db;
    
    
    /**
     * @throws java.lang.Exception
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
     * testa il metodo della classe DBAttivita che cerca un attivita per il titolo. Testa per titolo presente nel database
     * @throws SQLException
     */
    @Test
    public void testRicercaAttivitaPerTitoloCorretto() throws SQLException {
        
        DBAttivita at=new DBAttivita(db);
        Attivita a=new Attivita();
       
        a=at.ricercaAttivitaPerTitolo("Attivita X1");
        
        assertEquals(a.getTitolo(),"Attivita X1");
    }
    
    
    /**
     * testa il metodo della classe DBAttivita che cerca un attivita per il titolo. Testa per titolo non presente nel database
     * @throws SQLException
     */
    @Test
    public void testRicercaAttivitaPerTitoloSbagliato() throws SQLException
    {
        
        DBAttivita at=new DBAttivita(db);
        Attivita a=new Attivita();
        
        a=at.ricercaAttivitaPerTitolo("Attivita X3");
        
        assertEquals(a.getTitolo(),null);
    }
    
    
    /**
     * testa il metodo della classe DBAttivita che cerca un attivita per categoria. Testa per categoria  presente nel database
     * @throws SQLException
     */
    @Test
    public void testRicercaAttivitaPerCategoriaCorretta() throws SQLException
    {
        
        DBAttivita at=new DBAttivita(db);
        List<Attivita> l=new ArrayList<Attivita>();
        
        l=at.ricercaAttivitaPerCategoria("X");
        
        for(Attivita a: l)
        {
            System.out.println(a.getCategoria());
            assertEquals(a.getCategoria(),"X");
        }
     }
    /**
     * testa il metodo della classe DBAttivita che cerca un attivita per categoria. Testa per categoria non presente nel database
     * @throws SQLException
     */
    @Test
    public void testRicercaAttivitaPerCategoriaSbagliata() throws SQLException
    {
        
        DBAttivita at=new DBAttivita(db);
        List<Attivita> l=new ArrayList<Attivita>();
        
        l=at.ricercaAttivitaPerCategoria("sbaglio");
        
        for(Attivita a: l)
        {
            System.out.println(a.getCategoria());
            assertEquals(a.getCategoria(),null);
        }
     }
}
    
    
    
    
    
    
    

