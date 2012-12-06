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
 
    public StatisticheQuestionario(Questionario questionario)
    {
       this.questionario= questionario;
       risposte = new HashMap<String,Map<String, Integer>>();
    }
    
    public void setRisposte (HashMap<String,Map<String, Integer>> risposte)
    {
        this.risposte=risposte;
    }
    
    public HashMap<String,Map<String, Integer>> getRisposte()
    {
        return risposte;
    }
    
    public Integer getPercentualiFromDomanda(String domanda, String campo_risposte)
    {
      Map<String, Integer> m=risposte.get(domanda);
      return m.get(campo_risposte);
      
    }
    
    
    private Questionario questionario;
    private HashMap<String,Map<String, Integer>> risposte;
}
