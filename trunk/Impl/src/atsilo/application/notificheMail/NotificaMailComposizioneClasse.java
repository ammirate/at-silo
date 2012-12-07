/**
 * -----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 * -----------------------------------------------------------------
 * FILE: NotificaMailComposizioneClasse.java
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

import atsilo.entity.Utente;


/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: NotificaComposizioneClasse.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Gianfranco Bottiglieri, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

/**
 * Classe NotificaMailComposizioneClasse <Descrizione classe> classe che invia
 * la notifica email della composizione della classe di un evento.
 * 
 */
public class NotificaMailComposizioneClasse extends NotificaMail {
    //variabili di istanza
    String linkpagina;
    
    /**costruttore
     * @param destinatari
     */
    public NotificaMailComposizioneClasse(ArrayList<Utente> destinatari,
            String oggetto, String testo,String linkpagina) {
        super(destinatari, oggetto, testo);
        this.linkpagina=linkpagina;
    }

    public String getTestoMail() 
    {
        String testo= this.getTesto()+""+linkpagina;
        return testo;
    }

    /**
     * @see atsilo.application.notificheMail.NotificaMail#getOggettoMail()
     */
    @Override
    public String getOggettoMail() {
        
        String oggetto="Notifica di composizione di classe"+this.getOggetto();
        return oggetto;
    }

    /**
     * @see atsilo.application.notificheMail.NotificaMail#getDestinatariMail()
     */
    @Override
    public ArrayList<Utente> getDestinatariMail() 
    {
        return this.getDestinatariMail();
    }
    
}
