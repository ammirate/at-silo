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
 * FILE: ControlAttività.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012
 *-----------------------------------------------------------------
 */

 /**
  *  Class that controls and manages the activities
  */
public class ControlAttivita {
        
    private final static ControlAttivita control;
    
    
    /**
     * Contrusctor
     */
    private ControlAttivita() {
    }
    
    
    /**
     * Adds a new activity in a register
     * @param registro is the register in which add the activity
     * @param attivita is the activity to add
     * @return true if the activity was added correctly, else false
     */
    public boolean inserisciAttivita(Registro registro, Attivita attivita){
        return false;
    }
    

    /**
     * Changes an activity in a register
     * @param registro is the register in which change the activity
     * @param attivita is the activity to change
     * @return true if the activity was changed correctly, else false
     */
    public boolean modificaAttivita(Registro registro, String attivita, Attivita nuovaAttivita){
        return false;
    }
    
    
    /**
     * Delete an activity from a register
     * @param registro is the register from which delete the activity
     * @param attivita is the activity to delete
     * @return the activity deleted
     */
    public Attivita eliminaAttivita(Registro registro, String titolo){
        return null;
    }
    
    
    /**
     * Search an activity from a register
     * @param registro is the register in which search the activity
     * @param titolo is the title of the activity to search
     * @return the activity searched
     */
    public Attivita ricercaAttivitaPerTitolo(Registro registro, String titolo){
        return null;
    }
    
    
    /**
     * Search the activities about a category
     * @param registro is the register in which search the activities
     * @param categoria is the category  interessed
     * @return an activity list about a category
     */
    public List<Attivita> ricercaAttivitaPerCategoria(Registro registro, String categoria){
        return null;
    }
    
    
    /**
     * Gets all the activities in a date
     * @param data is the activity date
     * @return a list of activities
     */
    public List<Attivita> getAttivita(Date data){
        return null;
    }
    
    /**
     * Gets the single istance of this class
     * @return a new ControlAttivita
     */
    public ControlAttivita getIstance(){
        return null;
    }
    
}
