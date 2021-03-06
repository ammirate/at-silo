/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBConnectionException.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Gianfranco Bottiglieri, 30/nov/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.exception;


public class LoginException extends Exception{

    public LoginException(String s){
        super(s);
    }

    /**
     * @param message
     * @param cause
     */
    public LoginException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * @param cause
     */
    public LoginException(Throwable cause) {
        super(cause);
    }
    
    
}
