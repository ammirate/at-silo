/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: NotificaMailRegistrazione.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Alfonso, 15/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.application.notificheMail;

import java.util.ArrayList;

import atsilo.entity.Account;
import atsilo.entity.Genitore;
import atsilo.entity.Utente;

/**
 * Classe NotificaMailRegistrazione
 * <Descrizione classe>
 * 
 * @author Alfonso
 * 
 */
public class NotificaMailRegistrazione extends NotificaMail {

    private Account registeredAccount;
    private Genitore genitore;
    
    /**
     * @param destinatari
     * @param oggetto
     * @param testo
     */
    public NotificaMailRegistrazione(ArrayList<Utente> destinatari,
            String oggetto, String testo,Account acc, Genitore gen) {
        super(destinatari, oggetto, testo);
        registeredAccount=acc;
        genitore=gen;
    }
    
    /**
     * @see atsilo.application.notificheMail.NotificaMail#getTestoMail()
     */
    @Override
    public String getTestoMail() {
        // TODO Scheletro generato automaticamente
        
        return getTesto();
    }
    
    /**
     * @see atsilo.application.notificheMail.NotificaMail#getOggettoMail()
     */
    @Override
    public String getOggettoMail() {
        // TODO Scheletro generato automaticamente
        return getOggetto();
    }
    
    /**
     * @see atsilo.application.notificheMail.NotificaMail#getDestinatariMail()
     */
    @Override
    public ArrayList<Utente> getDestinatariMail() {
        // TODO Scheletro generato automaticamente
        return getDestinatari();
    }
    //Logger
    /*
     * private static final java.util.Logger LOG
     *         = Logger.getLogger(NotificaMailRegistrazione.class.getName());
     */
    
    //Variabili di istanza
    
    
    //Costruttori
    
    
    //Metodi
}
