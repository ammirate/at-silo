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

import java.util.ArrayList;

import atsilo.entity.Utente;

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
/**
 * 
 * Classe Messaggio
 * <Descrizione classe>
 * interfaccia delle notifiche email
 * @author Frank
 *
 */
public interface Messaggio {
    /**
     * medoto che restituisce il testo del messaggio
     * @return
     */
    String getTestoMail();
    /**
     * metodo che restituisce l'oggetto del messaggio 
     * @return
     */
    String getOggettoMail();
    /**
     * metodo che restituisce i destinatari
     * @return
     */
    ArrayList<Utente> getDestinatariMail();
}
