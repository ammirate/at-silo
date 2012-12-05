package atsilo.entity;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: OrarioUtente.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class OrarioUtente {
    
    private String id;
    private String oraInizio;
    private String oraFine;
    private String descrizione;
    
    /**
     * Costruttore vuoto
     */
    public OrarioUtente() {
    }

    /**
     * @param id il paramentro è fissato
     * @param oraInizio il paramentro è fissato
     * @param oraFine il paramentro è fissato
     * @param descrizione il paramentro è fissato
     */
    public OrarioUtente(String id, String oraInizio, String oraFine,
            String descrizione) {
        super();
        this.id = id;
        this.oraInizio = oraInizio;
        this.oraFine = oraFine;
        this.descrizione = descrizione;
    }


    /**
     * Metodo che setta il parametro id
     * @param id il parametro fissato
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * Metodo che prende il parametro Id
     * @return id il parametro inserito
     */
    public String getId() {
        return id;
    }

    /**
     * Metodo che setta il parametro oraInizio
     * @param oraInizio il parametro fissato
     */
    public void setOraInizio(String oraInizio) {
        this.oraInizio = oraInizio;
    }

    /**
     * Metodo che prende il parametro oraInizio
     * @return oraInizio il parametro inserito
     */
    public String getOraInizio() {
        return oraInizio;
    }

    /**
     * Metodo che setta il parametro oraFine
     * @param oraFine il parametro fissato
     */
    public void setOraFine(String oraFine) {
        this.oraFine = oraFine;
    }

    /**
     * Metodo che prende il parametro orario fine
     * @return oraFine il parametro inserito
     */
    public String getOraFine() {
        return oraFine;
    }

    /**
     * Metodo che setta il parametro descrizione
     * @param descrizione il parametro fissato
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }
    
    /**
     * Metodo che prende il parametro descrizione
     * @return descrizone il parametro inserito
     */
    public String getDescrizione() {
        return descrizione;
    }
}
