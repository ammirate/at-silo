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
 *-----------------------------------------------------------------
 */

public class EducatoreDidattico extends Utente implements EventPlanner{

    private String TitoloDiStudio;
    
    /**
     * La variabile classi è nulla c'è bisogno di una lettura della classe "classe"
     */
    private List<Classe> classi;

    /**
     * Costruttore vuoto
     */
    public EducatoreDidattico() {
    }
    
    /**
     * @param titoloDiStudio il paramentro è fissato
     * @param classi è settato dopo la lettura
     */
    public EducatoreDidattico(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String residenza, String titoloDiStudio, List<Classe> classi) {
        super(dataNascita, nome, cognome, codiceFiscale, email, comuneNascita, telefono, residenza);
        TitoloDiStudio = titoloDiStudio;
        this.classi = classi;
    }

    /**
     * Metodo che setta il campo TitoloDiStudio
     * @param TitoloDiStudio il parametro fissato
     */
    public void setTitoloDiStudio(String TitoloDiStudio) {
        this.TitoloDiStudio = TitoloDiStudio;
    }

    /**
     * Metodo che prende il campo TitoloDiStudio
     * @return TitoloDiStudio il paramentro inserito
     */
    public String getTitoloDiStudio() {
        return TitoloDiStudio;
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
