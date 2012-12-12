/*
 *-----------------------------------------------------------------
ù * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlLoginTest.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * fabio, 08/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;

import java.sql.SQLException;

import javax.security.auth.login.LoginException;

import org.junit.Test;

import atsilo.application.ControlLogin;
import atsilo.entity.Account;
import atsilo.entity.PersonaleAsilo;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBPersonaleAsilo;
import atsilo.storage.DBPsicopedagogo;
import atsilo.storage.Database;

/**
 * Classe ControlLoginTest <Descrizione classe>
 * 
 * @author fabio
 * @author Marko
 * @author Frank
 * 
 */
public class ControlLoginTest {
    
    /**
     * @param args
     * @throws DBConnectionException
     * @throws LoginException
     */
    
    
    @Test
    public final void testGetValoreLogin()
    {        
        
        ControlLogin control = ControlLogin.getInstance();
        
        Database db = new Database();
        if (!db.apriConnessione()) {
            
            try {
                throw new LoginException("Connessione fallita");
            } catch (LoginException e) {
                System.out.println(" connessione fallita");
            }
        }
        try {
            DBPersonaleAsilo asilo=new DBPersonaleAsilo(db);
                try {
                    Account account1 = control.getValoreLogin("", "", "");
                    Account account2 = control.getValoreLogin("", "", "");
                    Account account3 = control.getValoreLogin("", "", "");
                    Account account4= control.getValoreLogin("", "", "");
                    Account account5 = control.getValoreLogin("", "", "");
                } catch (LoginException e) {
                    System.out.println("username password o tipologia errati");
                }
            
            
            
        } finally {
            db.chiudiConnessione();
        }
    }
}
