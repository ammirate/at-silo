package atsilo.storage;

import atsilo.entity.EventPlanner;
import atsilo.entity.Evento;
import java.sql.Date;

public class DBEvento extends DBBeans {
    Tabella tabella;
    
    public DBEvento(){
        tabella= new Tabella("Evento");
        super(tabella);
    }
    
    public Evento ricercaEventoNome(String nome){
        Evento e;
        return e;
    }
    public Evento ricercaEventoData(Date data){
            Evento e;
            return e;
        }
    public EventPlanner ricercaEventPlannerEvento(Evento e){
    EventPlanner ep;
    return ep;
    }

}
      