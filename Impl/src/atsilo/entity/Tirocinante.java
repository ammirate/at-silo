package atsilo.entity;

import java.sql.Date;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Account.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 14/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class Tirocinante extends Utente{
    
    //nome,cognome,codice_fiscale,telefono,email,d
    //ata_di_nascita,comune_di_nascita,indirizzo residenza,titolo_di_studi,
    //ore_totali,ore_lavoro,PERSONALE_ASILO
    
    private int oreTotali;
    private int oreLavoro;
    private String stato;
    private int matricola;
    private String giudizioFinale;
    private String disponibilita;

    
    /**
     * La variabile personaleAsilo è nulla c'è bisogno di una lettura della classe PersonaleAsilo
     */
    private PersonaleAsilo personaleAsilo;
    
    /**
     * Costruttore vuoto
     */
    public Tirocinante(){
    }
    
    /**
     * @param oreTotali il paramentro è fissato
     * @param oreLavoro il paramentro è fissato
     * @param personaleAsilo è settato dopo la lettura 
     * @param stato il parametro è fissato
     * @param matricola il parametro è fissato
     * @param giudizioFinale il parametro è fissato
     * @param disponibilita il parametro è fissato
     */
    public Tirocinante(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            int numeroCivicoResidenza, int capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            int numeroCivicoDomicilio, int capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, int oreTotali, int oreLavoro,
            PersonaleAsilo personaleAsilo, String stato, int matricola,
            String giudizioFinale, String disponibilita) {
        super(dataNascita, nome, cognome,
                codiceFiscale, email, comuneNascita,
              telefono, cittadinanza, indirizzoResidenza,
                numeroCivicoResidenza, capResidenza, comuneResidenza,
                provinciaResidenza, indirizzoDomicilio,
               numeroCivicoDomicilio, capDomicilio,comuneDomicilio,
               provinciaDomicilio);
        this.oreTotali = oreTotali;
        this.oreLavoro = oreLavoro;
        this.personaleAsilo = personaleAsilo;
        this.stato = stato;
        this.matricola = matricola;
        this.giudizioFinale = giudizioFinale;
        this.disponibilita = disponibilita;
    }


    /**
     * Metodo che prende il valore oreTotali
     * @param oreTotali il parametro inserito
     */
    public void setOreTotali(int oreTotali) {
        this.oreTotali = oreTotali;
    }

    /**
     * Metodo che prende il valore oreTotali
     * @return oreTotali il parametro inserito
     */
    public int getOreTotali() {
        return oreTotali;
    }

    /**
     * Metodo che prende il valore ore lavoro
     * @param oreLavoro il parametro inserito
     */
    public void setOreLavoro(int oreLavoro) {
        this.oreLavoro = oreLavoro;
    }

    /**
     * Metodo che prende il valore oreLavoro
     * @return oreLavoro il parametro inserito
     */
    public int getOreLavoro() {
        return oreLavoro;
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
     * @return personaleAsilo preso dalla lettura
     */
    public PersonaleAsilo getPersonaleAsilo() {
        return personaleAsilo;
    }
    
    /**
     * Metodo che prende il valore stato
     * @return stato il parametro inserito
     */
    public String getStato() {
        return stato;
    }

    /**
     * Metodo che prende il valore stato
     * @param stato il parametro inserito
     */
    public void setStato(String stato) {
        this.stato = stato;
    }
    
    /**
     * Metodo che prende il valore matricola
     * @return matricola il parametro inserito
     */
    public int getMatricola() {
        return matricola;
    }

    /**
     * Metodo che prende il valore matricola
     * @param matricola il parametro inserito
     */
    public void setMatricola(int matricola) {
        this.matricola = matricola;
    }
    
    /**
     * Metodo che prende il valore giudizioFinale
     * @return giudizioFinale il parametro inserito
     */
    public String getGiudizioFinale() {
        return giudizioFinale;
    }

    /**
     * Metodo che prende il valore giudizioFinale
     * @param giudizioFinale il parametro inserito
     */
    public void setGiudizioFinale(String giudizioFinale) {
        this.giudizioFinale = giudizioFinale;
    }
    
    /**
     * Metodo che prende il valore disponibilita
     * @return disponibilita il parametro inserito
     */
    public String getDisponibilita() {
        return disponibilita;
    }

    /**
     * Metodo che prende il valore disponibilita
     * @param disponibilita il parametro inserito
     */
    public void setDisponibilita(String disponibilita) {
        this.disponibilita = disponibilita;
    }
}
