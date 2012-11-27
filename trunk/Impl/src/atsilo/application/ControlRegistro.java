package atsilo.application;

import atsilo.entity.Classe;
import atsilo.entity.Registro;
import atsilo.exception.DBConnectionException;
import atsilo.exception.RegistroException;
import atsilo.storage.Database;
import atsilo.test.application.StubRegistro;

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
    
    private static ControlRegistro control;
    private StubRegistro stub;
    private Database db;
    
    /**
     * Contructor
     */
    private ControlRegistro() {
        control = new ControlRegistro();
        
        db = new Database();
        stub = new StubRegistro(db);
        
        
    }
    
    
    /**
     * Adds a new register in the database
     * @param registro is the new register
     * @return true if the register was added correctly, else false
     */
    public void inserisciRegistro(Registro registro){
       
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        
        if(!stub.inserisciRegistroNelDatabase(registro))
            throw new RegistroException("Inserimento fallito");
    }
    
    
    /**
     * Gets a class register
     * @param classe is the class
     * @return a register
     */
    public Registro getRegistro(Classe classe){
        Registro r = stub.ricercaRegistroPerClasse(classe);
        if(r == null)
            throw new RegistroException("Registro non trovato");
        return r;
    }
    
    
    /**
     * Adds a new register to a class
     * @param registro is the register to add
     * @param classe is the class tht receives the register
     * @return false if the register was added correctly, else false
     */
    public void assegnaRegistro(Registro registro, Classe classe){
        stub.assegnaRegistroAClasse(registro, classe);
    }
    

    /**
     * Gets the single istance of this class
     * @return a new ControlRegistro
     */
    public ControlRegistro getIstance(){
        return control;
    }
    
    
}
