package atsilo.entity;

import java.sql.Date;

public class Utente implements Beans {
    private Date dataNascita;
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

    /**
     * Metodo che prende il campo dataNascita
     * @return dataNascita il parametro inserito
     */
    public void setDataNascita(Date dataNascita) {
        this.dataNascita = dataNascita;
    }

    /**
     * Metodo che prende il campo DataNascita
     * @param DataNascita il parametro inserito
     */
    public Date getDataNascita() {
        return dataNascita;
    }

    /**
     * Metodo che prende il campo nome
     * @return nome il parametro inserito
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * Metodo che prende il campo nome
     * @param nome il parametro inserito
     */
    public String getNome() {
        return nome;
    }

    /**
     * Metodo che prende il campo cognome
     * @return cognome il parametro inserito
     */
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    /**
     * Metodo che prende il campo cognome
     * @param cognome il parametro inserito
     */
    public String getCognome() {
        return cognome;
    }

    /**
     * Metodo che prende il campo codiceFiscale
     * @return codiceFiscale il parametro inserito
     */
    public void setCodiceFiscale(String codiceFiscale) {
        this.codiceFiscale = codiceFiscale;
    }

    /**
     * Metodo che prende il campo CodiceFiscale
     * @param CodiceFiscale il parametro inserito
     */
    public String getCodiceFiscale() {
        return codiceFiscale;
    }

    /**
     * Metodo che prende il campo email
     * @return email il parametro inserito
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Metodo che prende il campo email
     * @param email il parametro inserito
     */
    public String getEmail() {
        return email;
    }

    /**
     * Metodo che prende il campo comune nascita
     * @return comuneNascita il parametro inserito
     */
    public void setComuneNascita(String comuneNascita) {
        this.comuneNascita = comuneNascita;
    }

    /**
     * Metodo che prende il campo Comune di nascita
     * @param ComuneNascita il parametro inserito
     */
    public String getComuneNascita() {
        return comuneNascita;
    }

    /**
     * Metodo che prende il campo telefono
     * @param telefono il parametro inserito
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * Metodo che prende il campo telefono
     * @param telefono il parametro inserito
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * Metodo che prende il campo residenza
     * @param residenza il parametro inserito
     */
    public void setResidenza(String residenza) {
        this.residenza = residenza;
    }

    /**
     * Metodo che prende il campo residenza
     * @param residenza il parametro inserito
     */
    public String getResidenza() {
        return residenza;
    }
}
