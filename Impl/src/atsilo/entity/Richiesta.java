package atsilo.entity;

public class Richiesta {
    private int id;
    private String tipo;
    private String menuRichiesto;
    private String orarioRichiesto;
    private String allegato;
    
    /**
     * La variabile genitore è nulla c'è bisogno di una lettura della classe Genitore
     */
    private Genitore genitore;
    
    /**
     * La variabile servizio è nulla c'è bisogno di una lettura della classe Servizio
     */
    private Servizio servizio;

    
    public Richiesta(){
    }

    /**
     * Metodo che setta il valore id
     * @param id il parametro fissato
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Metodo che prende il valore Id
     * @return id il parametro inserito
     */
    public int getId() {
        return id;
    }

    /**
     * Metodo che setta il campo tipo
     * @param tipo il parametro fissato
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * Metodo che prende il campo tipo
     * @return tipo il parametro inserito
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * Metodo che setta il campo menu richiesto
     * @param menuRichiesto il parametro fissato
     */
    public void setMenuRichiesto(String menuRichiesto) {
        this.menuRichiesto = menuRichiesto;
    }

    /**
     * Metodo che prende il campo menurichiesto
     * @return menuRichiesto il parametro inserito
     */
    public String getMenuRichiesto() {
        return menuRichiesto;
    }

    /**
     * Metodo che setta il campo orario richiesto
     * @param orariRichiesto il parametro fissato
     */
    public void setOrarioRichiesto(String orarioRichiesto) {
        this.orarioRichiesto = orarioRichiesto;
    }

    /**
     * Metodo che prende il valore campo richiesto
     * @return orarioRichiesto il parametro inserito
     */
    public String getOrarioRichiesto() {
        return orarioRichiesto;
    }

    /**
     * Metodo che setta il campo allegato
     * @param allegato il parametro fissato
     */
    public void setAllegato(String allegato) {
        this.allegato = allegato;
    }

    /**
     * Metodo che prende il campo allegato
     * @return allegato il parametro inserito
     */
    public String getAllegato() {
        return allegato;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Genitore
     * @param genitore è settato dopo la lettura
     */
    public void setGenitore(Genitore genitore) {
        this.genitore = genitore;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Genitore
     * @return genitore preso dalla lettura
     */
    public Genitore getGenitore() {
        return genitore;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Servizio
     * @param servizio è settato dopo la lettura
     */
    public void setServizio(Servizio servizio) {
        this.servizio = servizio;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Servizio
     * @return servizio preso dalla lettura
     */
    public Servizio getServizio() {
        return servizio;
    }
}
