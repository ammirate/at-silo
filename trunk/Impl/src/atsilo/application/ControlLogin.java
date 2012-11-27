/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlLogin.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Marco Parisi, data 27/11/2012
 * REVISION
 * nome revisore, data revisione
 *-----------------------------------------------------------------
 */

package atsilo.application;

import java.sql.SQLException;

import atsilo.entity.Account;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBAccount;
import atsilo.storage.Database;

public class ControlLogin {
    private static ControlLogin control;
    private DBAccount dbAccount;
    
    private ControlLogin() {
        control = new ControlLogin();
        //Come prima cosa, bisogna creare un'istanza di database e aprire una connessione
        Database db = new Database();
        if (!db.apriConnessione()) 
        {
            throw new DBConnectionException("Connessione fallita");
        }

        //Quindi, si possono creare tutti i gestori di tabelle necessari
        try {
            dbAccount = new DBAccount(db);
            
        } finally {
            /*
             * Alla fine dell'interazione, prima di uscire dal metodo,
             * bisogna chiudere la connessione.
             */
            db.chiudiConnessione();
        }
    }

    Boolean getValoreLogin(String username, String password) 
    {
        Account account=new Account();
        try {
            account=dbAccount.ricercaPerUsername(username);
          if( account== null)
          {
              throw new DBConnectionException("account non trovato");
          }
          else
          {
              if(account.getPassWord().compareTo(password)==0)
                  return true;
              else
              {
                  throw new DBConnectionException("Password Errata");
              }
          }
        } catch (SQLException e) 
        {
            throw new DBConnectionException("Connessione fallita");
        }
    }

    public static ControlLogin getInstance() 
    {
        return control;
    }
}
