package atsilo.application.notificheMail;

import atsilo.entity.Utente;

import java.util.ArrayList;

public abstract class NotificaMail implements Messaggio {
    private ArrayList<Utente> destinatari;
    private String oggetto;
    private String testo;
    
    /**
     * @author Frank
     * superclasse delle notifiche
     * @param destinatari
     * destinatari dell'email
     * @param oggetto
     * oggetto dell'email
     * @param testo
     * testo dell'email
     */
    public NotificaMail(ArrayList<Utente> destinatari, String oggetto,
            String testo) {
        this.destinatari = destinatari;
        this.oggetto = oggetto;
        this.testo = testo;
    }
    /**
     * ritorna i destinatari
     * @return
     */
    public ArrayList<Utente> getDestinatari()
    {
        return destinatari;
    }
    /**
     *  ritorna il testo 
     * @return
     */
    public String getTesto() {
        return testo;
    }
    /**
     *  ritorna l'oggetto
     * @return
     */
    public String getOggetto() {
        return oggetto;
    }
    
    public abstract String getTestoMail();
    
    public abstract String getOggettoMail();
    
    public abstract ArrayList<Utente> getDestinatariMail();
    
}
