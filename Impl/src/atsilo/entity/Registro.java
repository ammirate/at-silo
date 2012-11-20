package atsilo.entity;

import java.util.List;



public class Registro {
    /**
     * @attribute
     */
    private int Classe;

    /**
     * @attribute
     */
    private String anno;

    /**
     * @attribute
     */
    int id;

    /**
     * @attribute
     */
    private EducatoreDidattico educatoreDidattico;
    
    private List<Attivita> listaAttivita;

    public Registro() {
    }

    public void setClasse(int Classe) {
        this.Classe = Classe;
    }

    public int getClasse() {
        return Classe;
    }

    public void setAnno(String anno) {
        this.anno = anno;
    }

    public String getAnno() {
        return anno;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setEducatoreDidattico(EducatoreDidattico educatoreDidattico) {
        this.educatoreDidattico = educatoreDidattico;
    }

    public EducatoreDidattico getEducatoreDidattico() {
        return educatoreDidattico;
    }

    public void setListaAttivita(List<Attivita> listaAttivita) {
        this.listaAttivita = listaAttivita;
    }

    public List<Attivita> getListaAttivita() {
        return listaAttivita;
    }
}
