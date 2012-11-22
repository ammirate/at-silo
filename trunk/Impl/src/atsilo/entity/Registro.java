package atsilo.entity;

import java.util.List;

public class Registro {

    private int Classe;
    private String anno;
    private int id;
    
    /**
     * La variabile educatoreDidattico è nulla c'è bisogno di una lettura della classe EducatoreDidattico
     */
    private EducatoreDidattico educatoreDidattico;
    
    /**
     * La variabile attività è nulla c'è bisogno di una lettura della classe Attività
     */
    private List<Attivita> listaAttivita;

    public Registro() {
    }

    /**
     * Metodo che prende il valore classe
     * @param classe il parametro inserito
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
     * @param anno il parametro inserito
     */
    public void setAnno(String anno) {
        this.anno = anno;
    }

    /**
     * Metodo che prende il campo anno
     * @return anno il parametro inserito
     */
    public String getAnno() {
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
     * @param educatoredidattico è settato dopo la lettura
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
     * @param listaAttivita è settato dopo la lettura
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
