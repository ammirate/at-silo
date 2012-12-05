package atsilo.entity;

import java.sql.Date;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Utente.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class Utente implements Beans {
    private Date dataNascita;
    private String nome;
    private String cognome;
    private String codiceFiscale;
    private String email;
    private String comuneNascita;
    private String telefono;
    private String residenza;

    /**
     * Costruttore vuoto
     */
    public Utente() {
        super();
    }

    /**
     * @param dataNascita il paramentro è fissato
     * @param nome il paramentro è fissato
     * @param cognome il paramentro è fissato
     * @param codiceFiscale il paramentro è fissato
     * @param email il paramentro è fissato
     * @param comuneNascita il paramentro è fissato
     * @param telefono il paramentro è fissato
     * @param residenza  il paramentro è fissato
     */
    public Utente(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String residenza) {
        super();
        this.dataNascita = dataNascita;
        this.nome = nome;
        this.cognome = cognome;
        this.codiceFiscale = codiceFiscale;
        this.email = email;
        this.comuneNascita = comuneNascita;
        this.telefono = telefono;
        this.residenza = residenza;
    }



    /**
     * Metodo che prende il campo dataNascita
     * @param dataNascita il parametro inserito
     */
    public void setDataNascita(Date dataNascita) {
        this.dataNascita = dataNascita;
    }

    /**
     * Metodo che prende il campo DataNascita
     * @return DataNascita il parametro inserito
     */
    public Date getDataNascita() {
        return dataNascita;
    }

    /**
     * Metodo che prende il campo nome
     * @param nome il parametro inserito
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * Metodo che prende il campo nome
     * @return nome il parametro inserito
     */
    public String getNome() {
        return nome;
    }

    /**
     * Metodo che prende il campo cognome
     * @param cognome il parametro inserito
     */
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    /**
     * Metodo che prende il campo cognome
     * @return cognome il parametro inserito
     */
    public String getCognome() {
        return cognome;
    }

    /**
     * Metodo che prende il campo codiceFiscale
     * @param codiceFiscale il parametro inserito
     */
    public void setCodiceFiscale(String codiceFiscale) {
        this.codiceFiscale = codiceFiscale;
    }

    /**
     * Metodo che prende il campo CodiceFiscale
     * @return CodiceFiscale il parametro inserito
     */
    public String getCodiceFiscale() {
        return codiceFiscale;
    }

    /**
     * Metodo che prende il campo email
     * @param email il parametro inserito
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Metodo che prende il campo email
     * @return email il parametro inserito
     */
    public String getEmail() {
        return email;
    }

    /**
     * Metodo che prende il campo comune nascita
     * @param comuneNascita il parametro inserito
     */
    public void setComuneNascita(String comuneNascita) {
        this.comuneNascita = comuneNascita;
    }

    /**
     * Metodo che prende il campo Comune di nascita
     * @return ComuneNascita il parametro inserito
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
     * @return telefono il parametro inserito
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
     * @return residenza il parametro inserito
     */
    public String getResidenza() {
        return residenza;
    }
}
