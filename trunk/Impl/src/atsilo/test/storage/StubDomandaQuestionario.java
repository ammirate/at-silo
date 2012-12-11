package atsilo.test.storage;

import java.util.ArrayList;
import java.util.List;

import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.DomandaQuestionario;

public class StubDomandaQuestionario {
    
    
    DomandaQuestionario d1 = new DomandaQuestionario(1,1,"quanti anni hai?",null);
    DomandaQuestionario d2 = new DomandaQuestionario(2,1,"dove abiti?",null);
    DomandaQuestionario d3 = new DomandaQuestionario(3,1,"quanti figli hai?",null);

    CampoDomandaQuestionario c1 = new CampoDomandaQuestionario("check", "dai 22 a 26", "22-26", 1);
    CampoDomandaQuestionario c2 = new CampoDomandaQuestionario("check", "dai 26 ai 30", "26-30", 1);
    CampoDomandaQuestionario c3 = new CampoDomandaQuestionario("check", "dai 31 ai 36", "31-36", 1);
    
    CampoDomandaQuestionario c4 = new CampoDomandaQuestionario("check", "uno", "1", 3);
    CampoDomandaQuestionario c5 = new CampoDomandaQuestionario("check", "due", "2", 3);
    CampoDomandaQuestionario c6 = new CampoDomandaQuestionario("check", "pi� di due", "2+", 3);
    List<DomandaQuestionario> DOMANDE;
   
    public StubDomandaQuestionario() {
        
        //assegno i campi alle domande
        List<CampoDomandaQuestionario> domanda1 = new ArrayList<CampoDomandaQuestionario>();
        domanda1.add(c1);
        domanda1.add(c2);
        domanda1.add(c3);
        
        List<CampoDomandaQuestionario> domanda3 = new ArrayList<CampoDomandaQuestionario>();
        domanda3.add(c4);
        domanda3.add(c5);
        domanda3.add(c6);
        
        //lista delle domande
        DOMANDE = new ArrayList<DomandaQuestionario>();
        DOMANDE.add(d1);
        DOMANDE.add(d2);
        DOMANDE.add(d3);
        
    }
    
    public DomandaQuestionario ricercaDomandaQuestionarioPerId(int id){
        for(DomandaQuestionario d : DOMANDE)
            if(d.getIdQuestionario() == id)
                return d;
            
        return null;
    }

    /**
     * @param idQuestionario
     * @return
     */
    public List<DomandaQuestionario> getDomandeQuestionario(int idQuestionario) {
        List<DomandaQuestionario> toReturn = new ArrayList<DomandaQuestionario>();
        toReturn.add(d1);
        toReturn.add(d2);
        toReturn.add(d3);
        
        return toReturn;
    }

}
