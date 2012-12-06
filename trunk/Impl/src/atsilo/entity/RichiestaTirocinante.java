/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: RichiestaTirocinante.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Andrea Micco, 06/dic/2012
 *-----------------------------------------------------------------
 */

package atsilo.entity;

import java.sql.Date;


public class RichiestaTirocinante {
    private int id;
    private String descrizione;
    private Date data;
    private String oraInizio;
    private String oraFine;
    private int numeroTirocinanti;
    
    /**
     * Costruttore vuoto
     */
    public RichiestaTirocinante(){
    }
    
    /**
     * @param id il paramentro è fissato
     * @param descrizione il paramentro è fissato
     * @param data il paramentro è fissato
     * @param oraInizio il paramentro è fissato
     * @param oraFine il paramentro è fissato
     * @param numeroTirocinanti il parametro è fissato
     */
    public RichiestaTirocinante(int id, String descrizione, Date data,
            String oraInizio, String oraFine, int numeroTirocinanti){
        this.id = id;
        this.descrizione = descrizione;
        this.data = data;
        this.oraInizio = oraInizio;
        this.oraFine = oraFine;
        this.numeroTirocinanti = numeroTirocinanti;
    }
    
    /**
     * Metodo che setta il campo id
     * @param id il parametro fissato
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
     * Metodo che setta il campo descrizione
     * @param descrizione il parametro fissato
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
     * Metodo che setta il campo data
     * @param data il parametro fissato
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
     * Metodo che setta il campo oraInizio
     * @param oraInizio il parametro fissato
     */
    public void setOraInizio(String oraInizio) {
        this.oraInizio = oraInizio;
    }

    /**
     * Metodo che prende il campo oraInizio
     * @return oraInizio il parametro inserito
     */
    public String getOraInizio() {
        return oraInizio;
    }
    
    /**
     * Metodo che setta il campo oraFine
     * @param oraFine il parametro fissato
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
     * Metodo che setta il campo numeroTirocinanti
     * @param numeroTirocinanti il parametro fissato
     */
    public void setNumeroTirocinanti(int numeroTirocinanti) {
        this.numeroTirocinanti = numeroTirocinanti;
    }

    /**
     * Metodo che prende il campo numeroTirocinanti
     * @return numeroTirocinanti il parametro inserito
     */
    public int getNumeroTirocinanti() {
        return numeroTirocinanti;
    }
}
