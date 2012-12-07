/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Contestazione.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Andrea Micco, 07/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.entity;

import java.sql.Date;

public class Contestazione {

    private int id;
    private Date data;
    private String descrizione;
    
    /**
     * Costruttore vuoto
     */
    public Contestazione() {
    }
    
    /**
     * @param id il parametro fissato
     * @param data il parametro fissato
     * @param descrizione il parametro fissato
     */
    public Contestazione(int id, Date data, String descrizione){
        this.id = id;
        this.data = data;
        this.descrizione = descrizione;
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
    
}
