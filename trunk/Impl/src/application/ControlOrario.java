package application;

import atsilo.entity.OrarioUtente;

import atsilo.entity.Servizio;

import java.util.List;

public class ControlOrario {
    
    private static final ControlOrario co;
    
    private ControlOrario(){
        
    }
    
    public static final ControlOrario getInstance(){
        return co;
    }
    public void inserisciOrario(Servizio s, String orarioinizio, String orariofine){
        
    }
    public void modificaOrario(Servizio s, String orarioinizio, String orariofine){
        
    }

    public String ricercaOrario(Servizio s){
        return null;
    }

    
    public void inserisciOrarioUtente(OrarioUtente o){
        
    }

    public void modificaOrarioUtente(OrarioUtente o){
        
    }

    public OrarioUtente eliminaOrarioUtente(int id){
        return null;
    }
    public List<OrarioUtente> ricercaOrarioUtente(OrarioUtente o){
            return null;
        }
    public List<OrarioUtente> getElencoOrarioUtente(){
            return null;
        }
    public OrarioUtente getOrarioUtentePerId(String id){
        return null;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
