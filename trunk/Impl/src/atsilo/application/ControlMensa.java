package atsilo.application;

import java.sql.SQLException;

import atsilo.entity.Bambino;
import atsilo.entity.Bando;
import atsilo.entity.Servizio;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBServizio;
import atsilo.storage.Database;
import atsilo.stub.storage.DBBando;

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
    public boolean inserisciServizio(int id, String orarioInizio, String orarioFine,
            String pianoPasto, String bambino, int orarioUtente)throws DBConnectionException {
        
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        try {
            Servizio servizio = new Servizio(id, orarioInizio, orarioFine,
                    pianoPasto, bambino, orarioUtente);
            dbServizio.inserisci(servizio);
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    
    
    
    public boolean modificaPianoPasto(Servizio s, String pianopasto)throws DBConnectionException {
        
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        try {
            try {
                String bambino = s.getBambino();
                Servizio servizio = new Servizio(
                       
                        dbServizio.ricercaServizioPerBambino(bambino).getId(),
                        dbServizio.ricercaServizioPerBambino(bambino).getOrarioInizio(),
                        dbServizio.ricercaServizioPerBambino(bambino).getOrarioFine(),
                        dbServizio.ricercaServizioPerBambino(bambino).getPianoPasto(),
                        dbServizio.ricercaServizioPerBambino(bambino).getBambino(),
                        dbServizio.ricercaServizioPerBambino(bambino).getOrarioUtente());
                servizio.setPianoPasto(pianopasto);
                
                dbServizio.replace(dbServizio.ricercaServizioPerBambino(bambino), servizio);
                
            } catch (SQLException e) {
                throw new DBConnectionException("Connessione Fallita");
            }
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public boolean eliminaServizio(Servizio s) throws DBConnectionException {
        
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        try {      
            dbServizio.delete(s);
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    
    
    

    public String ricercaPianoPasto(Servizio s){
        return null;
    }
    




    
    
    
    
    
}
