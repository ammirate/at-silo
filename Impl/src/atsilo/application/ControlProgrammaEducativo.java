package atsilo.application;

import atsilo.entity.ProgrammaEducativoSettimanale;
import java.util.List;

/**
 * Class that controls and manages a weekly educative program
 * 
 * @author Antonio Cesarano
 */
public class ControlProgrammaEducativo {
    
    private static final ControlProgrammaEducativo control;
    
    
    /**
     * Contructor
     */
    private ControlProgrammaEducativo() {
    }
    
    
    /**
     * Adds a new educative program to the database
     * @param p is the educative program
     * @return true if the educative program was added correctly, else false
     */
    public boolean inserisciProgrammaEducativoSett(ProgrammaEducativoSettimanale p){
        return false;
    }
    
    
    /**
     * Change the objective and the description of an educcative program
     * @param idProgrammaEducativo is the educative program identifier
     * @param descrizione
     * @param obiettivo
     * @return
     */
    public boolean modificaProgrammaEducativoSett(String idProgrammaEducativo, String descrizione, String obiettivo){
        return false;
    }
    
    
    /**
     * Gets all the educative programs
     * @return an educative programs list
     */
    public List<ProgrammaEducativoSettimanale> getProgrammiEducativi(){
        return null;
    }
    
    
    /**
     * Gets an educative program by id
     * @param id is the educative program identifier
     * @return an educative program
     */
    public ProgrammaEducativoSettimanale getProgrammaEducativo(String id){
        return null;
    }
    
    
    /**
     * Gets the single istance of this class
     * @return a new ControlprogrammaEducativo
     */
    public ControlProgrammaEducativo getIstance(){
        return null;
    }
}
