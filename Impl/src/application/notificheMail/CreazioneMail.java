/**
 * Progetto \@silo
 * Copyleft
 * Classe CreazioneMail
 * 
 * <Descrizione classe>
 *  crea un email con un oggetto destinatariio e testo generico
 * 
 * @author Gianfranco Bottiglieri
 * 
 */

package application.notificheMail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class CreazioneMail {
    
    //Metodi
    /**
     * metodo che crea e invia un email 
     * @param dest
     * destinatario email
     * @param oggetto
     * oggetto dell'email 
     * @param testoEmail
     * testo dell'email
     * @throws MessagingException
     * @throws Throwable
     */
    public static void inviaMail(String dest, String oggetto,String testoEmail) throws MessagingException, Throwable {
        
        // Creazione di una mail session
        String mittente ="atsilonoreply@gmail.com";
        String intestazione="Università degli studi di Salerno";
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
                return new PasswordAuthentication("atsilonoreply@gmail.com","atsilonoreply1");
            }
        });
        
        // Creazione del messaggio da inviare
        MimeMessage message = new MimeMessage(session);
        message.setSubject(oggetto);
        message.setText(testoEmail);
        
        // Aggiunta degli indirizzi del mittente e del destinatario
        InternetAddress fromAddress = new InternetAddress(mittente,intestazione);
        InternetAddress toAddress = new InternetAddress(dest);
        message.setFrom(fromAddress);
        message.setRecipient(Message.RecipientType.TO, toAddress);
        
        // Invio del messaggio
        Transport.send(message);
    }
}
