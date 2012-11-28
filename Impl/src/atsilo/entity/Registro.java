package atsilo.entity;

import java.sql.Date;
import java.util.List;

public class Registro {

    private int Classe;
    private Date anno;
    private int id;
    
    /**
     * La variabile educatoreDidattico � nulla c'� bisogno di una lettura della classe EducatoreDidattico
     */
    private EducatoreDidattico educatoreDidattico;
    
    /**
     * La variabile attivit� � nulla c'� bisogno di una lettura della classe Attivit�
     */
    private List<Attivita> listaAttivita;

    /**
     * Costruttore vuoto
     */
    public Registro() {
    }

    /**
     * @param classe il paramentro � fissato
     * @param anno il paramentro � fissato
     * @param id il paramentro � fissato
     * @param educatoreDidattico � settato dopo la lettura 
     * @param listaAttivita � settato dopo la lettura 
     */
    public Registro(int classe, Date anno, int id,
            EducatoreDidattico educatoreDidattico, List<Attivita> listaAttivita) {
        super();
        Classe = classe;
        this.anno = anno;
        this.id = id;
        this.educatoreDidattico = educatoreDidattico;
        this.listaAttivita = listaAttivita;
    }

    /**
     * Metodo che prende il valore classe
     * @param Classe il parametro inserito
     */
    public void setClasse(int Classe) {
        this.Classe = Classe;
    }

    /**
     * Metodo che prende il valore classe
     * @return classe il parametro inserito
     */
    public int getClasse() {
        return Classe;
    }
    
    /**
     * Metodo che prende il campo anno
     * @param date il parametro inserito
     */
    public void setAnno(Date date) {
        this.anno = date;
    }

    /**
     * Metodo che prende il campo anno
     * @return anno il parametro inserito
     */
    public Date getAnno() {
        return anno;
    }

    /**
     * Metodo che prende il valore Id
     * @param id il parametro inserito
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Metodo che prende il valore Id
     * @return id il parametro inserito
     */
    public int getId() {
        return id;
    }

    /**
     * Metodo che setta il parametro letto dalla classe EducatoreDidattico
     * @param educatoreDidattico � settato dopo la lettura
     */
    public void setEducatoreDidattico(EducatoreDidattico educatoreDidattico) {
        this.educatoreDidattico = educatoreDidattico;
    }

    /**
     * Metodo che prende il parametro letto dalla classe EducatoreDidattico
     * @return educatoreDidattico preso dalla lettura
     */
    public EducatoreDidattico getEducatoreDidattico() {
        return educatoreDidattico;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Attivita
     * @param listaAttivita � settato dopo la lettura
     */
    public void setListaAttivita(List<Attivita> listaAttivita) {
        this.listaAttivita = listaAttivita;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Attivita
     * @return listaAttivita preso dalla lettura
     */
    public List<Attivita> getListaAttivita() {
        return listaAttivita;
    }
}
