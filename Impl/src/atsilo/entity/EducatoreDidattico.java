package atsilo.entity;

import java.sql.Date;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: EducatoreDidattico.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Alfonso Piscitelli, 14/11/2012 (non responsabile)
 * REVISION
 * Andrea Micco, 6/12/2012
 *-----------------------------------------------------------------
 */

public class EducatoreDidattico extends Utente implements EventPlanner{

    private String titoloDiStudi;
    
    /**
     * La variabile classi � nulla c'� bisogno di una lettura della classe "classe"
     */
    private List<Classe> classi;

    /**
     * Costruttore vuoto
     */
    public EducatoreDidattico() {
    }
    
    /**
     * @param titoloDiStudio il paramentro � fissato
     * @param classi � settato dopo la lettura
     */
    public EducatoreDidattico(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, List<Classe> classi, String titoloDiStudi) {
        super(dataNascita, nome, cognome, codiceFiscale, email, comuneNascita,
               telefono, cittadinanza, indirizzoResidenza,
              numeroCivicoResidenza, capResidenza, comuneResidenza,
                provinciaResidenza, indirizzoDomicilio,
                numeroCivicoDomicilio, capDomicilio, comuneDomicilio,
                provinciaDomicilio);
        this.titoloDiStudi = titoloDiStudi;
        this.classi = classi;
    }

    /**
     * Metodo che setta il campo TitoloDiStudio
     * @param titoloDiStudi il parametro fissato
     */
    public void setTitoloDiStudi(String titoloDiStudi) {
        this.titoloDiStudi = titoloDiStudi;
    }

    /**
     * Metodo che prende il campo TitoloDiStudio
     * @return TitoloDiStudi il paramentro inserito
     */
    public String getTitoloDiStudi() {
        return titoloDiStudi;
    }
    
    /**
     * Metodo che prende il valore Classi
     * @return classi il parametro inserito
     */
    public List<Classe> getClassi(){
        return classi;
    }
    
    /**
     * Metodo che setta il valore Classe
     * @param classi il parametro fissato
     */
    public void setClasse(List<Classe> classi) {
        this.classi = classi;
    }
}
