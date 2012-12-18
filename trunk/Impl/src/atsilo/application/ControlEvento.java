package atsilo.application;

import atsilo.entity.Classe;
import atsilo.entity.EventPlanner;
import atsilo.entity.Evento;
import atsilo.entity.Partecipa;

import atsilo.entity.Registro;
import atsilo.exception.DBConnectionException;
import atsilo.exception.EventoException;
import atsilo.exception.RegistroException;
import atsilo.storage.*;

import java.sql.Date;

import java.util.ArrayList;
import java.util.List;


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

/**
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlEvento.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012 (non responsabile)
 * 
 *-----------------------------------------------------------------
 **/

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
    
    private static final ControlEvento INSTANCE = new ControlEvento();
    
    
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
     * @throws DBConnectionException 
     * @throws EventoException 
     */
    public void inserisciEvento(String descrizione, String nome, String cc, Date data,
            String tipo,List<Classe> classi,EventPlanner organizzatore, String path) throws EventoException{
        Database db = new Database();
        
        if(!db.apriConnessione())
        {throw new EventoException("Connessione al DataBase fallita");}
        try
        {
            DBPartecipa dbPartecipa= new DBPartecipa(db);
            DBEvento dbEvento= new DBEvento(db);
            for (Classe classe : classi) 
            {
                Partecipa partecipa=new Partecipa(id,classe);
                dbPartecipa.inserisci(partecipa);
            }
            Evento evento =new Evento();
            dbEvento.inserisci(evento);
            
        }
        finally{
            db.chiudiConnessione();
        }    
    }
    
    /**
     * Changes an event in a register
     * @param registro is the register in which change the event
     * @param vecchioEvento is the event to change
     * @param nuovoEvento is the new event that substitutes vecchioEvento
     * @return true if the event was changed correctly, else true
     * @throws DBConnectionException 
     * @throws EventoException 
     */
    public void modificaEvento(Evento evento,String descrizione, String nome, String cc, Date data,
            String tipo,List<Classe> classi,EventPlanner organizzatore, String path) throws DBConnectionException, EventoException{
        Database db = new Database();
        StubEvento stub = new StubEvento(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
        }
        finally{
            db.chiudiConnessione();
        } 
    }
    
    
    /**
     * Deletes an event from a register
     * @param registro is the register from which delete the event
     * @param evento is the event to delete
     * @return the event deleted
     * @throws DBConnectionException 
     * @throws EventoException 
     */
    public Evento eliminaEvento(Evento evento) throws DBConnectionException, EventoException{
        Database db = new Database();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            DBEvento dbEvento=new DBEvento(db);
           
            if(dbEvento.ricercaPerChiave(evento.getNome(),evento.getData())!=null);
                dbEvento.delete(evento);
        }
        finally{
            db.chiudiConnessione();
        } 
    }
    
    
    /**
     * Gets all the events about a teacher
     * @param pers is the event owner teacher
     * @return an event list about teacher
     * @throws DBConnectionException 
     * @throws EventoException 
     */
    public List<Evento> getEventiPerOrganizzatore(EventPlanner organizzatore) throws DBConnectionException, EventoException{
        Database db = new Database();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            DBEvento dbEvento=new DBEvento(db);
            return dbEvento.getEventiPerOrganizzatore(organizzatore);
            
        }
        finally{
            db.chiudiConnessione();
        } 
    }
    
    
    /**
     * Gets all the events in a date
     * @param registro is the register in which get the events
     * @param data is the events date
     * @return an event list where all the events have their date equals to @param data
     * @throws DBConnectionException 
     * @throws EventoException 
     */
    public List<Evento> getEventiInData(Date data) throws DBConnectionException, EventoException{
        Database db = new Database();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            DBEvento dbEvento=new DBEvento(db);
            return dbEvento.getEventiPerData(data);
            
        }
        finally{
            db.chiudiConnessione();
        } 
        }
    
    public List<Evento> getEventiPerNome(String nome) throws DBConnectionException, EventoException{
 Database db = new Database();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            DBEvento dbEvento=new DBEvento(db);
            return dbEvento.getEventiPer(nome);
            
        }
        finally{
            db.chiudiConnessione();
        } 
    }

    private List<String> convertiCC(String cc)
    {
        List<String> s=new ArrayList<String>(); 
        return s;
    }


    private String convertiCC(List<String> cc)
    {
        String s="";
        return s;
        
    }


    /**
     * Gets the single istance of this class
     * @return a new ControlEvento
     */
    public ControlEvento getIstance(){
        return INSTANCE;
    }
    
}
