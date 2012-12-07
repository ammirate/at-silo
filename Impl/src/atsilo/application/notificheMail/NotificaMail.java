package atsilo.application.notificheMail;

import atsilo.entity.Utente;

import java.util.ArrayList;

public abstract class NotificaMail implements Messaggio {
    private ArrayList<Utente> destinatari;
    
    public NotificaMail(ArrayList<Utente> destinatari) {
        this.destinatari = destinatari;
    }
}
