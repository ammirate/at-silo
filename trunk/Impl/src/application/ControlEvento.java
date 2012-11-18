package application;

import atsilo.entity.Evento;
import atsilo.entity.PersonaleAsilo;

import atsilo.entity.Registro;

import java.sql.Date;

import java.util.List;

public class ControlEvento {
        
    public ControlEvento() {
    }
    
    public void inserisciEvento(Evento evento){}
    
    public void modificaEvento(Evento vecchioEvento, Evento nuovoEvento){}
    
    public Evento eliminaEvento(Evento evento){
        return null;
    }

    public void spostaEvento(Evento evento, Date newData){}
    
    public List<Evento> getEventiPerPersonale(PersonaleAsilo pers){
        return null;
    }
    
    public List<Evento> getEventiInData(Date data){
        return null;
    }
}
