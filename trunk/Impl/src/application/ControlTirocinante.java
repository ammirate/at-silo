package application;

import atsilo.entity.Feedback;
import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Tirocinante;

import java.sql.Date;

import java.util.List;

public class ControlTirocinante {
    private static final ControlTirocinante c;

    private ControlTirocinante(){
        
    }
    public static ControlTirocinante getInstance(){
        return c;
    }

    public boolean inserisciTirocinante(Tirocinante t){
        return false;
    }
    public boolean modificaTirocinante(Tirocinante t){
        return false;
    }
    public Tirocinante eliminaTirocinante(Tirocinante t){
        return null;
    }
    public List<Tirocinante> ricercaTirocinante (Tirocinante t){
        return null;
    }
    

    public List<Tirocinante> getElencoTirocinanti(){
        return null;
    }

    public List<Tirocinante> getTirocinantePerCf(String cf){
        return null;
    }
    
    public boolean inserisciFeedback (Feedback f){
        return false;
    }
    public Feedback eliminaFeedback(Feedback f){
        return f;
    }
    public List<Feedback> visualizzaFeedback(){
        return null;
    }
    public List<Feedback> getFeedbackPerPersonale (PersonaleAsilo p){
        return null;
    }
    public Feedback getFeedbackperId (String id){
        return null;
    }
    public List<Feedback> ricercaFeedback (Feedback f){
        return null;
        
    }
    public boolean richiediTirocinante (Tirocinante t){
        return false;
    }
    
}