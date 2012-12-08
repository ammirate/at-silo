/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Testnotifichemail.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Frank, 08/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.application.notificheMail;

import java.util.ArrayList;

import javax.mail.MessagingException;

import atsilo.entity.Utente;

/**
 * Classe Testnotifichemail <Descrizione classe>
 * 
 * @author Frank
 * 
 */
public class Testnotifichemail {
    public static void main(String[] args) throws MessagingException, Throwable {
        ControlNotificaMail posta = ControlNotificaMail.getInstance();
        ArrayList<Utente> destinatari = new ArrayList<Utente>();
        String testo = "";
        String oggetto = "";
        Utente licenziato = new Utente();
        
        Utente utente = new Utente();
        utente.setEmail("frankino173@gmail.com");
        licenziato.setEmail("gianfranco.b.d@gmail.com");
        licenziato.setNome("nome");
        licenziato.setCognome("cognome");
        destinatari.add(utente);
        destinatari.add(licenziato);
        NotificaMailLicenziamento messaggio = new NotificaMailLicenziamento(
                destinatari, testo, oggetto, licenziato);
        posta.inviaMail(messaggio);
        
        
    }
    
}
