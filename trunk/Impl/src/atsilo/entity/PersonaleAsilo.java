package atsilo.entity;

import java.sql.Date;
/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: PersonaleAsilo.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 * REVISION
 * Andrea Micco, 5/12/2012
 *-----------------------------------------------------------------
 */

public class PersonaleAsilo extends Utente implements EventPlanner{
    
    private String categoriaAppartenenza;
    
    /**
     * Costruttore vuoto
     */
    public PersonaleAsilo(){}
    
    /**
     * @param categoriaAppartenenza è settato dopo la lettura 
     */
    public PersonaleAsilo(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            int numeroCivicoResidenza, int capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            int numeroCivicoDomicilio, int capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, String categoriaAppartenenza) {
        super(dataNascita, nome, cognome,
                codiceFiscale, email, comuneNascita,
              telefono, cittadinanza, indirizzoResidenza,
                numeroCivicoResidenza, capResidenza, comuneResidenza,
                provinciaResidenza, indirizzoDomicilio,
               numeroCivicoDomicilio, capDomicilio,comuneDomicilio,
               provinciaDomicilio);
        this.categoriaAppartenenza = categoriaAppartenenza;
    }

    /**
     * Metodo che setta il parametro categoriaAppartenenza
     * @param categoriaAppartenenza il parametro fissato
     */
    public void setCategoriaAppartenenza(String categoriaAppartenenza) {
        this.categoriaAppartenenza = categoriaAppartenenza;
    }

    /**
     * Metodo che prende il parametro CategoriaAppartenenz
     * @return CategoriaAppartenenz il parametro inserito
     */
    public String getCategoriaAppartenenza() {
        return categoriaAppartenenza;
    }
}
