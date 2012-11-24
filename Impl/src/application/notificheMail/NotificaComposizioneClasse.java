/**
 * Progetto \@silo
 * Copyleft
 */
package application.notificheMail;

import java.util.ArrayList;

import javax.mail.MessagingException;

import atsilo.entity.Utente;

/**
 * Classe NotificaComposizioneClasse
 * <Descrizione classe>
 *    classe che invia la notifica email della composizione della classe di un evento.
 * @author Gianfranco Bottiglieri
 * 
 */
public class NotificaComposizioneClasse implements Messaggio{
    //Logger
    //private static final java.util.Logger LOG = ...
    
    //Variabili di istanza
    private ArrayList<Utente> destinatari;
    
    
    //Costruttori
    
    /**
     * 
     * @param destinatari
     */
    public NotificaComposizioneClasse (ArrayList<Utente> destinatari) 
    {
        super();
        this.destinatari = destinatari;
    }
    
    
    //Metodi
    public void invia() throws Throwable
    {
        String emailDest="";
        String oggetto="";
        String testo="";
        
        for (Utente utente: destinatari) 
        {
            emailDest= utente.getEmail();
            oggetto="Notifica di Licenziamento";
            testo="Caro Signore/a "+utente.getNome() +" "+utente.getCognome()+" n la informiamo con nostro dispiacere che è stato\\a " +
                        "licenziato  per ulteriori informazioni contatti la segreteria. \n NON RISPONDA A QUESTA EMAIL";
            
            try 
            {
                    CreazioneMail.inviaMail(emailDest,oggetto, testo);
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
