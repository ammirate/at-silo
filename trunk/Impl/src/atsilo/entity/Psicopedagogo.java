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
 * REVISION
 * Andrea Micco, 5/12/2012
 *-----------------------------------------------------------------
 */

public class Psicopedagogo extends Utente implements EventPlanner{
    
    private int numeroClassi;
    
    /**
     * Costruttore vuoto
     */
    public Psicopedagogo(){       
    }
    
    /**
     * @param numeroClassi il paramentro è fissato
     */
    public Psicopedagogo(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            int numeroCivicoResidenza, int capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            int numeroCivicoDomicilio, int capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, int numeroClassi) {
        super(dataNascita, nome, cognome,
                codiceFiscale, email, comuneNascita,
              telefono, cittadinanza, indirizzoResidenza,
                numeroCivicoResidenza, capResidenza, comuneResidenza,
                provinciaResidenza, indirizzoDomicilio,
               numeroCivicoDomicilio, capDomicilio,comuneDomicilio,
               provinciaDomicilio);
        this.numeroClassi = numeroClassi;
    }

    /**
     * Metodo che setta il valroe numero classi
     * @param numeroClassi il parametro fissato
     */
    public void setNumeroClassi(int numeroClassi) {
        this.numeroClassi = numeroClassi;
    }

    /**
     * Metodo che prende il valore numero classi
     * @return numeroClassi il parametro inserito
     */
    public int getNumeroClassi() {
        return numeroClassi;
    }
}
