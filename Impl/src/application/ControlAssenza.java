package application;

import atsilo.entity.*;

import atsilo.entity.Registro;

import java.sql.Date;

import java.util.List;

public class ControlAssenza {
    
    private static final ControlAssenza control;
    
    private ControlAssenza() {}

    public boolean inserisciAssenza(Registro registro, Assenza assenza){
        return false;
    }
    
    public Assenza eliminaAssenza(Registro registro, Assenza assenza){
        return null;
    }
            
    public List<Assenza> getAssenzeGiorno(Registro registro, Date data){
        return null;  
    }
    
    public List<Assenza> getAssenzeBambino(Bambino bambino){
        return null;
    }
    
    public ControlAssenza staticgetIstance(){
        return null;
    }
}
