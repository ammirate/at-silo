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
    public NotificaMailEvento(ArrayList<Utente> destinatari,Evento evento) 
    {
        super();
        this.destinatari = destinatari;
        this.evento=evento;
    }
    
    
    //Metodi
    /**
     * metodo che invia l'email usando il metodo statico di CreazioneMail e passandogli i campi destinatario email oggetto e testo
     */
    public void invia() throws Throwable
    {
        String emailDestinatario="";
        String oggetto="";
        String testo="";
        
        for (Utente utente: destinatari) 
        {
            emailDestinatario= utente.getEmail();
            oggetto="Notifica Evento";
            testo="Caro Signore/a "+utente.getNome() +" "+utente.getCognome()+
                  " n la informiamo che il giorno  " + evento.getData() +
                  "si terra l'evento dal nome "+evento.getNome()+
                  "al quale parteciperanno le seguenti classi "+ evento.getClassi()+
                  "organizato da " + evento.getOrganizzatore()+
                  "\n NON RISPONDA A QUESTA EMAIL";
            
            try 
            {
                    CreazioneMail.inviaMail(emailDestinatario,oggetto, testo);
                    System.out.println("Invio messaggio OK!");
            } 
                    catch (MessagingException e) 
                    {
                            e.printStackTrace();
                            System.out.println("Invio messaggio FALLITO!");
                    }

            
        }
        
    }
}
