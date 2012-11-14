package atsilo.entity;
import java.util.List;
public class EducatoreDidattico extends Utente implements EventPlanner{
    /**
     * @attribute
     */
    private String TitoloDiStudio;
    private List<Classe> classi;


    /**
     * @attribute
     */
    public void setTitoloDiStudio(String TitoloStudio) {
        this.TitoloDiStudio = TitoloDiStudio;
    }

    public String getTitoloDiStudio() {
        return TitoloDiStudio;
    }
    
    public List<Classe> getClassi(){
        return classi;
    }
}
