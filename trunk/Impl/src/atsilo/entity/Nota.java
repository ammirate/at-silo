/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Nota.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Andrea Micco, 06/dic/2012
 *-----------------------------------------------------------------
 */

package atsilo.entity;


public class Nota {

    private String titolo;
    private String descrizione;
    
    /**
     * Costruttore vuoto
     */
    public Nota() {
    }
    
    /**
     * @param titolo il parametro fissato
     * @param descrizione il parametro fissato
     */
    public Nota(String titolo, String descrizione){
        this.titolo = titolo;
        this.descrizione = descrizione;
    }
    
    /**
     * Metodo che setta il parametro titolo
     * @param titolo il parametro settato
     */
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    /**
     * Metodo che prende il campo titolo
     * @return titolo il parametro inserito
     */
    public String getTitolo() {
        return titolo;
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
