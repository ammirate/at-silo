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
import atsilo.stub.storage.StubBando;
import atsilo.stub.storage.StubDomandaIscrizione;
import java.sql.SQLException;


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
     * @throws SQLException
     */
    public boolean inserisciPunteggio(DomandaIscrizione iscrizione,
            int punteggio) throws DBConnectionException, BandoException,
            SQLException {
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
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
            db.chiudiConnessione();
        }
    }
    
    public boolean inserisciBando(int id, String dataInizioBando,
            String dataFineBando, String dataInizioPresentazioneRinuncia,
            String dataFinePresentazioneRinuncia, String dataFineRinuncia,
            int postiDisponibili, String path) throws DBConnectionException {
        
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        try {
            
            Bando bando = new Bando(id, dataInizioBando, dataFineBando,
                    dataInizioPresentazioneRinuncia,
                    dataFinePresentazioneRinuncia, dataFineRinuncia,
                    postiDisponibili, path);
            try {
                dbBando.inserisciBando(bando);
            } catch (SQLException e) {
                throw new DBConnectionException("connessione fallita");
            }
            return false;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public boolean modificaintervalli(String dataInizioBando,
            String dataFineBando, String dataInizioPresentazioneRinuncia,
            String dataFinePresentazioneRinuncia, String dataFineRinuncia)
            throws DBConnectionException {
        
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        try {
            try {
                Bando bando = new Bando(dbBando.getBando().getiD(),
                        dbBando.getBando().getDataInizioBando(),
                        dbBando.getBando().getDataFineBando(), 
                        dbBando.getBando().getDataInizioPresentazioneRinuncia(),
                        dbBando.getBando().getDataFinePresentazioneRinuncia(),
                        dbBando.getBando().getDataFineRinuncia(),
                        dbBando.getBando().getPostiDisponibili(),
                        dbBando.getBando().getPath());
                bando.setDataInizioBando(dataInizioBando);
                bando.setDataFineBando(dataFineBando);
                bando.setDataInizioPresentazioneRinuncia(dataInizioPresentazioneRinuncia);
                bando.setDataFinePresentazioneRinuncia(dataFinePresentazioneRinuncia);
                bando.setDataFineRinuncia(dataFineRinuncia);
                
                dbBando.replace(dbBando.getBando(), bando);
                
            } catch (SQLException e) {
                throw new DBConnectionException("Connessione Fallita");
            }
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public boolean modificaPostiDisponibili(int postiDisponibili)
            throws DBConnectionException {
        
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        try {
            try {
                Bando bando = new Bando(dbBando.getBando().getiD(),
                        dbBando.getBando().getDataInizioBando(),
                        dbBando.getBando().getDataFineBando(), 
                        dbBando.getBando().getDataInizioPresentazioneRinuncia(),
                        dbBando.getBando().getDataFinePresentazioneRinuncia(),
                        dbBando.getBando().getDataFineRinuncia(),
                        dbBando.getBando().getPostiDisponibili(),
                        dbBando.getBando().getPath());
                bando.setPostiDisponibili(postiDisponibili);
                dbBando.replace(dbBando.getBando(), bando);
            } catch (SQLException e) {
                throw new DBConnectionException("Connessione Fallita");
            }
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public static ControlGestioneBando getIstance() {
        return INSTANCE;
    }
}
