package atsilo.entity;
import java.util.List;


public class Classe {
    
    private String id;
    private List<EducatoreDidattico> educatori;
    private List<Evento> eventi;

    Classe() {
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }


    public void setEducatori(List<EducatoreDidattico> educatori) {
        this.educatori = educatori;
    }

    public List<EducatoreDidattico> getEducatori() {
        return educatori;
    }

    public void setEventi(List<Evento> eventi) {
        this.eventi = eventi;
    }

    public List<Evento> getEventi() {
        return eventi;
    }
}
