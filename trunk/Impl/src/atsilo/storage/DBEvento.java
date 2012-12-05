package atsilo.storage;

import atsilo.entity.EventPlanner;
import atsilo.entity.Evento;
import atsilo.entity.PersonaleAsilo;

import java.sql.Date;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBEvento.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBEvento extends DBBeans {
    
    public DBEvento(Database db){
        super("Evento",db);
    }
    
    public boolean inserisciEventoNelDatabase(Evento e){
        return false;
    }
    
    public boolean inserisciCCEvento(Evento e, List<String> cc){
        return false;
    }
    
    public Evento rimuoviEvento(Evento e){
        return e;
    }
    
    public boolean setData(Evento e, Date data){
        return false;
    }
    
    public Evento ricercaEventoNome(String nome){
        Evento e;
        return e;
    }
    public List<Evento> ricercaEventoData(Date data){
        Evento e;
        return e;
    }
    public EventPlanner ricercaEventPlannerEvento(Evento e){
        EventPlanner ep;
        return ep;
    }
    
    public List<Evento> ricercaEventoPerPersonale(PersonaleAsilo p){
        return null;
    }
    
}
