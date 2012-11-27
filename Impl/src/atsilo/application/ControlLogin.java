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
import atsilo.entity.Utente;
import atsilo.storage.DBAccount;
import atsilo.storage.DBEducatoreDidattico;
import atsilo.storage.DBEventPlanner;
import atsilo.storage.DBGenitore;
import atsilo.storage.DBPersonaleAsilo;
import atsilo.storage.DBPsicopedagogo;
import atsilo.storage.DBResponsabileQuestionario;
import atsilo.storage.DBTirocinante;
import atsilo.storage.Database;

public class ControlLogin {
    private static final ControlLogin INSTANCE;
    private DBAccount dbAccount;
    private DBGenitore dbGenitore;
    private DBEducatoreDidattico dbEducatoreDidattico;
    private DBEventPlanner dbEventPlanner;
    private DBPersonaleAsilo dbPersonaleAsilo;
    private DBPsicopedagogo  dbPsicopedagogo;
    private DBResponsabileQuestionario  dbResponsabileQuestionario;
    private DBTirocinante dbTirocinante;
    
    ControlLogin() {
        //Come prima cosa, bisogna creare un'istanza di database e aprire una connessione
        Database db = new Database();
        if (!db.apriConnessione()) 
        {
            throws new DBConnectionException();
        }

        //Quindi, si possono creare tutti i gestori di tabelle necessari
        try {
            dbAccount = new DBAccount(db);
            dbGenitore = new DBGenitore(db);
            dbEducatoreDidattico = new DBEducatoreDidattico(db);
            dbEventPlanner = new DBEventPlanner(db);
            dbPersonaleAsilo = new DBPersonaleAsilo(db);
            dbPsicopedagogo = new DBPsicopedagogo(db);
            dbResponsabileQuestionario = new DBResponsabileQuestionario(db);
            dbTirocinante = new DBTirocinante(db);
            
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
              return false;
          else
          {
              if(account.getPassWord().compareTo(password)==0)
                  return true;
              else return false;
          }
        } catch (SQLException e) 
        {
            
        }
        
        return false;
    }

    public static ControlLogin getInstance() 
    {
        
        return null;
        
    }
}
