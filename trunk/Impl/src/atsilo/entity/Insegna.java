/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Insegna.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Alfonso, 12/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.entity;

/**
 * Classe Insegna entity per la tabella "Insegna"
 * <Descrizione classe>
 * 
 * @author Alfonso
 * 
 */
public class Insegna {
    
    private EducatoreDidattico educatoreDidattico;
    private Classe classe;
    
    /**
     * 
     */
    public Insegna() {
        // TODO Scheletro di costruttore autogenerato
    }
    
    public Insegna(EducatoreDidattico educatoreDidattico, Classe classe) {
        super();
        this.educatoreDidattico = educatoreDidattico;
        this.classe = classe;
    }

    public EducatoreDidattico getEducatoreDidattico() {
        return educatoreDidattico;
    }

    public void setEducatoreDidattico(EducatoreDidattico educatoreDidattico) {
        this.educatoreDidattico = educatoreDidattico;
    }

    public Classe getClasse() {
        return classe;
    }

    public void setClasse(Classe classe) {
        this.classe = classe;
    }
    
    
    //Logger
    /*
     * private static final java.util.Logger LOG
     *         = Logger.getLogger(Insegna.class.getName());
     */
    
    //Variabili di istanza
    
    
    //Costruttori
    
    
    //Metodi
}
