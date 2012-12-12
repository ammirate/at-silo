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
    
    
    public static void main(String[] args) {
        // TODO Scheletro generato automaticamente
        
        
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
                
                PersonaleAsilo personale=asilo.getPersonaleAsiloPerCF("SNTNTN53N69B309D");
                
                String username = "a.senatore";
                String password = "antonellas";
                String tipo = personale.getCategoriaAppartenenza();
                System.out.println(tipo+" "+personale.getCodiceFiscale()+" "+personale.getNome());
                
                try {
                    Account account = control.getValoreLogin(username, password, "DIRETTORE");
                    System.out.println(account.getOwner().getCodiceFiscale());
                } catch (LoginException e) {
                    System.out.println("username password o tipologia errati");
                }
            } catch (SQLException e1) {
                System.out.println("codice fiscale non trovato ");
            }
            
            
        } finally {
            db.chiudiConnessione();
        }
    }
}
