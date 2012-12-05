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
 * REVISION
 * Andrea Micco, 5/12/2012
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
    private String cittadinanza;
    private String indirizzoResidenza;
    private int numeroCivicoResidenza;
    private int capResidenza;
    private String comuneResidenza;
    private String provinciaResidenza;
    private String indirizzoDomicilio;
    private int numeroCivicoDomicilio;
    private int capDomicilio;
    private String comuneDomicilio;
    private String provinciaDomicilio;
    
    
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
     * @param indirizzoResidenza  il paramentro è fissato
     * @param cittadinanza il parametro è fissato
     * @param numeroCivicoResidenza il parametro è fissato
     * @param capResidenza il parametro è fissato
     * @param comuneResidenza il parametro è fissato
     * @param provinciaResidenza il parametro è fissato
     * @param indirizzoDomicilio il parametro è fissato
     * @param numeroCivicoDomicilio il parametro è fissato
     * @param capDomicilio il parametro è fissato
     * @param comuneDomicilio il parametro è fissato
     * @param provinciaDomicilio il parametro è fissato
     */
    public Utente(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            int numeroCivicoResidenza, int capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            int numeroCivicoDomicilio, int capDomicilio, String comuneDomicilio,
            String provinciaDomicilio) {
        super();
        this.dataNascita = dataNascita;
        this.nome = nome;
        this.cognome = cognome;
        this.codiceFiscale = codiceFiscale;
        this.email = email;
        this.comuneNascita = comuneNascita;
        this.telefono = telefono;
        this.indirizzoResidenza = indirizzoResidenza;
        this.cittadinanza = cittadinanza;
        this.numeroCivicoResidenza = numeroCivicoResidenza;
        this.capResidenza = capResidenza;
        this.comuneResidenza = comuneResidenza;
        this.provinciaResidenza = provinciaResidenza;
        this.indirizzoDomicilio = indirizzoDomicilio;
        this.numeroCivicoDomicilio = numeroCivicoDomicilio;
        this.capDomicilio = capDomicilio;
        this.comuneDomicilio = comuneDomicilio;
        this.provinciaDomicilio = provinciaDomicilio;
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
     * Metodo che prende il campo cittadinanza
     * @param cittadinanza il parametro inserito
     */
    public void setCittadinanza(String cittadinanza) {
        this.cittadinanza = cittadinanza;
    }

    /**
     * Metodo che prende il campo cittadinazna
     * @return cittadinanza il parametro inserito
     */
    public String getcittadinanza() {
        return cittadinanza;
    }
    
    /**
     * Metodo che prende il campo indirizzoResidenza
     * @param indirizzoResidenza il parametro inserito
     */
    public void setIndirizzoResidenza(String indirizzoResidenza) {
        this.indirizzoResidenza = indirizzoResidenza;
    }

    /**
     * Metodo che prende il campo indirizzoResidenza
     * @return indirizzoResidenza il parametro inserito
     */
    public String getIndirizzoResidenza() {
        return indirizzoResidenza;
    }
    
    /**
     * Metodo che prende il campo numeroCivicoResidenza
     * @param numeroCivicoResidenza il parametro inserito
     */
    public void setNumeroCivicoResidenza(int numeroCivicoResidenza) {
        this.numeroCivicoResidenza = numeroCivicoResidenza;
    }

    /**
     * Metodo che prende il campo numeroCivicoResidenza
     * @return numeroCivicoResidenza il parametro inserito
     */
    public int getNumeroCivicoResidenza() {
        return numeroCivicoResidenza;
    }
    
    /**
     * Metodo che prende il campo capResidenza
     * @param capResidenza il parametro inserito
     */
    public void setCapResidenza(int capResidenza) {
        this.capResidenza = capResidenza;
    }

    /**
     * Metodo che prende il campo capResidenza
     * @return capResidenza il parametro inserito
     */
    public int getCapResidenza() {
        return capResidenza;
    }
    
    /**
     * Metodo che prende il campo comuneResidenza
     * @param comuneResidenza il parametro inserito
     */
    public void setComuneResidenza(String comuneResidenza) {
        this.comuneResidenza = comuneResidenza;
    }

    /**
     * Metodo che prende il campo comuneResidenza
     * @return comuneResidenza il parametro inserito
     */
    public String getComuneResidenza() {
        return comuneResidenza;
    }
    
    /**
     * Metodo che prende il campo provinciaResidenza
     * @param provinciaResidenza il parametro inserito
     */
    public void setProvinciaResidenza(String provinciaResidenza) {
        this.provinciaResidenza = provinciaResidenza;
    }

    /**
     * Metodo che prende il campo provinciaResidenza
     * @return provinciaResidenza il parametro inserito
     */
    public String getProvinciaResidenza() {
        return provinciaResidenza;
    }
    
    /**
     * Metodo che prende il campo indirizzoDomicilio
     * @param indirizzoDomicilio il parametro inserito
     */
    public void setIndirizzoDomicilio(String indirizzoDomicilio) {
        this.indirizzoDomicilio = indirizzoDomicilio;
    }

    /**
     * Metodo che prende il campo indirizzoDomicilio
     * @return indirizzoDomicilio il parametro inserito
     */
    public String getIndirizzoDomicilio() {
        return indirizzoDomicilio;
    }
    
    /**
     * Metodo che prende il campo numeroCivicoDomicilio
     * @param numeroCivicoDomicilio il parametro inserito
     */
    public void setNumeroCivicoDomicilio(int numeroCivicoDomicilio) {
        this.numeroCivicoDomicilio = numeroCivicoDomicilio;
    }

    /**
     * Metodo che prende il campo numeroCivicoDomicilio
     * @return numeroCivicoDomicilio il parametro inserito
     */
    public int getNumeroCivicoDomicilio() {
        return numeroCivicoDomicilio;
    }
    
    /**
     * Metodo che prende il campo capDomicilio
     * @param capDomicilio il parametro inserito
     */
    public void setCapDomicilio(int capDomicilio) {
        this.capDomicilio = capDomicilio;
    }

    /**
     * Metodo che prende il campo capDomicilio
     * @return capDomicilio il parametro inserito
     */
    public int getCapDomicilio() {
        return capDomicilio;
    }
    
    /**
     * Metodo che prende il campo comuneDomicilio
     * @param comuneDomicilio il parametro inserito
     */
    public void setComuneDomicilio(String comuneDomicilio) {
        this.comuneDomicilio = comuneDomicilio;
    }

    /**
     * Metodo che prende il campo comuneDomicilio
     * @return comuneDomicilio il parametro inserito
     */
    public String getComuneDomicilio() {
        return comuneDomicilio;
    }
    
    /**
     * Metodo che prende il campo provinciaDomicilio
     * @param provinciaDomicilio il parametro inserito
     */
    public void setProvinciaDomicilio(String provinciaDomicilio) {
        this.provinciaDomicilio = provinciaDomicilio;
    }

    /**
     * Metodo che prende il campo provinciaDomicilio
     * @return provinciaDomicilio il parametro inserito
     */
    public String getProvinciaDomicilio() {
        return provinciaDomicilio;
    }
}
