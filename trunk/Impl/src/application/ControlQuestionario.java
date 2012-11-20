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
    
    public boolean modificaQuestionario(List<DomandaQuestionario> domande){
        return false;
    }
    
    public boolean spostaDataInizio(Date newData){
        return false;
    }
    
    public boolean spostaDataFine(Date newData){
        return false;
    }
    
    public boolean compilaQuestionario(List<RispostaQuestionario> risposte){
        return false;
    }
    
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
