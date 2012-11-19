package application;

import atsilo.entity.Evento;
import atsilo.entity.PersonaleAsilo;

import atsilo.entity.Registro;

import java.sql.Date;

import java.util.List;

public class ControlEvento {
        
    public ControlEvento() {
    }
    
    public void inserisciEvento(Registro registro, Evento evento){}
    
    public void modificaEvento(Registro registro, Evento vecchioEvento, Evento nuovoEvento){}
    
    public Evento eliminaEvento(Registro registro, Evento evento){
        return null;
    }

    public void spostaEvento(Registro registro, Evento evento, Date newData){}
    
    public List<Evento> getEventiPerPersonale(PersonaleAsilo pers){
        return null;
    }
    
    public List<Evento> getEventiInData(Registro registro, Date data){
        return null;
    }
}
