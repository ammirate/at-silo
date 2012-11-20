package application;

import atsilo.entity.*;
import java.util.List;

public class ControlDomandaQuestionario {
    
    public ControlDomandaQuestionario() {
    }
    
    public boolean inserisciDomanda(String idQuestionario, DomandaQuestionario domanda){
        return false;
    }

    public boolean modificaDomanda(String idQuestionario,String idDomanda, DomandaQuestionario newDomanda){
        return false;
   }
    
    public DomandaQuestionario eliminaDomanda(String idQuestionario, String idDomanda){
        return null;
    }

    public boolean inserisciCampi(String idQuestionario, String idDomanda, List<CampoDomandaQuestionario> campi){}
    
    public List<CampoDomandaQuestionario> getCampiDomanda(String idQuestionario,String idDomanda){
        return null;
    }
    
    public boolean setCampiDomanda(String idQuestionario,String idDomanda, List<CampoDomandaQuestionario> ){}
    
}
