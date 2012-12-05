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
import atsilo.storage.Database;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Iterator;

import org.apache.tomcat.dbcp.dbcp.DbcpException;

import com.sun.org.apache.bcel.internal.generic.NEW;

import test.storage.StubBando;
import test.storage.StubDomandaIscrizione;
import test.storage.StubEvento;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlGestioneBando.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Gianfranco Bottiglieri, 27/11/2012
 *-----------------------------------------------------------------
 */

public class ControlGestioneBando {
    private static final ControlGestioneBando INSTANCE = new ControlGestioneBando();
    private StubBando dbBando;
    private StubDomandaIscrizione dbDomandaIscrizione;
    
    
    private ControlGestioneBando() {
    }
    
    /**
     * 
     * inserisce il punteggio nella domanda passata in input
     * 
     * @param iscrizione
     *            la domanda di iscrizione non può essere null
     * @param punteggio
     *            punteggio deve essere negativo
     * @return
     * @throws DBConnectionException
     * @throws BandoException
     */
    public boolean inserisciPunteggio(DomandaIscrizione iscrizione,
            int punteggio) throws DBConnectionException, BandoException {
        Database db = new Database();
        
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        
        // Quindi, si possono creare tutti i gestori di tabelle necessari
        try {
            dbBando = new StubBando(db);
            dbDomandaIscrizione = new StubDomandaIscrizione(db);
            
            DomandaIscrizione domandaDaModificare = new DomandaIscrizione();
            try {
                domandaDaModificare = dbDomandaIscrizione
                        .ricercaDomandaDaId(iscrizione.getId());
            } catch (SQLException e) {
                throw new DBConnectionException("Connessione Fallita");
            }
            if (domandaDaModificare == null)
                throw new BandoException("domanda non trovata");
            domandaDaModificare.setPunteggio(punteggio);
            dbDomandaIscrizione.replace(iscrizione, domandaDaModificare);
            return true;
        } finally {
            /*
             * Alla fine dell'interazione, prima di uscire dal metodo, bisogna
             * chiudere la connessione.
             */
            db.chiudiConnessione();
        }
    }
    
    /**
     * metodo che inserisci l'intervallo del bando
     * 
     * @param inizio
     * @param fine
     * @return
     * @throws DBConnectionException
     * @throws BandoException
     */
    public boolean inserisciIntervalloBando(String inizio, String fine)
            throws DBConnectionException, BandoException {
        // Come prima cosa, bisogna creare un'istanza di database e aprire una
        // connessione
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        
        // Quindi, si possono creare tutti i gestori di tabelle necessari
        try {
            dbBando = new StubBando(db);
            dbDomandaIscrizione = new StubDomandaIscrizione(db);
            Bando bando = new Bando();
            bando.setDataFine(fine);
            bando.setDataInizio(inizio);
            if (dbBando.inserisci(bando))
                return true;
            else
                return false;
        } finally {
            /*
             * Alla fine dell'interazione, prima di uscire dal metodo, bisogna
             * chiudere la connessione.
             */
            db.chiudiConnessione();
        }
    }
    
    /**
     * modifica un bando
     * 
     * @param bando
     * @param inizio
     * @param fine
     * @return
     * @throws DBConnectionException
     * @throws BandoException
     */
    public boolean modificaBando(Bando bando, String inizio, String fine)
            throws DBConnectionException, BandoException {
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        
        try {
            Bando bandoDaModificare = new Bando();
            try {
                bandoDaModificare = dbBando.cercaBandoPerId(bando.getiD());
            } catch (SQLException e) {
                throw new DBConnectionException("connessione fallita");
            }
            if (bandoDaModificare == null)
                throw new BandoException("bando non trovato");
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public Bando getBando() throws DBConnectionException {
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        
        try {
            StubBando dbBando = new StubBando(db);
            Iterable<Bando> bandi = dbBando.getAll();
            Bando bando = null;
            if (bandi.iterator().hasNext())
                bando = bandi.iterator().next();
            
            return bando;
        } finally {
            db.chiudiConnessione();
        }
        
        
    }
    
    public static ControlGestioneBando getIstance() {
        return INSTANCE;
    }
}
