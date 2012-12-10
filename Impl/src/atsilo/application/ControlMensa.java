package atsilo.application;

import java.sql.SQLException;

import atsilo.entity.Bando;
import atsilo.entity.Servizio;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBServizio;
import atsilo.storage.Database;
import atsilo.stub.storage.StubBando;

//TODO scrivere la javadoc

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlMensa.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 *
 */

/**
 * 
 * @author Marko
 */
public class ControlMensa {
    
    private static ControlMensa control = new ControlMensa();
    private DBServizio dbServizio;
    
    private ControlMensa(){
        
    }
    public static final ControlMensa getInstance(){
        return control;
    }
    public boolean inserisciPianoPasto(Servizio s, String pianopasto){
        return false;
        
    }

    public boolean modificaPianoPasto(Servizio s, String pianopasto)throws DBConnectionException {
        
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        try {
            try {
                Servizio servizio = new Servizio(
                      
                        dbServizio.ricercaServizioPerBambino(s.getBambino()).getId(),
                        dbServizio.ricercaServizioPerBambino(s.getBambino()).getOrarioInizio(),
                        dbServizio.ricercaServizioPerBambino(s.getBambino()).getOrarioFine(),
                        dbServizio.ricercaServizioPerBambino(s.getBambino()).getPianoPasto(),
                        dbServizio.ricercaServizioPerBambino(s.getBambino()).getBambino(),
                        dbServizio.ricercaServizioPerBambino(s.getBambino()).getOrarioUtente());
                servizio.setPianoPasto(pianopasto);
                          
                dbServizio.replace(dbServizio.ricercaServizioPerBambino(s.getBambino()), servizio);
                
            } catch (SQLException e) {
                throw new DBConnectionException("Connessione Fallita");
            }
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    {
        
       
    }
    public boolean eliminaPianoPasto(Servizio s){
        return false;
        
    }

    public String ricercaPianoPasto(Servizio s){
        return null;
    }
    




    
    
    
    
    
}
