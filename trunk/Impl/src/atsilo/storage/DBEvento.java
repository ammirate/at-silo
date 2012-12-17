package atsilo.storage;

import atsilo.entity.EventPlanner;
import atsilo.entity.Evento;
import atsilo.entity.PersonaleAsilo;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
//TODO da implementare
public class DBEvento extends DBBeans {
    
    
    /**
     * Costruttore
     * @param db
     */
    public DBEvento(Database db){
        super("evento",db);
    }   

    
   
   
    
    //TODO  public Evento ricercaEventoPerChiave(String nome){gianfranco
    
   //TODO public EventPlanner ricercaEventPlannerEvento(Evento e){
     
    
   

    /**
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() {
        // TODO Scheletro generato automaticamente
        return null;
    }

    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {
        // TODO Scheletro generato automaticamente
        return null;
    }

    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Object creaBean(ResultSet r) throws SQLException {
        // TODO Scheletro generato automaticamente
        return null;
    }
    
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        res.put("descrizione","descrizione");
        res.put("nome","nome");
        res.put("data","data");
        res.put("path","path");
        res.put("tipo","tipo");
        
        
        return Collections.unmodifiableMap(res);
    }
}
