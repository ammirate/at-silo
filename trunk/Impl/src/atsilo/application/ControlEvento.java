package atsilo.application;

import atsilo.entity.Evento;
import atsilo.entity.PersonaleAsilo;

import atsilo.entity.Registro;
import atsilo.exception.DBConnectionException;
import atsilo.exception.EventoException;
import atsilo.exception.RegistroException;
import atsilo.storage.Database;

import java.sql.Date;

import java.util.List;

import test.storage.StubEvento;
import test.storage.StubRegistro;


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
    public void inserisciEvento(Evento evento) throws DBConnectionException, EventoException{
        Database db = new Database();
        StubEvento stub = new StubEvento(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!stub.inserisciEventoNelDatabase(evento))
                throw new EventoException("Inserimento evento nel database fallito");
            
        }
        finally{
            db.chiudiConnessione();
        }    
    }
    
    /**
     * Adds an invited list to the event
     * @param registro is the register in which get the event
     * @param evento is the event to manage
     * @param CC is the invited list to the event
     * @return true if the list was added correctly, else false
     * @throws DBConnectionException 
     * @throws EventoException 
     */
    public void inserisciCCEvento(Evento evento, List<String> CC) throws DBConnectionException, EventoException{
        Database db = new Database();
        StubEvento stub = new StubEvento(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!stub.inserisciCCEvento(evento, CC))
                throw new EventoException("Inserimento partecipanti nel database fallito");
            
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
    public void modificaEvento(Evento vecchioEvento, Evento nuovoEvento) throws DBConnectionException, EventoException{
        Database db = new Database();
        StubEvento stub = new StubEvento(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(stub.rimuoviEvento(vecchioEvento)==null)
                throw new EventoException("Evento da modificare non esistente");
            if(!stub.inserisciEventoNelDatabase(nuovoEvento))
                throw new EventoException("Errore modifica evento");
            
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
        StubEvento stub = new StubEvento(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Evento toReturn = stub.rimuoviEvento(evento);
            if(toReturn==null)
                throw new EventoException("Evento inesistente");
            return toReturn;
        }
        finally{
            db.chiudiConnessione();
        } 
    }
    
    
    /**
     * Moves an event from a date to another one
     * @param registro is the register in which get the event
     * @param evento is the event to move
     * @param newData is the new event date
     * @return true if the event was moved correctly, else true
     * @throws DBConnectionException 
     * @throws EventoException 
     */
    public void spostaEvento(Evento evento, Date newData) throws DBConnectionException, EventoException{
        Database db = new Database();
        StubEvento stub = new StubEvento(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!stub.setData(evento, newData))
                throw new EventoException("Spostamento evento fallito");
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
    public List<Evento> getEventiPerPersonale(PersonaleAsilo pers) throws DBConnectionException, EventoException{
        Database db = new Database();
        StubEvento stub = new StubEvento(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Evento> toReturn = stub.ricercaEventoPerPersonale(pers);
            if(toReturn==null || toReturn.isEmpty())
                throw new EventoException("Nessun evento disponibile per questo utente");
            return toReturn;
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
        StubEvento stub = new StubEvento(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Evento> toReturn = stub.ricercaEventoData(data);
                    if(toReturn==null || toReturn.isEmpty())
                        throw new EventoException("Nessun evento disponibile in questa data");
            return toReturn;
        }
        finally{
            db.chiudiConnessione();
        }    
    }
    
    /**
     * Gets the single istance of this class
     * @return a new ControlEvento
     */
    public ControlEvento getIstance(){
        return INSTANCE;
    }
    
}
