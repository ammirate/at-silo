/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: StubAccount.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Marko, 06/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.stub.storage;

import java.sql.SQLException;

import atsilo.entity.Account;
import atsilo.storage.Database;

public class StubAccount
{
    Account a;
    Database database;
    
    public StubAccount(Database db){
        database=db;
        a = new Account();
    }
        
    public boolean inserisci(Account a){
        return true;
    }
    
    public Account ricercaAccount(String codiceFiscale)throws SQLException{
        return a;
    }

    /**
     * @param username
     * @return
     */
    public Account ricercaPerUsername(String username) throws SQLException {
        // TODO Scheletro generato automaticamente
        return null;
    }


}



