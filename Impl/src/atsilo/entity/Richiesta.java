package atsilo.entity;

public class Richiesta {
    private int id;
    private String tipo;
    private String menuRichiesto;
    private String orarioRichiesto;
    private String allegato;
    private Genitore genitore;
    private Servizio servizio;

    
    public Richiesta(){
    }


    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setMenuRichiesto(String menuRichiesto) {
        this.menuRichiesto = menuRichiesto;
    }

    public String getMenuRichiesto() {
        return menuRichiesto;
    }

    public void setOrarioRichiesto(String orarioRichiesto) {
        this.orarioRichiesto = orarioRichiesto;
    }

    public String getOrarioRichiesto() {
        return orarioRichiesto;
    }

    public void setAllegato(String allegato) {
        this.allegato = allegato;
    }

    public String getAllegato() {
        return allegato;
    }

    public void setGenitore(Genitore genitore) {
        this.genitore = genitore;
    }

    public Genitore getGenitore() {
        return genitore;
    }

    public void setServizio(Servizio servizio) {
        this.servizio = servizio;
    }

    public Servizio getServizio() {
        return servizio;
    }
}
