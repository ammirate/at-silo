package atsilo.application;

import atsilo.entity.*;

import atsilo.entity.Registro;

import java.sql.Date;

import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlAssenza.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012
 *-----------------------------------------------------------------
 */

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlAssenza.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012
 *-----------------------------------------------------------------
 */

/**
 *  Class that controls and manages the absences
 */
public class ControlAssenza {
    
    
    private static final ControlAssenza control;
    
    /**
     * Constructor
     */
    private ControlAssenza(){}
    
    
    /**
     * Adds a new absence in a register
     * @param registro is the register in which add the absence
     * @param assenza is the absence to add
     * @return true if the absence was added correctly, else false
     */
    public boolean inserisciAssenza(Registro registro, Assenza assenza){
        return false;
    }
    
    
    
    /**
     * Deletes an absence from a register
     * @param registro is the register from which delete the absence
     * @param assenza is the absence to delete
     * @return the absence deleted
     */
    public Assenza eliminaAssenza(Registro registro, Assenza assenza){
        return null;
    }
      
      
    /**
     * Gets all the absences from a register in a date
     * @param registro is the register from which get the absences
     * @param data is the date of the absences
     * @return a List of Assenza
     */
    public List<Assenza> getAssenzeGiorno(Registro registro, Date data){
        return null;  
    }
    
    
    /**
     * Gets all the absences of one child
     * @param bambino is the child that you want to know the absences
     * @return a List of Assenza
     */
    public List<Assenza> getAssenzeBambino(Bambino bambino){
        return null;
    }
    
    
    /**
     * Gets the single istance of this class
     * @return a new ControlAssenza
     */
    public ControlAssenza staticgetIstance(){
        return null;
    }
}
