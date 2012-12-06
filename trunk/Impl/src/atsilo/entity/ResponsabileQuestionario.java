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
 * Andrea Micco, 5/12/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class ResponsabileQuestionario extends Utente{
    
    /**
     * Costruttore vuoto
     */
    
    public ResponsabileQuestionario() {
    }
    
    /**
     *  
     */
    public ResponsabileQuestionario(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio) {
        super(dataNascita, nome, cognome,
                codiceFiscale, email, comuneNascita,
              telefono, cittadinanza, indirizzoResidenza,
                numeroCivicoResidenza, capResidenza, comuneResidenza,
                provinciaResidenza, indirizzoDomicilio,
               numeroCivicoDomicilio, capDomicilio,comuneDomicilio,
               provinciaDomicilio);

    }
    
}
