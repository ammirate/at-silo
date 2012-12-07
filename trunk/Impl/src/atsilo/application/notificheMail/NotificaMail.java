package atsilo.application.notificheMail;

import atsilo.entity.Utente;

import java.util.ArrayList;

public abstract class NotificaMail implements Messaggio {
    private ArrayList<Utente> destinatari;
    private String oggetto;
    private String testo;
    
    
    public NotificaMail(ArrayList<Utente> destinatari, String oggetto,
            String testo) {
        this.destinatari = destinatari;
        this.oggetto = oggetto;
        this.testo = testo;
    }
    
    public String getTesto() {
        return testo;
    }
    
    public String getOggetto() {
        return oggetto;
    }
    
    public abstract String getTestoMail();
    
    public abstract String getOggettoMail();
    
    public abstract ArrayList<Utente> getDestinatariMail();
    
}
