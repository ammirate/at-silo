package application;

import atsilo.entity.Evento;
import atsilo.entity.PersonaleAsilo;

import atsilo.entity.Registro;

import java.sql.Date;

import java.util.List;

public class ControlEvento {
      
    private static final ControlEvento control;
       
    private ControlEvento() {
    }
    
    public boolean inserisciEvento(Registro registro, Evento evento){
            return false;
    }
    
    public boolean modificaEvento(Registro registro, Evento vecchioEvento, Evento nuovoEvento){
        return false;}
    
    public Evento eliminaEvento(Registro registro, Evento evento){
        return null;
    }

    public boolean spostaEvento(Registro registro, Evento evento, Date newData){
        return false;
    }
    
    public List<Evento> getEventiPerPersonale(PersonaleAsilo pers){
        return null;
    }
    
    public List<Evento> getEventiInData(Registro registro, Date data){
        return null;
    }
    
    public ControlEvento getIstance(){
        return null;
    }
    
}
