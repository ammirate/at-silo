/**
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlGestioneBando.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Bottiglieri Gianfranco, 25/11/2012 
 * REVISION
 * nome revisore, data revisione
 *-----------------------------------------------------------------
 **/
package atsilo.application;

import atsilo.entity.Bando;
import atsilo.entity.DomandaIscrizione;
import atsilo.exception.BandoException;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBBando;
import atsilo.storage.DBDomandaIscrizione;
import atsilo.storage.Database;

import java.sql.Date;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp.DbcpException;

import test.storage.StubEvento;

public class ControlGestioneBando {
    private static final ControlGestioneBando INSTANCE = new ControlGestioneBando();
    private DBBando dbBando;
    private DBDomandaIscrizione dbDomandaIscrizione;
    
    private ControlGestioneBando() 
    {
    }
    /**
     * inserisce il punteggio nella domanda passata in input
     * @param iscrizione
     * @param punteggio
     * @return
     * @throws DBConnectionException
     * @throws BandoException
     */
    boolean inserisciPunteggio(DomandaIscrizione iscrizione,int punteggio) throws DBConnectionException,BandoException
    {
        Database db = new Database();
        
        if (!db.apriConnessione()) 
        {
            throw new DBConnectionException("Connessione Fallita");
        }
        
        //Quindi, si possono creare tutti i gestori di tabelle necessari
        try {
            dbBando = new DBBando(db);
            dbDomandaIscrizione = new DBDomandaIscrizione(db);
            
            DomandaIscrizione domadandaDaModificare=new DomandaIscrizione();
            try 
            {
                domadandaDaModificare=dbDomandaIscrizione.ricercaDomandaDaId(iscrizione.getId());
            } catch (SQLException e) 
            {
                throw new DBConnectionException("Connessione Fallita");
            }
            if(domadandaDaModificare==null)
                throw new BandoException("domanda non trovata");
            domadandaDaModificare.setPunteggio(punteggio);
            return true;
        } finally {
            /*
             * Alla fine dell'interazione, prima di uscire dal metodo,
             * bisogna chiudere la connessione.
             */
            db.chiudiConnessione();
        }
    }
    
    /**
     * metodo che inserisci l'intervallo del bando
     * @param inizio
     * @param fine
     * @return
     * @throws DBConnectionException
     * @throws BandoException
     */
    boolean inserisciIntervalloBando(String inizio, String fine) throws DBConnectionException,BandoException
    {
        //Come prima cosa, bisogna creare un'istanza di database e aprire una connessione
        Database db = new Database();
        if (!db.apriConnessione()) 
        {
            throw new DBConnectionException("Connessione Fallita");  
        }
        
        //Quindi, si possono creare tutti i gestori di tabelle necessari
        try {
            dbBando = new DBBando(db);
            dbDomandaIscrizione = new DBDomandaIscrizione(db);
            Bando bando=new Bando();
            bando.setDataFine(fine);
            bando.setDataInizio(inizio);
            if(dbBando.inserisci(bando))
                return true;
            else 
                return false;
        } finally {
            /*
             * Alla fine dell'interazione, prima di uscire dal metodo,
             * bisogna chiudere la connessione.
             */
            db.chiudiConnessione();
        }
    }
    
    /**
     * modifica un bando
     * @param bando
     * @param inizio
     * @param fine
     * @return
     * @throws DBConnectionException
     * @throws BandoException
     */
    boolean modificaBando(Bando bando,String inizio, String fine) throws DBConnectionException,BandoException
    {
        Database db = new Database();
        if (!db.apriConnessione()) 
        {
            throw new DBConnectionException("Connessione Fallita");  
        }
        
        try 
        {
            Bando bandoDaModificare=new Bando();
            try
            {
                bandoDaModificare=dbBando.cercaBandoPerId(bando.getiD());
            }
            catch (SQLException e) 
            {
                throw new DBConnectionException("connessione fallita");
            }
            if(bandoDaModificare==null)
                throw new BandoException("bando non trovato");
            return true;
        } 
        finally 
        {
            db.chiudiConnessione();
        }
    }
    
    public static ControlGestioneBando getIstance() {
        return INSTANCE;
    }
}
