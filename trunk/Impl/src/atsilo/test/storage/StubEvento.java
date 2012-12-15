/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: StubEvento.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio, 27/nov/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.storage;

import java.sql.Date;
import java.util.List;

import atsilo.entity.EducatoreDidattico;
import atsilo.entity.EventPlanner;
import atsilo.entity.Evento;
import atsilo.entity.PersonaleAsilo;
import atsilo.storage.Database;

/**
 * Classe StubEvento
 * <Descrizione classe>
 * 
 * @author Antonio
 * 
 */
public class StubEvento {
    
    private Evento e;
    
    public StubEvento(Database db){
        e = new Evento();
    }
    
    public boolean inserisciEventoNelDatabase(Evento e){
        return false;
    }
    
    public Evento rimuoviEvento(Evento e){
        return e;
    }
    
    public boolean setData(Evento e, Date data){
        return false;
    }
    
    public boolean inserisciCCEvento(Evento e, List<String> cc){
        return false;
    }
    
    public Evento ricercaEventoNome(String nome){
        return e;
    }
    public List<Evento> ricercaEventoData(Date data){
        return null;
    }
    public EventPlanner ricercaEventPlannerEvento(Evento e){
        EventPlanner ep = new EducatoreDidattico();
        return ep;
    }
 
    /**
     * @param organizzatore
     * @return
     */
    public List<Evento> ricercaEventoOrganizzatore(EventPlanner organizzatore)
    {
        
        return null;
    }
}
