/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: CompilaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * fabio, 01/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.entity;

/**
 * Classe CompilaQuestionario
 * <>
 * 
 * @author fabio
 * 
 */
public class CompilaQuestionario implements Beans {
    
    private int questionario ;
    private String genitore;
    
    /**
     * Costruttore vuoto
     */
    public CompilaQuestionario() {
    }
    
    
    /**
     * Costruttore con parametri
     * @param questionario il parametro è settato
     * @param genitore il parametro è settato
     */
    public CompilaQuestionario(int questionario,String genitore){
        this.questionario=questionario;
        this.genitore=genitore;        
    }

    /**
     * Metodo che setta il campo questionario
     * @param questionario il parametro fissato
     */
    public void setQuestionario(int questionario){
        this.questionario=questionario;
    }

    /**
     * Metodo che setta il campo genitore
     * @param genitore il parametro fissato
     */
    public void setGenitore(String genitore){
        this.genitore=genitore;
    }
    /**
     * Metodo che prende il campo questionario
     * @return questionario parametro preso dalla lettura
     */
    public int getQuestionario(){
        return questionario;
    }
    /**
     * Metodo che prende il campo genitore
     * @return genitore parametro preso dalla lettura
     */
    public String getGenitore(){
        return genitore;
    }
}
