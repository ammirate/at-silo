/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ForumRegistrationTester.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Alfonso, 19/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.storage;

import java.util.Calendar;
import java.util.TimeZone;

import atsilo.entity.phpbb_user;
import atsilo.storage.DBphpbb_users;
import atsilo.storage.Database;

/**
 * Classe ForumRegistrationTester
 * <Descrizione classe>
 * 
 * @author Alfonso
 * 
 */
public class ForumRegistrationTester {
    
    /**
     * 
     */
    public ForumRegistrationTester() {
        // TODO Scheletro di costruttore autogenerato
    }
    
    //Logger
    /*
     * private static final java.util.Logger LOG
     *         = Logger.getLogger(ForumRegistrationTester.class.getName());
     */
    
    /**
     * @param args
     */
    public static void main(String[] args) {
        
        Database db = new Database();
        DBphpbb_users dbphp = new DBphpbb_users(db);
        db.apriConnessione();
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
        calendar.clear();
        calendar.setTimeInMillis(System.currentTimeMillis());
        long secondsSinceEpoch = calendar.getTimeInMillis() / 1000L;
        phpbb_user utente = new phpbb_user("ferdinando", "gnignigni", "gnignigni@asd.it", secondsSinceEpoch);
        dbphp.inserisci(utente);
        // TODO Scheletro generato automaticamente
        
    }
    
    //Variabili di istanza
    
    
    //Costruttori
    
    
    //Metodi
}
