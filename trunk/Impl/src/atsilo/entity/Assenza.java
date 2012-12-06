package atsilo.entity;
import java.sql.Date;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Assenza.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio CEsarano, 16/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class Assenza {
    
    /**
     * @attribute data di tipo Date
     */
    private Date data;
    
   
    private Bambino bambino;
    
    /**
     * Costruttore vuoto
     */
    public Assenza() {
    }

    /**
     * 
     * @param data
     * @param bambino
     */
    public Assenza(Date data, Bambino b) {
        super();
        this.data = data;
        this.bambino = b;
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
     * Metodo che setta il campo bambino
     * @param bambino il parametro fissato
     */
    public void setBambino(Bambino bambino) {
        this.bambino = bambino;
    }
    
    /**
     * Metodo che prende il campo bambino
     * @return bambino il parametro inserito
     */
    public Bambino getBambino() {
        return bambino;
    }


    
    
    
}