/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
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

import javax.security.auth.login.LoginException;

import atsilo.application.ControlLogin;
import atsilo.entity.Account;
import atsilo.exception.DBConnectionException;
import atsilo.storage.Database;

/**
 * Classe ControlLoginTest
 * <Descrizione classe>
 * 
 * @author fabio
 * 
 */
public class ControlLoginTest {
    
    /**
     * @param args
     * @throws DBConnectionException 
     * @throws LoginException 
     */
    public static void main(String[] args) throws LoginException, DBConnectionException {
        // TODO Scheletro generato automaticamente
     
        
        ControlLogin control=ControlLogin.getInstance();
        Account a=new Account();
        a=control.getValoreLogin("a.damelia", "alfonsoda","tirocinante");
        System.out.println("Username : = "+a.getUserName());
        System.out.println("Password : = "+a.getPassWord());
        System.out.println("Tipo utenza:"+a.getOwner().getClass().getName());
        System.out.println("Codice Fiscale Utente:"+a.getOwner().getCodiceFiscale());
        
    }
    //Logger
    /*
     * private static final java.util.Logger LOG
     *         = Logger.getLogger(ControlLoginTest.class.getName());
     */
    
    //Variabili di istanza
    
    
    //Costruttori
    
    
    //Metodi
}
