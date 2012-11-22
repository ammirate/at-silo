package atsilo.entity;

public class Servizio {
    private String id;
    private String orarioInizio;
    private String orarioFine;
    private String pianoPasto;
    
    /**
     * La variabile bambino � nulla c'� bisogno di una lettura della classe Bambino
     */
    private Bambino bambino;
    
    /**
     * La variabile orarioUtente � nulla c'� bisogno di una lettura della classe OrarioUtente
     */
    private OrarioUtente orarioUtente;

    public Servizio(){}
    //(id,orario_inizio,orario_fine,piano_pasto,BAMBINO,ORARIO_UTENTE
    
    /**
     * Metodo che prende il campo Id
     * @param id il parametro inserito
     */
    public void setId(String id){
        this.id=id;
        }
    
    /**
     * Metodo che prende il campo id
     * @return id il parametro inserito
     */
    public String getId(){
        return this.id;

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
    public Bambino getBambino() {
            return bambino;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Bambino
     * @param Bambino � settato dopo la lettura
     */
    public void setBambino(Bambino bambino) {
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
     * @param orarioUtente � settato dopo la lettura
     */
    public void setOrarioUtente(OrarioUtente orarioUtente) {
        this.orarioUtente = orarioUtente;
    }
}
