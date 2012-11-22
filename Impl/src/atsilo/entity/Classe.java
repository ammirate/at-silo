package atsilo.entity;
import java.util.List;
import atsilo.entity.Bambino;

public class Classe {
    
    /**
     * @attribute id di tipo stringa
     */
    private String id;
   
    /**
     * La variabile educatori è settatta a Null quindi c'è bisogno di una lettura della classe EducatoreDitattico e prendere il parametro dalla lista 
     */
    private List<EducatoreDidattico> educatori;
    
    /**
     * La variabile eventi è nulla c'è bisogno di una lettura della classe Evento
     */
    private List<Evento> eventi;

    public Classe() {
    }

    /**
     * Metodo che setta il campo Id
     * @param id il parametro fissato
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * Metodo che prende il campo Id
     * @return Id il paramentro inserito
     */
    public String getId() {
        return id;
    }

    /**
     * Metodo che setta il parametro letto dalla classe EducatoreDidattico
     * @param educatori è settato dopo la lettura
     */
    public void setEducatori(List<EducatoreDidattico> educatori) {
        this.educatori = educatori;
    }

    /**
     * Metodo che prende il parametro letto dalla classe EducatoreDidattico
     * @return educatori parametro preso dalla lettura
     */
    public List<EducatoreDidattico> getEducatori() {
        return educatori;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Evento
     * @param eventi è settato dopo la lettura
     */
    public void setEventi(List<Evento> eventi) {
        this.eventi = eventi;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Evento
     * @return eventi parametro preso dalla lettura
     */
    public List<Evento> getEventi() {
        return eventi;
    }
}
