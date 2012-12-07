/**
 * -----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 * -----------------------------------------------------------------
 * FILE: NotificaMailEvento.java
 * -----------------------------------------------------------------
 * PROGETTO: Atsilo
 * -----------------------------------------------------------------
 * OWNER
 * Bottiglieri Gianfranco, 25/11/2012
 * REVISION
 * nome revisore, data revisione
 * -----------------------------------------------------------------
 */
package atsilo.application.notificheMail;

import java.util.ArrayList;

import javax.mail.MessagingException;

import atsilo.entity.Evento;
import atsilo.entity.Utente;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: NotificaEvento.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Gianfranco Bottiglieri, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

/**
 * Classe NotificaMailEvento
 * <Descrizione classe>
 * classe che invia la notifica email della crazione di un evento.
 *
 */
public class NotificaMailEvento extends NotificaMail {
    //Logger
    //private static final java.util.Logger LOG = ...
    
    //Variabili di istanza
    private Evento evento;
    
    //Costruttori
    
    /** 
     * @param destinatari
     *  a cui arrivera l'email
     * @param evento 
     *  di cui si notifica la creazione
     */
    public NotificaMailEvento(ArrayList<Utente> destinatari,String oggetto,String testo,Evento evento) 
    {
        super(destinatari, oggetto, testo);
        this.evento=evento;
    }
    public String getTestoMail() 
    {
        String testo= this.getTesto()+"L'evento si chimera"+evento.getNome();
        return testo;
    }

    /**
     * @see atsilo.application.notificheMail.NotificaMail#getOggettoMail()
     */
    public String getOggettoMail() {
        
        String oggetto="Notifica di Creazione Evento"+this.getOggetto();
        return oggetto;
    }

    /**
     * @see atsilo.application.notificheMail.NotificaMail#getDestinatariMail()
     */
    public ArrayList<Utente> getDestinatariMail() 
    {
        return this.getDestinatariMail();
    }
    

}
