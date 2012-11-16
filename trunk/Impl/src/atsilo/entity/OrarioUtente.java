package atsilo.entity;

public class OrarioUtente {
    
    private String id;
    private String oraInizio;
    private String oraFine;
    private String descrizione;
    
    public OrarioUtente() {
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setOraInizio(String oraInizio) {
        this.oraInizio = oraInizio;
    }

    public String getOraInizio() {
        return oraInizio;
    }

    public void setOraFine(String oraFine) {
        this.oraFine = oraFine;
    }

    public String getOraFine() {
        return oraFine;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getDescrizione() {
        return descrizione;
    }
}
