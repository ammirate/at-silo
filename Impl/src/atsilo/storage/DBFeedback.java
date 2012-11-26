package atsilo.storage;

import atsilo.entity.Feedback;
import atsilo.entity.Genitore;

import atsilo.entity.PersonaleAsilo;

import atsilo.entity.Tirocinante;

import java.util.List;

public class DBFeedback extends DBBeans {
    
    public DBFeedback(Database db){
        super("Feedback",db);
    }
    
        public List<Feedback> ricercaFeedbackperImpiegato(PersonaleAsilo impiegato){
            List<Feedback> feedback;
            return feedback;
        }
        public List<Feedback> ricercaFeedbackperTirocinante(Tirocinante tirocinante){
            List<Feedback> feedback;
            return feedback;
        }
        public List<Feedback> ricercaFeedbackPerId(Integer Id){
            List<Feedback> feedback;
            return feedback;
        
        }
}