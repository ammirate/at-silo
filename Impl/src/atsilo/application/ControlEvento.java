package atsilo.application;

import atsilo.entity.Evento;
import atsilo.entity.PersonaleAsilo;

import atsilo.entity.Registro;

import java.sql.Date;

import java.util.List;

/**
 * Class that controls and mannages a generic event
 * 
 * @author Antonio Cesarano
 */

/*
 * ====EVENTO===
Evento avrà i seguenti attributi

--
-Nome
-Descrizione
-Data
-Tipo 
-CC

Il tipo è una stringa e può essere: Evento organizzato, Riunione
I CC è una stringa ed indica i CC dell'evento (per esempio in una 
riunione devono essere presenti i rappresentanti delle classi e 
l'event planner inserisce nei cc i rappresentanti).
 */
public class ControlEvento {

    private static final ControlEvento control;
    
    
    /**
     * Contructor
     */
    private ControlEvento() {
    }
    
    
    /**
     * Adds a new event in a register
     * @param registro is the register in which add the event
     * @param evento is the evento to add
     * @return true if the event was added correctly, else false
     */
    public boolean inserisciEvento(Registro registro, Evento evento){
            return false;
    }
    
/**
     * Adds an invited list to the event
     * @param registro is the register in which get the event
     * @param evento is the event to manage
     * @param CC is the invited list to the event
     * @return true if the list was added correctly, else false
     */
    public boolean inserisciCCEvento(Registro registro, Evento evento, String[] CC){
        return false;
    }
    
    /**
     * Changes an event in a register
     * @param registro is the register in which change the event
     * @param vecchioEvento is the event to change
     * @param nuovoEvento is the new event that substitutes vecchioEvento
     * @return true if the event was changed correctly, else true
     */
    public boolean modificaEvento(Registro registro, Evento vecchioEvento, Evento nuovoEvento){
        return false;}
    
    
    /**
     * Deletes an event from a register
     * @param registro is the register from which delete the event
     * @param evento is the event to delete
     * @return the event deleted
     */
    public Evento eliminaEvento(Registro registro, Evento evento){
        return null;
    }


    /**
     * Moves an event from a date to another one
     * @param registro is the register in which get the event
     * @param evento is the event to move
     * @param newData is the new event date
     * @return true if the event was moved correctly, else true
     */
    public boolean spostaEvento(Registro registro, Evento evento, Date newData){
        return false;
    }
    
    
    /**
     * Gets all the events about a teacher
     * @param pers is the event owner teacher
     * @return an event list about teacher
     */
    public List<Evento> getEventiPerPersonale(PersonaleAsilo pers){
        return null;
    }
    
    
    /**
     * Gets all the events in a date
     * @param registro is the register in which get the events
     * @param data is the events date
     * @return an event list where all the events have their date equals to @param data
     */
    public List<Evento> getEventiInData(Registro registro, Date data){
        return null;
    }
    
    /**
     * Gets the single istance of this class
     * @return a new ControlEvento
     */
    public ControlEvento getIstance(){
        return null;
    }
    
}
