package atsilo.entity;

public class Utente {
    Date dataNascita;
    private String nome;
    private String cognome;
    private String codiceFiscale;
    private String email;
    private String comuneNascita;
    private String telefono;
    private String residenza;

    public Utente() {
        super();
    }


    public void setDataNascita(Date dataNascita) {
        this.dataNascita = dataNascita;
    }

    public Date getDataNascita() {
        return dataNascita;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCodiceFiscale(String codiceFiscale) {
        this.codiceFiscale = codiceFiscale;
    }

    public String getCodiceFiscale() {
        return codiceFiscale;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setComuneNascita(String comuneNascita) {
        this.comuneNascita = comuneNascita;
    }

    public String getComuneNascita() {
        return comuneNascita;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setResidenza(String residenza) {
        this.residenza = residenza;
    }

    public String getResidenza() {
        return residenza;
    }
}
