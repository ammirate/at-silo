package atsilo.test.storage;

import atsilo.entity.CampoDomandaQuestionario;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StubCampoDomandaQuestionario {
    
    
    
    CampoDomandaQuestionario c1 = new CampoDomandaQuestionario("check", "dai 22 a 26", "22-26", 1);
    CampoDomandaQuestionario c2 = new CampoDomandaQuestionario("check", "dai 26 ai 30", "26-30", 1);
    CampoDomandaQuestionario c3 = new CampoDomandaQuestionario("check", "dai 31 ai 36", "31-36", 1);   
    CampoDomandaQuestionario c4 = new CampoDomandaQuestionario("check", "uno", "1", 3);
    CampoDomandaQuestionario c5 = new CampoDomandaQuestionario("check", "due", "2", 3);
    CampoDomandaQuestionario c6 = new CampoDomandaQuestionario("check", "pi� di due", "2+", 3);
    
    List<CampoDomandaQuestionario> CAMPI = new ArrayList<CampoDomandaQuestionario>();
    
    public StubCampoDomandaQuestionario() {
        super();
        CAMPI.add(c1);
        CAMPI.add(c2);
        CAMPI.add(c3);
        CAMPI.add(c4);
        CAMPI.add(c5);
        CAMPI.add(c6);
        
    }
    
    
    public List<CampoDomandaQuestionario> ricercaPerTipo(String tipo)
    {
        List<CampoDomandaQuestionario> toReturn = new ArrayList<CampoDomandaQuestionario>();
        
        for(CampoDomandaQuestionario c : CAMPI)
            if(c.getTipo().equals(tipo))
                toReturn.add(c);
        return toReturn;
    } 
    
    /**
     * cerca le domande questionario alle quali il campo appartiene
     * @param c
     * @return lista di stringhe
     */

    
    
    /**
     * cerca le risposte questionario alle quali il campo appartiene
     * @param c
     * @returnlista di stringhe
     */
    public List<String> ricercaRispostaQuestionarioAppartenenza(CampoDomandaQuestionario c){
        List<String> a=null;
        return a;
    }


    /**
     * @param i
     * @return
     */
    public List<CampoDomandaQuestionario> getCampiDomandaQuestionario(int i) {
        List<CampoDomandaQuestionario> toReturn = new ArrayList<CampoDomandaQuestionario>();
        
        for(CampoDomandaQuestionario c : CAMPI)
            if(c.getIdDomandaQuestionario()==i)
                toReturn.add(c);
        return toReturn;
    }
    
    
}
