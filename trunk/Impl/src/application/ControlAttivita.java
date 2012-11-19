package application;

import atsilo.entity.*;

import atsilo.entity.Registro;

import java.util.List;

public class ControlAttivita {
        
    public ControlAttivita() {
    }
    
    public void inserisciAttivita(Registro registro, Attivita attivita){}
    
    public void modificaAttivita(Registro registro, String attivita, Attivita nuovaAttivita){}
    
    public Attivita eliminaAttivita(Registro registro, String titolo){
        return null;
    }
    
    public Attivita ricercaAttivitaPerTitolo(Registro registro, String titolo){
        return null;
    }
    
    public List<Attivita> ricercaAttivitaPerCategoria(Registro registro, String categoria){
        return null;
    }
    
    
    
}
