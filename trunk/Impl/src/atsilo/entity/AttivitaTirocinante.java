/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: AttivitaTirocinante.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Andrea Micco, 06/dic/2012
 *-----------------------------------------------------------------
 */

package atsilo.entity;

import java.sql.Date;

public class AttivitaTirocinante {
  
    private int id;
    private String descrizione;
    private Date data;
    private String oraInizio;
    private String oraFine;
    private String valutazione;
    
    /**
     * Costruttore vuoto
     */
    public AttivitaTirocinante() {
    }
    
    /**
     * @param id il parametro fissato
     * @param descrizione il parametro fissato
     * @param data il parametro fissato
     * @param oraInizio il parametro fissato
     * @param oraFine il parametro fissato
     * @param valutazione il parametro fissato
     */
    public AttivitaTirocinante(int id, String descrizione, Date data,
            String oraInizio, String oraFine, String valutazione){
        this.id = id;
        this.descrizione = descrizione;
        this.data = data;
        this.oraInizio = oraInizio;
        this.oraFine = oraFine;
        this.valutazione = valutazione;
    }
    
    /**
     * Metodo che setta il parametro id
     * @param id il parametro settato
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Metodo che prende il campo id
     * @return id il parametro inserito
     */
    public int getId() {
        return id;
    }
    
    /**
     * Metodo che setta il parametro descrizione
     * @param descrizione il parametro settato
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    /**
     * Metodo che prende il campo descrizione
     * @return descrizione il parametro inserito
     */
    public String getDescrizione() {
        return descrizione;
    }
    
    /**
     * Metodo che setta il parametro data
     * @param data il parametro settato
     */
    public void setData(Date data) {
        this.data = data;
    }

    /**
     * Metodo che prende il campo data
     * @return data il parametro inserito
     */
    public Date getData() {
        return data;
    }
    
    /**
     * Metodo che setta il parametro oraInizio
     * @param oraInizio il parametro settato
     */
    public void setOraInizio(String oraInizio) {
        this.oraInizio = oraInizio;
    }

    /**
     * Metodo che prende il campo oraInizio
     * @return oraInizio il parametro inserito
     */
    public String oraInizio() {
        return oraInizio;
    }
    
    /**
     * Metodo che setta il parametro oraFine
     * @param oraFine il parametro settato
     */
    public void setOraFine(String oraFine) {
        this.oraFine = oraFine;
    }

    /**
     * Metodo che prende il campo oraFine
     * @return oraFine il parametro inserito
     */
    public String getOraFine() {
        return oraFine;
    }
    
    /**
     * Metodo che setta il parametro valutazione
     * @param valutazione il parametro settato
     */
    public void setValutazione(String valutazione) {
        this.valutazione = valutazione;
    }

    /**
     * Metodo che prende il campo valutazione
     * @return valutazione il parametro inserito
     */
    public String getValutazione() {
        return valutazione;
    }
 
}
