package application;

import atsilo.entity.*;
import java.util.List;
import java.sql.Date;

public class ControlRegistro {
    
    private static final ControlRegistro control;
    
    private ControlRegistro() {
        
    }
    
    public boolean inserisciRegistro(Registro registro){
        return false;
    }
    
    public Registro getRegistro(Classe classe){
        return null;
    }
    
    public List<Bambino> getBambini(Classe classe){
        return null;
    }
    
    public List<Attivita> getAttivita(Date data){
        return null;
    }
    
    public ControlRegistro getIstance(){
        return null;
    }
    
    
}
