package atsilo.storage;

import atsilo.entity.EventPlanner;
import atsilo.entity.Evento;
import atsilo.entity.PersonaleAsilo;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBEvento.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */
//TODO da implementare
public class DBEvento extends DBBeans {
    
    
    /**
     * Costruttore
     * @param db
     */
    public DBEvento(Database db){
        super("evento",db);
    }
    
    
    
    
    /**
     * inserisce una lista di CC ad un evento
     * @param e è l'evento in cui inserire CC
     * @param cc è la lista di invitati all'evento
     * @return true se l'operazione è avvenuta correttemente, false altrimenti
     */
    public boolean inserisciCCEvento(Evento e, List<String> cc){
        return false;
    }
    

    
    /**
     * ricerca un evento per nome
     * @param nome è il nome dell'evento
     * @return l'evento trovato, se esiste
     */
    public Evento ricercaEventoNome(String nome){
        return null;
    }
    
    
    /**
     * ricerca tutti gli eventi in una data
     * @param data è la data interessata
     * @return una lista di eventi che si svolgeranno nella data inserita
     */
    public List<Evento> ricercaEventoData(Date data){
        return null;
    }
    
    
    
    /**
     * ricerca l'organizzatore dell'evento
     * @param e è l'evento per cui ricercare l'organizzatore
     * @return l'EventPlanner che ha creato l'evento
     */
    public EventPlanner ricercaEventPlannerEvento(Evento e){
        return null;
    }
    
    
    
    /**
     * ricerca tutti gli eventi creati da un EventPlanner
     * @param p è l'organizzatore dell'evento
     * @return una lista di eventi organizzati da EventPlanner
     */
    public List<Evento> ricercaEventoPerPersonale(PersonaleAsilo p){
        return null;
    }

    /**
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() {
        // TODO Scheletro generato automaticamente
        return null;
    }

    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {
        // TODO Scheletro generato automaticamente
        return null;
    }

    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Object creaBean(ResultSet r) throws SQLException {
        // TODO Scheletro generato automaticamente
        return null;
    }
    
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        res.put("Descrizione","descrizione");
        res.put("Nome","nome");
        res.put("data","data");
        res.put("path","path");
        res.put("Tipo","tipo");
        
        return Collections.unmodifiableMap(res);
    }
}
