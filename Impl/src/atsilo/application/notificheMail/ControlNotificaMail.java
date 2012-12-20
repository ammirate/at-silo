/**
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: CreazioneMail.java
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
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import atsilo.entity.Utente;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: CreazioneMail.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Gianfranco Bottiglieri, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */
/**
 * 
 * Classe ControlNotificaMail <Descrizione classe> classe che manda notifiche
 * prendendo in input un Messaggio
 * 
 * @author Frank
 * 
 */
public class ControlNotificaMail {
    
    private static ControlNotificaMail INSTANCE = new ControlNotificaMail();
    
    
    // costruttore
    /**
     * metodo che crea e invia un email a tutti i destinatardi di messaggio
     * 
     * @param Messaggio
     *            messaggio da inviare
     * @throws MessagingException
     * @throws Throwable
     */
    public void inviaMail(Messaggio messaggio) throws MessagingException,
            Throwable {
        
        ArrayList<Utente> destinatari = messaggio.getDestinatariMail();
        
        // Creazione di una mail session
        String mittente = "atsilonoreply@gmail.com";
        String intestazione = "Università degli studi di Salerno";
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.quitwait", "false");
        
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(
                                "atsilonoreply@gmail.com", "atsilonoreply1");
                    }
                });
        
        // Creazione del messaggio da inviare
        MimeMessage message = new MimeMessage(session);
        message.setSubject(messaggio.getOggettoMail());
        message.setText(messaggio.getTestoMail());
        
        // Aggiunta degli indirizzi del mittente e del destinatario
        InternetAddress fromAddress = new InternetAddress(mittente,
                intestazione);
        if(destinatari!=null && destinatari.size()>0)
        {
            for (Utente utente : destinatari) {
                InternetAddress toAddress = new InternetAddress(utente.getEmail());
                message.setFrom(fromAddress);
                message.setRecipient(Message.RecipientType.TO, toAddress);
                
                // Invio del messaggio
                Transport.send(message);
            }
        }
    }
    
    public static ControlNotificaMail getInstance() {
        return INSTANCE;
    }
}
