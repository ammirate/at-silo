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
 * Elisa, 04/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package test.storage;


import atsilo.entity.Account;
import atsilo.entity.DomandaIscrizione;
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
    
    public Account ricercaAccount(String codiceFiscale){
        return a;
    }



}