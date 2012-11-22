package atsilo.entity;

import java.util.List;

public class EducatoreDidattico extends Utente implements EventPlanner{

    private String TitoloDiStudio;
    
    /**
     * La variabile classi è nulla c'è bisogno di una lettura della classe "classe"
     */
    private List<Classe> classi;

    /**
     * Metodo che setta il campo TitoloDiStudio
     * @param TitoloDiStudio il parametro fissato
     */
    public void setTitoloDiStudio(String TitoloStudio) {
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
     * @param classe il parametro fissato
     */
    public void setClasse(int Classi) {
        this.Classi = Classi;
}
