package atsilo.application;

import atsilo.entity.OrarioUtente;

import atsilo.entity.Servizio;

import java.util.List;

//TODO scrivere javadoc per metodi e classi

public class ControlOrario {
    
    private static final ControlOrario co;
    
    private ControlOrario(){
        
    }
    
    public static final ControlOrario getInstance(){
        return co;
    }
    public boolean inserisciOrario(Servizio s, String orarioinizio, String orariofine){
        return false;
        
    }
    public boolean modificaOrario(Servizio s, String orarioinizio, String orariofine){
        return false;
        
    }

    public String ricercaOrario(Servizio s){
        return null;
    }

    
    public boolean inserisciOrarioUtente(OrarioUtente o){
        return false;
        
    }

    public boolean modificaOrarioUtente(OrarioUtente o){
        return false;
        
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
