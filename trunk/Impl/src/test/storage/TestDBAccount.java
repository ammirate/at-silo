/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: TestDBAccount.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Luigi, 30/nov/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package test.storage;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import atsilo.entity.Account;
import atsilo.storage.DBAccount;
import atsilo.storage.Database;

/**
 * Classe TestDBAccount
 * <Descrizione classe>
 * 
 * @author Luigi
 * 
 */
public class TestDBAccount {
    
    private Database db;

    

    @Test
    public void test() throws SQLException {
        
        
        testRicercaPerUsernameUserCorretto();
    }
    //Logger
    /*
     * private static final java.util.Logger LOG
     *         = Logger.getLogger(TestDBAccount.class.getName());
     */
    
    //Variabili di istanza
    
    
    //Costruttori
    TestDBAccount test=new TestDBAccount();
    
    //Metodi
    
    
    @Before 
    public void connettiDB() throws SQLException {
        db=new Database();
        }
    
    @After
    public void disconnettiDB() throws SQLException{
        db.chiudiConnessione();
    }
    /** 
     * 
     * @param utenteDaTestare contiene il nome di un utente presente nel database
     * @throws SQLException 
     */
    @Test
    public void testRicercaPerUsernameUserCorretto() throws SQLException {
        
         String utenteDaTestare = "Nome di un utente nel database";
         DBAccount dba = new DBAccount(db);
         Account u=dba.ricercaPerUsername(utenteDaTestare);
         
         assertNotNull(u);
         assertEquals(u.getUserName(),utenteDaTestare);
    }



 
  
}
