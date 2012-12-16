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

import atsilo.entity.Bambino;
import atsilo.entity.Bando;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;
import atsilo.exception.BandoException;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBBambino;
import atsilo.storage.DBGenitore;
import atsilo.storage.Database;
import atsilo.storage.DBBando;
import atsilo.storage.DBDomandaIscrizione;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


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
    private static final Logger LOG = Logger.getLogger("global");
    
    private ControlGestioneBando() {
    }
    
    
    public List<DomandaIscrizione> getDomandeInAttesaDiPunteggio()
    {
        Database db = new Database();
        DBDomandaIscrizione dbdi = new DBDomandaIscrizione(db);
        DBGenitore dbg = new DBGenitore(db);
        DBBambino dbb = new DBBambino(db);
        db.apriConnessione();
        
        try {
            List<DomandaIscrizione> ldi = dbdi.ricercaDomandeNonEscluseSenzaPunteggio();
            for(DomandaIscrizione dom : ldi)
            {
                //Riempio i bean semivuoti (hanno solo i CF)
                Bambino b = dom.getBambino();
                dom.setBambino(dbb.ricercaBambinoPerCodFiscale(b.getCodiceFiscale()));
                
                Genitore gr = dom.getGenitore();
                dom.setGenitore(dbg.getGenitorePerCF(gr.getCodiceFiscale()));
            }
            
            return ldi;
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Impossibile ricercare domande. Causato da: "+e.getMessage(), e);
        }
        finally {
            db.chiudiConnessione();
        }
        return null;
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
     * @throws SQLException
     */
    public boolean inserisciPunteggio(DomandaIscrizione iscrizione,
            int punteggio) throws BandoException
            {
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new BandoException("Connessione Fallita");
        }
        try {
            
            DBDomandaIscrizione dbDomandaIscrizione = new DBDomandaIscrizione(db);
            DomandaIscrizione domandaDaModificare;
            
            try {
                domandaDaModificare = dbDomandaIscrizione.ricercaDomandaDaId(iscrizione.getId());
                domandaDaModificare.setPunteggio(punteggio);
                dbDomandaIscrizione.replace(iscrizione, domandaDaModificare);
            } catch (SQLException e) 
            {
                throw new BandoException("Connessione Fallita");
            }
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    /**
     * Metodo che esclude una domanda dalla graduatoria
     * @param iscrizione L'iscrizione da modificare.
     * @param notaEsclusione Stringa contenente il motivo dell'esclusione
     * @return
     * @throws BandoException
     */
    public boolean escludiDomanda(DomandaIscrizione iscrizione,String notaEsclusione) throws BandoException
            {
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new BandoException("Connessione Fallita");
        }
        try {
            
            DBDomandaIscrizione dbDomandaIscrizione = new DBDomandaIscrizione(db);
            DomandaIscrizione domandaDaModificare;
            
            try {
                domandaDaModificare = dbDomandaIscrizione.ricercaDomandaDaId(iscrizione.getId());
                domandaDaModificare.setEscluso(true);
                domandaDaModificare.setNotaEsclusione(notaEsclusione);
                dbDomandaIscrizione.replace(iscrizione, domandaDaModificare);
            } catch (SQLException e) 
            {
                throw new BandoException("Connessione Fallita");
            }
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public boolean modificaBando(String inizioBando, String fineBando,
            String inizioPresentazione, String finePresentazione,
            String fineRinuncia, int posti) throws BandoException {
        
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new BandoException("Connessione Fallita");
        }
        try {
            
            DBBando dbBando = new DBBando(db);
            Bando bando;
            
            try {
                if (dbBando.getBando() == null) {
                    bando = new Bando(1, inizioBando, fineBando,
                            inizioPresentazione, finePresentazione, fineRinuncia,
                            posti, null);
                    dbBando.inserisci(bando);
                    return true;
                } else {
                    bando = new Bando(1, inizioBando, fineBando,
                            inizioPresentazione, finePresentazione, fineRinuncia,
                            posti, null);
                    dbBando.replace(dbBando.getBando(), bando);
                    
                    return true;
                }
            } catch (SQLException e) {
                throw new BandoException("Connessione Fallita");
            }
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public boolean modificaPath(String path) throws BandoException{
        
        Database db = new Database();
        
        if (!db.apriConnessione()) {
            throw new BandoException("Connessione Fallita");
        }
        try {
            DBBando dbBando = new DBBando(db);
            
            try {
                if (dbBando.getBando() == null) {
                    throw new BandoException("Bando non presente impossibile modificare/o inserire il path");
                } else {
                    
                    Bando bando = dbBando.getBando();
                    bando.setPath(path);
                    dbBando.replace(dbBando.getBando(), bando);
                    return true;
                }
            } catch (SQLException e) {
                throw new BandoException("Connessione Fallita");
            }
        } finally {
            db.chiudiConnessione();
        }
    }
    /**
     * 
     * @return
     * @throws DBConnectionException
     */
    public Bando getBando() throws BandoException
    {
        Database db = new Database();
        
        if (!db.apriConnessione()) 
        {
            throw new BandoException("Connessione Fallita");
        }
        try {
            DBBando dbBando = new DBBando(db);
            return dbBando.getBando();   
        } catch (SQLException e) 
        {
            throw new BandoException("Connessione Fallita");
        }
        finally {
            db.chiudiConnessione();
        }
    }
    
    public static ControlGestioneBando getIstance() {
        return INSTANCE;
    }
}
