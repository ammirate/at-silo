package atsilo.entity;
import java.util.List;

public class Classe {
    
    /**
     * @attribute id di tipo stringa
     */
    private String id;
   
    /** 
     * La variabile educatori � settatta a Null quindi c'� bisogno di una lettura
     */
    private List<EducatoreDidattico> educatori;
    
    /**
     * La variabile eventi avr� i valore della lista Evento
     * La variabile eventi � nulla c'� bisogno di una lettura della classe Evento
     */
    private List<Evento> eventi;

    /**
     * Costruttore vuoto
     */
    public Classe() {
    }

    /**
     * @param id il paramentro � fissato
     * @param educatori � settato dopo la lettura 
     * @param eventi � settato dopo la lettura
     */
    public Classe(String id, List<EducatoreDidattico> educatori,
            List<Evento> eventi) {
        super();
        this.id = id;
        this.educatori = educatori;
        this.eventi = eventi;
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
     * @param educatori � settato dopo la lettura
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
     * @param eventi � settato dopo la lettura
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
