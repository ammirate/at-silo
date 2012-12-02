package test.storage;

import atsilo.entity.CampoDomandaQuestionario;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StubCampoDomandaQuestionario {
    public StubCampoDomandaQuestionario() {
        super();
    }
    
    
    public List<CampoDomandaQuestionario> ricercaPerTipo(String tipo)
    {
        List<CampoDomandaQuestionario> a=null;
        return a;
    } 
    
    /**
     * cerca le domande questionario alle quali il campo appartiene
     * @param c
     * @return lista di stringhe
     */
    public List<String> ricercaDomandaQuestionarioAppartenenza(CampoDomandaQuestionario c)
    {

        List<String> a=null;
        return a;
    }
    
    
    /**
     * cerca le risposte questionario alle quali il campo appartiene
     * @param c
     * @returnlista di stringhe
     */
    public List<String> ricercaRispostaQuestionarioAppartenenza(CampoDomandaQuestionario c){
        List<String> a=null;
        return a;
    }
    
    
}
