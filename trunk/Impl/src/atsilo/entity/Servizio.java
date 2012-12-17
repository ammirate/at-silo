package atsilo.entity;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Servizio.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 14/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class Servizio {
    private int id;
    private String orarioInizio;
    private String orarioFine;
    private String pianoPasto;
    
    /**
     * La variabile bambino è nulla c'è bisogno di una lettura della classe Bambino
     */
    private String bambino;
    
    /**
     * La variabile orarioUtente è nulla c'è bisogno di una lettura della classe OrarioUtente
     */
    private OrarioUtente orarioUtente;

    /**
     * Costruttore vuoto
     */
    public Servizio(){}
    //(id,orario_inizio,orario_fine,piano_pasto,BAMBINO,ORARIO_UTENTE
    
    /**
     * @param id il paramentro è fissato 
     * @param orarioInizio il paramentro è fissato
     * @param orarioFine il paramentro è fissato
     * @param pianoPasto il paramentro è fissato
     * @param bambino è settato dopo la lettura
     * @param orarioUtente è settato dopo la lettura
     */
    public Servizio(int id, String orarioInizio, String orarioFine,
            String pianoPasto, String bambino, OrarioUtente orarioUtente) {
        super();
        this.id = id;
        this.orarioInizio = orarioInizio;
        this.orarioFine = orarioFine;
        this.pianoPasto = pianoPasto;
        this.bambino = bambino;
        this.orarioUtente = orarioUtente;
    }
    
    /**
     * @param id il paramentro è fissato 
     * @param orarioInizio il paramentro è fissato
     * @param orarioFine il paramentro è fissato
     * @param pianoPasto il paramentro è fissato
     * @param bambino è settato dopo la lettura
     * @param orarioUtente è settato dopo la lettura
     */
    public Servizio(String bambino, OrarioUtente orarioUtente) {
        super();
        this.bambino = bambino;
        this.orarioUtente = orarioUtente;
    }
    
    /**
     * Metodo che prende il campo Id
     * @param id il parametro inserito
     */
    public void setId(int id){
        this.id=id;
        }
    
    /**
     * Metodo che prende il campo id
     * @return id il parametro inserito
     */
    public int getId(){
        return this.id;
    }
    /**
    * Metodo che prende il campo orario inizio
    * @return orarioInizio il parametro inserito
    */
    public String getOrarioInizio() {
            return orarioInizio;
    }
    
    /**
     * Metodo che prende il campo orario inizio
     * @param orarioInizio il parametro inserito
     */
    public void setOrarioInizio(String orarioInizio) {
            this.orarioInizio = orarioInizio;
    }
    
    /**
     * Metodo che prende il campo orarioFine
     * @return orarioFine il parametro inserito
     */
    public String getOrarioFine() {
            return orarioFine;
    }
    
    /**
     * Metodo che prende il campo orario fine
     * @param orarioFine il parametro inserito
     */
    public void setOrarioFine(String orarioFine) {
            this.orarioFine = orarioFine;
    }
    
    /**
     * Metodo che prende il campo piano pasto
     * @return pianoPasto il parametro inserito
     */
    public String getPianoPasto() {
            return pianoPasto;
    }
    
    /**
     * Metodo che prende il campo piano pasto
     * @param pianoPasto il parametro inserito
     */
    public void setPianoPasto(String pianoPasto) {
            this.pianoPasto = pianoPasto;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Bambino
     * @return Bambino preso dalla lettura
     */
    public String getBambino() {
            return bambino;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Bambino
     * @param bambino è settato dopo la lettura
     */
    public void setBambino(String bambino) {
            this.bambino = bambino;
    }
    
    /**
     * Metodo che prende il parametro letto dalla classe OrarioUtente
     * @return orarioUtente preso dalla lettura
     */
    public OrarioUtente getOrarioUtente() {
        return orarioUtente;
    }

    /**
     * Metodo che setta il parametro letto dalla classe orarioUtente
     * @param orarioUtente è settato dopo la lettura
     */
    public void setOrarioUtente(OrarioUtente orarioUtente) {
        this.orarioUtente = orarioUtente;
    }
}
