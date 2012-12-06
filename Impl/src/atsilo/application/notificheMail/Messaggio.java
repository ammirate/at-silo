/**
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Messaggio.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Bottiglieri Gianfranco, 25/11/2012 
 * REVISION
 * nome revisore, data revisione
 *-----------------------------------------------------------------
 **/
package atsilo.application.notificheMail;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Messaggio.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Gianfranco Bottiglieri, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public interface Messaggio {
    void invia()throws Throwable;
    
}
