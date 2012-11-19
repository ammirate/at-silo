package application;

import atsilo.entity.Feedback;
import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Tirocinante;

import java.sql.Date;

import java.util.List;

public class ControlTirocinanti {
    private static final ControlTirocinanti c;

    private ControlTirocinanti(){
        
    }
    private static ControlTirocinanti getInstance(){
        return c;
    }

    public void inserisciTirocinante(Tirocinante t){
        
    }
    public void modificaTirocinante(Tirocinante t){
        
    }
    public Tirocinante eliminaTirocinante(Tirocinante t){
        return null;
    }

    public List<Tirocinante> getElencoTirocinanti(){
        return null;
    }
    public List<Tirocinante> getTirocinante(Tirocinante t){
        return null;
    }
    public List<Tirocinante> getTirocinantePerCF(String cf){
        return null;
    }
    
    public void inserisciFeedback (Feedback f){
        
    }
    public Feedback eliminaFeedback(Feedback f){
        return f;
    }

}