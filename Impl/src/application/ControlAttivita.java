package application;

import atsilo.entity.*;

import atsilo.entity.Registro;

import java.util.List;

public class ControlAttivita {
        
    private final static ControlAttivita control;
    
    private ControlAttivita() {
    }
    
    public boolean inserisciAttivita(Registro registro, Attivita attivita){
        return false;
    }
    
    public boolean modificaAttivita(Registro registro, String attivita, Attivita nuovaAttivita){
        return false;
    }
    
    public Attivita eliminaAttivita(Registro registro, String titolo){
        return null;
    }
    
    public Attivita ricercaAttivitaPerTitolo(Registro registro, String titolo){
        return null;
    }
    
    public List<Attivita> ricercaAttivitaPerCategoria(Registro registro, String categoria){
        return null;
    }
    
    public ControlAttivita getIstance(){
        return null;
    }
    
}
