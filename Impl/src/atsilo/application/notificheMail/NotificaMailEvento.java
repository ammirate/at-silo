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

import atsilo.entity.Classe;
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
 * @author Frank
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
     *  
     * @param destinatari
     * a cui arriva l'email
     * @param oggetto
     * dell'email
     * @param testo
     * dell'email
     * @param evento
     * di cui si notifica la creazione
     */
    
    
    public NotificaMailEvento(ArrayList<Utente> destinatari,String oggetto,String testo,Evento evento) 
    {
        super(destinatari, oggetto, testo);
        this.evento=evento;
    }
    /**
     *
     * ritorna il testo dell'email
     */
    public String getTestoMail() 
    {
        String classi="le seguenti classi: ";
        for (Classe classe : evento.getClassi()) 
        {
            classi=classi+classe.getId()+"sez. "+classe.getSezione()+",";
        }
        String testo="L'evento si chiamera "+evento.getNome()+"e si terra il giorno"+evento.getData()+"e vi parteciperanno "+classi+ this.getTesto();
        return testo;
    }

    /**
     * ritorna l'oggetto dell'email
     */
    public String getOggettoMail() {
        
        String oggetto="Notifica Evento di "+this.getOggetto();
        return oggetto;
    }

    /**
     * ritorna i destinatari del messaggio 
     */
    public ArrayList<Utente> getDestinatariMail() 
    {
        return this.getDestinatari();
    }
    

}
