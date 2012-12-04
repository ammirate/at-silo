package atsilo.application;

import java.sql.SQLException;

import atsilo.entity.Classe;
import atsilo.entity.Registro;
import atsilo.exception.DBConnectionException;
import atsilo.exception.RegistroException;
import atsilo.storage.DBClasse;
import atsilo.storage.DBRegistro;
import atsilo.storage.Database;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlRegistro.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012
 *-----------------------------------------------------------------
 */
public class ControlRegistro {
    
    private static final ControlRegistro INSTANCE = new ControlRegistro();

    
    /**
     * Contructor
     */
    private ControlRegistro() {}
    
    
    /**
     * Adds a new register in the database
     * @param registro is the new register
     * @return true if the register was added correctly, else false
     * @throws RegistroException 
     * @throws DBConnectionException 
     */
    public void inserisciRegistro(Registro registro) throws RegistroException, DBConnectionException{
        Database db = new Database();
        DBRegistro storage = new DBRegistro(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!storage.inserisci(registro))
                throw new RegistroException("Inserimento fallito");
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Gets a class register
     * @param classe is the class
     * @return a register
     * @throws DBConnectionException 
     * @throws RegistroException 
     */
    public Registro getRegistro(Classe classe) throws DBConnectionException, RegistroException{
        Database db = new Database();
        DBRegistro storage = new DBRegistro(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            Registro r;
            try {
                r = storage.ricercaRegistroPerClasse(classe);
            } catch (SQLException e) {
                throw new RegistroException("Registro non presente");
            }
            if(r == null)
                throw new RegistroException("Registro non trovato");
            return r;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Adds a new register to a class
     * @param registro is the register to add
     * @param classe is the class tht receives the register
     * @return false if the register was added correctly, else false
     * @throws DBConnectionException 
     * @throws RegistroException 
     */
    public void assegnaRegistro(Registro registro, Classe classe) throws DBConnectionException, RegistroException{
        Database db = new Database();
        DBRegistro storageRegistro = new DBRegistro(db);
        DBClasse storageClasse = new DBClasse(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            //controllo prima se esiste la classe, se esiste le assegno il registro
            Classe c;
            try {
                c = storageClasse.RicercaClassePerId(classe.getId());
            } catch (SQLException e) {
                throw new RegistroException("Errore SQL");
            }
            if(c!=null)
                if(!storageRegistro.assegnaRegistroAClasse(registro.getId(),classe.getId()));
                    throw new RegistroException("Assegnazione del registro alla classe fallita");
        }
        finally{
            db.chiudiConnessione();
        }
        
    }
    
    
    /**
     * Gets the single istance of this class
     * @return a new ControlRegistro
     */
    public static ControlRegistro getIstance(){
        return INSTANCE;
    }
    
    
    
}
