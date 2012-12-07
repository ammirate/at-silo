/**
 * -----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 * -----------------------------------------------------------------
 * FILE: NotificaMailComposizioneClasse.java
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
import atsilo.entity.Utente;


/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: NotificaComposizioneClasse.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Gianfranco Bottiglieri, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

/**
 * @author Frank
 * Classe NotificaMailComposizioneClasse
 *  <Descrizione classe> classe che invia la notifica email della composizione della classe.
 * 
 */
public class NotificaMailComposizioneClasse extends NotificaMail {
    //variabili di istanza
    String linkpagina;
    /**
     * 
     * @param destinatari
     * destinari dell'email
     * @param oggetto
     * oggetto dell'eamil
     * @param testo
     * testo dell'email
     * @param linkpagina
     * link della pagina dove si trova la composizione della classe
     */
    public NotificaMailComposizioneClasse(ArrayList<Utente> destinatari,
            String oggetto, String testo,String linkpagina) {
        super(destinatari, oggetto, testo);
        this.linkpagina=linkpagina;
    }
    /**
     * 
     * metodo che restiuisce il testo dell'email con l'aggiunta del link della pagina dove vi è la composizione della classe
     */
    public String getTestoMail() 
    {
        String testo= this.getTesto()+""+linkpagina;
        return testo;
    }

    /**
     * metodo che restituisce l'oggeto dell'email con il predefinito in defaul 
     */
    @Override
    public String getOggettoMail() {
        
        String oggetto="Notifica di composizione di classe"+this.getOggetto();
        return oggetto;
    }

    /**
     * metodo che restituisce i destinatari della notifica 
     */
    @Override
    public ArrayList<Utente> getDestinatariMail() 
    {
        return this.getDestinatari();
    }
    
}
