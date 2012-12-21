/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: StatisticheQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Lindig, 05/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Classe StatisticheQuestionario
 * <Descrizione classe>
 * 
 * @author Antonio Cesaano
 * 
 */
public class StatisticheQuestionario {
 
    public StatisticheQuestionario(){
        this.questionario= new Questionario();
        risposte = new HashMap<Integer,Map<Integer, Integer>>();
        this.number_comp=0;
     }
    /**
     * Costruttore
     * @param questionario
     */
    public StatisticheQuestionario(Questionario questionario){
       this.questionario= questionario;
       risposte = new HashMap<Integer,Map<Integer, Integer>>();
       this.number_comp=0;
    }
    /**
     * @return questionario
     */
    public Questionario getQuestionario() {
        return questionario;
    }
    /**
     * @param questionario nuovo questionario
     */
    public void setQuestionario(Questionario questionario) {
        this.questionario = questionario;
    }
    /**
     * @return number_comp
     */
    public int getNumber_comp() {
        return number_comp;
    }
    /**
     * @param number_comp nuovo number_comp
     */
    public void setNumber_comp(int number_comp) {
        this.number_comp = number_comp;
    }
 
    /**
     * 
     * @param questionario
     * @param number_comp
     */
    
    public StatisticheQuestionario(Questionario questionario, int number_comp){
        this.questionario= questionario;
        risposte = new HashMap<Integer,Map<Integer, Integer>>();
        this.number_comp=number_comp;
     }
    
    public StatisticheQuestionario(Questionario questionario, int number_comp, HashMap<Integer,Map<Integer, Integer>> risposte){
        this.questionario= questionario;
        this.risposte = new HashMap<Integer,Map<Integer, Integer>>();
        this.number_comp=number_comp;
     }
    
    /**
     * 
     * @param risposte
     */
    
    public void setRisposte (HashMap<Integer,Map<Integer, Integer>> risposte){
        this.risposte=risposte;
    }
    
    
    /**
     * 
     * 
     * @return
     */
    
    
    public HashMap<Integer,Map<Integer, Integer>> getRisposte(){
        return risposte;
    }
    
    public int getNumeroComp ()
    {
        return number_comp;
    }
    /**
     * return the the number of people that response id_campo for the id_domanda
     * null if the id_domanda or id_campo does not exist
     * @param domanda
     * @param campo_risposte
     * @return
     */
    
    public Integer getPercentualiFromCampo(Integer id_domanda, Integer id_campo){
        //System.out.println("*" + id_domanda + "*" + id_campo + "*");
      Map<Integer, Integer> m=risposte.get(id_domanda);
      if(m!=null)
          {
              if(m.get(id_campo)!=null)
              {return m.get(id_campo);}
              else
              {return null;}
          }
      else
          {return null;}
    }
    
    private Questionario questionario;
    private HashMap<Integer,Map<Integer, Integer>> risposte;
    private int number_comp;
}
