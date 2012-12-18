package atsilo.application;

import atsilo.application.notificheMail.ControlNotificaMail;
import atsilo.application.notificheMail.Messaggio;
import atsilo.application.notificheMail.NotificaMailEvento;
import atsilo.entity.Classe;
import atsilo.entity.EventPlanner;
import atsilo.entity.Evento;
import atsilo.entity.Partecipa;
import atsilo.entity.Utente;

import atsilo.entity.Registro;
import atsilo.exception.DBConnectionException;
import atsilo.exception.EventoException;
import atsilo.exception.RegistroException;
import atsilo.storage.*;

import java.sql.Date;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.MessagingException;


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
    private static final Logger LOG = Logger.getLogger("global");
    
    
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
    public void inserisciEvento(Evento evento) throws EventoException{
        Database db = new Database();
        
        if(!db.apriConnessione())
        {throw new EventoException("Connessione al DataBase fallita");}
        try
        {
            DBPartecipa dbPartecipa= new DBPartecipa(db);
            DBEvento dbEvento= new DBEvento(db);
            dbEvento.inserisci(evento);
            
            for (Classe classe : evento.getClassi()) 
            {
                Partecipa partecipa=new Partecipa(classe,evento.getId());
                dbPartecipa.inserisci(partecipa);
            }
            ControlNotificaMail control=ControlNotificaMail.getInstance();
            Messaggio messaggio=new NotificaMailEvento(convertiCC(evento.getCC()), "Creazione ", " ", evento);
            try {
                control.inviaMail(messaggio);
            } catch (MessagingException e) {
                LOG.log(Level.SEVERE, "<Errore nel invio del messaggio cauasato da: >", e);
            } catch (Throwable e) {
                LOG.log(Level.SEVERE, "<Errore nel invio del messaggio cauasato da: >", e);
            }
            
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
    public boolean modificaEvento(Evento evento,Evento eventoModificato)
    {
        Database db = new Database();
        
        if(!db.apriConnessione())
        {
            LOG.log(Level.SEVERE, "Errore di esecuzione della query. Causato da: connessione fallita");
            return false;
        } 
        try{
            DBEvento dbEvento=new DBEvento(db);
            DBPartecipa dbPartecipa=new DBPartecipa(db);
            try 
            {   Evento eventoOrigine=dbEvento.ricercaEventoPerChiave(evento.getId());
            
            dbEvento.replace(eventoOrigine, eventoModificato);
            Iterable<Partecipa> classiDaCancellare =dbPartecipa.getAll();
            Iterator<Partecipa> classiDelete=classiDaCancellare.iterator();
            while(classiDelete.hasNext())
            {
                Partecipa partecipa= classiDelete.next();
                if(partecipa.getEventoId()==eventoOrigine.getId())
                    dbPartecipa.delete(partecipa);
            }
            for (Classe classe : eventoOrigine.getClassi()) 
            {
                Partecipa partecipa=new Partecipa(classe,evento.getId());
                dbPartecipa.inserisci(partecipa);
            }
            ControlNotificaMail control=ControlNotificaMail.getInstance();
            Messaggio messaggio=new NotificaMailEvento(convertiCC(evento.getCC()), "Modifica", "", evento);
            try {
                control.inviaMail(messaggio);
            } catch (MessagingException e) {
                LOG.log(Level.SEVERE, "<Errore nel invio del messaggio cauasato da: >", e);
            } catch (Throwable e) {
                LOG.log(Level.SEVERE, "<Errore nel invio del messaggio cauasato da: >", e);
            }
            return true;
            
            
            } catch (SQLException e) 
            {   
                LOG.log(Level.SEVERE, "Errore di esecuzione della query. Causato da:"+e.getMessage(),e);
                return false;
            }
            
            
        }
        finally{
            db.chiudiConnessione();
        } 
    }
    
    
    /**
     * Cancella l'evento dal registro altrimenti ritorna null
     * 
     * @param registro is the register from which delete the event
     * @param evento is the event to delete
     * @return the event deleted
     * @throws DBConnectionException 
     * @throws EventoException 
     */
    public Evento eliminaEvento(Evento evento) {
        Database db = new Database();
        
        if(!db.apriConnessione())
        {
            LOG.log(Level.SEVERE, "Errore di esecuzione della query. Causato da: connessione fallita");
            return null;
        }
        try{
            DBEvento dbEvento=new DBEvento(db);
            DBPartecipa dbPartecipa=new DBPartecipa(db);
            try {
                if(dbEvento.ricercaEventoPerChiave(evento.getId())!=null);
            } catch (SQLException e)
            {
                LOG.log(Level.SEVERE, "Errore di esecuzione della query. Causato da: "+e.getMessage(),e);    
                return null;
            }
            Iterable<Partecipa> classiDaCancellare =dbPartecipa.getAll();
            Iterator<Partecipa> classiDelete=classiDaCancellare.iterator();
            
            while(classiDelete.hasNext())
            {
                Partecipa partecipa= classiDelete.next();
                if(partecipa.getEventoId()==evento.getId())
                    dbPartecipa.delete(partecipa);
            }

            dbEvento.delete(evento);
            ControlNotificaMail control=ControlNotificaMail.getInstance();
            Messaggio messaggio=new NotificaMailEvento(convertiCC(evento.getCC()), "Cancellazione ", "\n l'evento sopra descritto è stato cancellato", evento);
            try {
                control.inviaMail(messaggio);
            } catch (MessagingException e) {
                LOG.log(Level.SEVERE, "<Errore nel invio del messaggio cauasato da: >", e);
            } catch (Throwable e) {
                LOG.log(Level.SEVERE, "<Errore nel invio del messaggio cauasato da: >", e);
            }
            
            return evento;
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
    public List<Evento> getEventiPerOrganizzatore(EventPlanner organizzatore)
    {
        Database db = new Database();
        
        if(!db.apriConnessione())
        {
            LOG.log(Level.SEVERE, "Errore di esecuzione della query. Causato da: connessione fallita");
            return null;
        }
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
            return dbEvento.getEventiPerNome(nome);
            
        }
        finally{
            db.chiudiConnessione();
        } 
    }
    /**
     * 
     * @param cc è una stringa che contiene le email separate da virgola 
     * @return 
     * una lista di utenti in cui è settato solo il campo per l'email
     */
    private static ArrayList<Utente> convertiCC(String cc)
    {
        ArrayList<Utente> s=new ArrayList<Utente>(); 
        String mail[];
        mail = cc.split(",");
        for(int i=0; i<mail.length;i++)
        {
            Utente utente=new Utente();
            utente.setEmail(mail[i]);
            s.add(utente);
        }
        
        return s;
    }
    
    
    
    
    
    
    /**
     * Gets the single istance of this class
     * @return a new ControlEvento
     */
    public static ControlEvento getIstance(){
        return INSTANCE;
    }
    
}
