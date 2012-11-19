package application;

import atsilo.entity.*;
import java.util.List;

public class ControlDomandaQuestionario {
    
    public ControlDomandaQuestionario() {
    }
    
    public void inserisciDomanda(String idQuestionario, DomandaQuestionario domanda){}

    public void modificaDomanda(String idQuestionario,String idDomanda, DomandaQuestionario newDomanda){}
    
    public DomandaQuestionario eliminaDomanda(String idQuestionario, String idDomanda){
        return null;
    }

    public void inserisciCampi(String idQuestionario, String idDomanda, List<CampoDomandaQuestionario> campi){}
    
    public List<CampoDomandaQuestionario> getCampiDomanda(String idQuestionario,String idDomanda){
        return null;
    }
    
    public void setCampiDomanda(String idQuestionario,String idDomanda, List<CampoDomandaQuestionario> ){}
    
}
