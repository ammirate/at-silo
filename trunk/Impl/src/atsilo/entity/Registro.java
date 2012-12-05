package atsilo.entity;

import java.sql.Date;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Registro.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class Registro {

    private int classe;
    private Date anno;
    private int id;
    
    /**
     * La variabile educatoreDidattico è nulla c'è bisogno di una lettura della classe EducatoreDidattico
     */
    private EducatoreDidattico educatoreDidattico;
    
    /**
     * La variabile attività è nulla c'è bisogno di una lettura della classe Attività
     */
    private List<Attivita> listaAttivita;

    /**
     * Costruttore vuoto
     */
    public Registro() {
    }

    /**
     * @param classe il paramentro è fissato
     * @param anno il paramentro è fissato
     * @param id il paramentro è fissato
     * @param educatoreDidattico è settato dopo la lettura 
     */
    public Registro(int classe, Date anno, int id,EducatoreDidattico educatoreDidattico) {
        super();
        classe = classe;
        this.anno = anno;
        this.id = id;
        this.educatoreDidattico = educatoreDidattico;
        this.listaAttivita = null;
    }

    /**
     * Metodo che prende il valore classe
     * @param Classe il parametro inserito
     */
    public void setClasse(int Classe) {
        this.classe = Classe;
    }

    /**
     * Metodo che prende il valore classe
     * @return classe il parametro inserito
     */
    public int getClasse() {
        return classe;
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
     * @param educatoreDidattico è settato dopo la lettura
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
