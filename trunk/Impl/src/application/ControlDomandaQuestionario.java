package application;

import atsilo.entity.*;
import java.util.List;

public class ControlDomandaQuestionario {
    
    public ControlDomandaQuestionario() {
    }
    
    public void inserisciDomanda(DomandaQuestionario domanda){}

    public void modificaDomanda(String idDomanda, DomandaQuestionario newDomanda){}
    
    public DomandaQuestionario eliminaDomanda(String idDomanda){
        return null;
    }

    public void inserisciCampi(String idDomanda, List<CampoDomandaQuestionario> campi){}
    
    public List<CampoDomandaQuestionario> getCampi(String idDomanda){
        return null;
    }
}
