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
     */
    public Tirocinante(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String residenza, int oreTotali, int oreLavoro,
            PersonaleAsilo personaleAsilo) {
        super(dataNascita, nome, cognome, codiceFiscale, email, comuneNascita, telefono, residenza);
        this.oreTotali = oreTotali;
        this.oreLavoro = oreLavoro;
        this.personaleAsilo = personaleAsilo;
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
}
