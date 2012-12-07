/**
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: NotificaLicenzimaneto.java
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
 * FILE: NotificaLicenziamento.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Gianfranco Bottiglieri, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

/**
 * @author Frank
 * Classe MessaggioLicenziamento
 * <Descrizione classe>
 * classe che invia ad membro o membri del Personale dell'Asilo,un email che gli notifica l'avvenuto licenziamento.
 * 
 */
public class NotificaMailLicenziamento extends NotificaMail {
    //Variabili di istanza
    private Utente licenziato;

    //Costruttori
    
    /**
     * 
     * @param destinatari
     * @param oggetto
     * @param testo
     * @param licenziato
     */
    public NotificaMailLicenziamento(ArrayList<Utente> destinatari,String oggetto,String testo,Utente licenziato) 
    {
        super(destinatari, oggetto, testo);
        this.licenziato=licenziato;
    }
    //metodi 
    /**
     * @see atsilo.application.notificheMail.NotificaMail#getTestoMail()
     */

    public String getTestoMail() 
    {
        String testo= "Caro sign."+licenziato.getCognome()+this.getTesto();
        return testo;
    }

    /**
     * @see atsilo.application.notificheMail.NotificaMail#getOggettoMail()
     */
    public String getOggettoMail() {
        
        String oggetto="Notifica di composizione di classe"+this.getOggetto();
        return oggetto;
    }

    /**
     * @see atsilo.application.notificheMail.NotificaMail#getDestinatariMail()
     */
    public ArrayList<Utente> getDestinatariMail() 
    {
        return this.getDestinatari();
    }
    

}
