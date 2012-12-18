package atsilo.application;

import atsilo.entity.OrarioUtente;

import atsilo.entity.Servizio;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBOrarioUtente;
import atsilo.storage.Database;

import java.util.ArrayList;
import java.util.List;

//TODO scrivere javadoc per metodi e classi

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlOrario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class ControlOrario {
    
    private static final ControlOrario co=new ControlOrario();
    
    private ControlOrario(){
        
    }
    
    public static final ControlOrario getInstance(){
        return co;
    }
    public boolean inserisciOrario(Servizio s, String orarioinizio, String orariofine){
        return false;
        
    }
    public boolean modificaOrario(Servizio s, String orarioinizio, String orariofine){
        return false;
        
    }

    public String ricercaOrario(Servizio s){
        return null;
    }

    
    public boolean inserisciOrarioUtente(OrarioUtente o){
        return false;
        
    }

    public boolean modificaOrarioUtente(OrarioUtente o){
        return false;
        
    }

    public OrarioUtente eliminaOrarioUtente(int id){
        return null;
    }
    public List<OrarioUtente> ricercaOrarioUtente(OrarioUtente o){
            return null;
        }
    public List<OrarioUtente> getElencoOrarioUtente() throws DBConnectionException{
        Database db = new Database();
        DBOrarioUtente dbou = new DBOrarioUtente(db);
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<OrarioUtente> toReturn = new ArrayList<OrarioUtente>();
            
            Iterable<OrarioUtente> it = dbou.getAll();
            
            for(OrarioUtente ou : it)
            {
                toReturn.add(ou);
            }
            return toReturn;
        }
        finally{
            db.chiudiConnessione();
        } 
        }
    public OrarioUtente getOrarioUtentePerId(String id){
        return null;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
