package atsilo.entity;

import java.sql.Date;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Tirocinante.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 14/11/2012 (non responsabile)
 * REVISION
 * Andrea Micco, 6/12/2012
 * Fabio Napoli, 7/12/2012
 * Mariella Ferrara, 7/12/2012
 *-----------------------------------------------------------------
 */

public class Tirocinante extends Utente{
    
   
    
    private String titoloDiStudi;
    private int oreTotali;
    private int oreLavoro;
    private String stato;
    private String matricola;
    private String giudizioFinale;
    private String disponibilita;
    private String tutorEsterno;

    
    /**
     * La variabile personaleAsilo è nulla c'è bisogno di una lettura della classe PersonaleAsilo
     */
    private String personaleAsilo;
    
    /**
     * La variabile listaContestazione è nulla c'è bisogno di una lettura della classe List<Contestazione>
     */
    private List<Contestazione> listaContestazione;
    
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
     * @param titoloDiStudi il parametro è fissato
     * @param tutorEsterno il parametro è fissato
     */
    public Tirocinante(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, int oreTotali, int oreLavoro,
            String personaleAsilo, String stato, String matricola,
            String giudizioFinale, String disponibilita, String titoloDiStudi,
            String tutorEsterno) {
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
        this.titoloDiStudi = titoloDiStudi;
        this.tutorEsterno = tutorEsterno;
        this.listaContestazione = null;
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
    public void setPersonaleAsilo(String personaleAsilo) {
        this.personaleAsilo = personaleAsilo;
    }

    /**
     * Metodo che prende il parametro letto dalla classe PersonaleAsilo
     * @return personaleAsilo preso dalla lettura
     */
    public String getPersonaleAsilo() {
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
    public String getMatricola() {
        return matricola;
    }

    /**
     * Metodo che prende il valore matricola
     * @param matricola il parametro inserito
     */
    public void setMatricola(String matricola) {
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
    
    /**
     * Metodo che prende il valore titoloDiStudi
     * @return titoloDiStudi il parametro inserito
     */
    public String getTitoloDiStudi() {
        return titoloDiStudi;
    }

    /**
     * Metodo che prende il valore titoloDiStudi
     * @param titoloDiStudi il parametro inserito
     */
    public void setTitoloDiStudi(String titoloDiStudi) {
        this.titoloDiStudi = titoloDiStudi;
    }
    
    /**
     * Metodo che prende il valore tutorEsterno
     * @return tutorEsterno il parametro inserito
     */
    public String getTutorEsterno() {
        return tutorEsterno;
    }

    /**
     * Metodo che prende il valore tutorEsterno
     * @param tutorEsterno il parametro inserito
     */
    public void setTutorEsterno(String tutorEsterno) {
        this.tutorEsterno = tutorEsterno;
    }
    
    /**
     * Metodo che setta il parametro letto dalla classe List<Contestazione>
     * @param listaContestazione è settato dopo la lettura
     */
    public void setListaContestazione(List<Contestazione> listaContestazione) {
        this.listaContestazione = listaContestazione;
    }

    /**
     * Metodo che prende il parametro letto dalla classe List<Contestazione>
     * @return listaContestazione preso dalla lettura
     */
    public List<Contestazione> getListaContestazione() {
        return listaContestazione;
    }
}
