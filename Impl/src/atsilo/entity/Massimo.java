/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Massimo.java
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

public class Massimo {
    private int id;
    private String valore;
    
    /**
     * La variabile personaleAsilo avrà il valore della variabile di PersonaleAsilo 
     * @attribute personaleAsilo La variabile è nulla c'è bisogno di una lettura della classe PersonaleAsilo
     */
    private PersonaleAsilo personaleAsilo;
    
    /**
     * Costruttore vuoto
     */
    public Massimo() {
    }
    
    /**
     * @param id il parametro fissato
     * @param valore il parametro fissato
     */
    public Massimo(int id, String valore){
        this.id = id;
        this.valore = valore;
        this.personaleAsilo = null;
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
     * Metodo che setta il parametro valore
     * @param valore il parametro settato
     */
    public void setValore(String valore) {
        this.valore = valore;
    }

    /**
     * Metodo che prende il campo valore
     * @return valore il parametro inserito
     */
    public String getValore() {
        return valore;
    }
    
    /**
     * Metodo che setta il parametro letto dalla classe PersonaleAsilo
     * @param personaleAsilo è settato dopo la lettura
     */    
    public void setPersonaleAsilo(PersonaleAsilo personaleAsilo) {
        this.personaleAsilo = personaleAsilo;
    }

    /**
     * Metodo che prende il parametro letto dalla classe PersonaleAsilo
     * @return personaleAsilo parametro preso dalla lettura
     */
    public PersonaleAsilo getPersonaleAsilo() {
        return personaleAsilo;
    }
    
}
