package atsilo.application;

import atsilo.entity.*;
import java.util.List;
import java.sql.Date;

/**
 * Class that controls and manages a register
 * 
 * @author Antonio Cesarano
 */
public class ControlRegistro {
    
    private static final ControlRegistro control;
    
    
    /**
     * Contructor
     */
    private ControlRegistro() {}
    
    
    /**
     * Adds a new register in the database
     * @param registro is the new register
     * @return true if the register was added correctly, else false
     */
    public boolean inserisciRegistro(Registro registro){
        return false;
    }
    
    
    /**
     * Gets a class register
     * @param classe is the class
     * @return a register
     */
    public Registro getRegistro(Classe classe){
        return null;
    }
    

    /**
     * Gets the single istance of this class
     * @return a new ControlRegistro
     */
    public ControlRegistro getIstance(){
        return null;
    }
    
    
}
