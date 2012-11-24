/**
 * Progetto \@silo
 * Copyleft
 */
package application.notificheMail;

import javax.mail.MessagingException;

/**
 * Classe Messaggio
 * <Descrizione classe>
 * 
 * @author Gianfranco Bottiglieri
 * 
 */
public interface Messaggio {
    void invia() throws MessagingException, Throwable;
    
}
