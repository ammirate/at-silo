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

package atsilo.test.storage;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.logging.Logger;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import atsilo.entity.Account;
import atsilo.storage.DBAccount;
import atsilo.storage.Database;

/**
 * Classe TestDBAccount
 * testa i metodi della classe DBAccount
 * 
 * @author Luigi
 * 
 */
public class TestDBAccount {
    private static final Logger LOG=Logger.getLogger(TestDBAccount.class.getName());
    private Database db;
    
    
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
     * Testa il metodo ricercaPerUsername della classe Account ricercando per un username corretto. 
     * @param utenteDaTestare contiene il nome di un utente presente nel database
     * @throws SQLException 
     */
    @Test
    public void testRicercaPerUsernameUserCorretto() throws SQLException {
         Account u=new Account();
         String utenteDaTestare ="d.tranfa";
         DBAccount dba = new DBAccount(db);
         u=dba.ricercaPerUsername(utenteDaTestare);
         
         assertNotNull(u);
         assertEquals(u.getUserName(),utenteDaTestare);
    }
    
    /** 
     * Testa il metodo ricercaPerUsername della classe Account ricercando per un username sbagliato(non presente nel database). 
     * @param utenteDaTestare contiene il nome di un utente non presente nel database
     * @throws SQLException 
     */
    @Test
    public void testRicercaPerUsernameUserSbagliato() throws SQLException {
         Account u=new Account();
         String utenteDaTestare ="d.tanfa";
         DBAccount dba = new DBAccount(db);
         u=dba.ricercaPerUsername(utenteDaTestare);
         
         assertEquals(u.getUserName(),null);
         
    }
    
    
    /** 
     * Testa il metodo ricercaPerUsername della classe Account ricercando per un username = "null"(non presente nel database). 
     * @param utenteDaTestare contiene il nome di un utente null nel database
     * @throws SQLException 
     */
    @Test
    public void testRicercaPerUsernameUserNull() throws SQLException {
         Account u=new Account();
         String utenteDaTestare =null;
         DBAccount dba = new DBAccount(db);
         u=dba.ricercaPerUsername(utenteDaTestare);
         
         assertEquals(u.getUserName(),null);
         
    }
    


 
  
}
