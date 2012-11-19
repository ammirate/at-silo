package application;

import atsilo.entity.*;
import java.sql.Date;

import java.util.List;

public class ControlQuestionario {

    public ControlQuestionario() {
    }
    
    public void inserisciQuestionario(Questionario questionario){}
    
    public Questionario eliminaQuestionario(String id){
        return null;
    }
    
    public void modificaQuestionario(List<DomandaQuestionario> domande){}
    
    public void spostaDataInizio(Date newData){}
    
    public void spostaDataFine(Date newData){}
    
    public void compilaQuestionario(List<RispostaQuestionario> risposte){}
    
    public List<Questionario> getQuestionariCompilati(Genitore genitore){
        return null;
    }
    
    public List<Questionario> getQuestionariDaCompilare(Genitore genitore){
        return null;
    }
    
    public List<Questionario> getQuestionariRinuncia(){
        return null;
    }
    
    public List<String> getStatistische(Questionario questionario){
        return null;
    }
    
    public Questionario ricercaQuestionario(String nome){
        return null;
    }
    
}
