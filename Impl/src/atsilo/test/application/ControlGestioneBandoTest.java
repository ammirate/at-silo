/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlGestioneBandoTest.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Gianfranco Bottiglieri, 30/nov/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import atsilo.application.ControlGestioneBando;
import atsilo.entity.Bando;
import atsilo.entity.DomandaIscrizione;

import atsilo.exception.BandoException;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBDomandaIscrizione;
import atsilo.storage.Database;
import atsilo.storage.DBBando;


public class ControlGestioneBandoTest {
    private ControlGestioneBando control = ControlGestioneBando.getIstance();
    

    /**
     * creo una domanda in locale e gli do punteggio 0 poi la inserisco nel database e tramite il
     * metodo inserisci punteggio cambio il punteggio e verifico che sia andato
     * a buon fine Test method for
     * {@link atsilo.application.ControlGestioneBando#insrisciPunteggio(atsilo.entity.DomandaIscrizione, int)}
     * .
     * 
     * @throws BandoException
     * @throws DBConnectionException
     * @throws SQLException
     */
    @Test
    public final void testInsrisciPunteggio() throws DBConnectionException,
            BandoException, SQLException {
    
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        try {
            DBDomandaIscrizione dbDomande = new DBDomandaIscrizione(db);
            DomandaIscrizione domanda = dbDomande.ricercaDomandaDaId(1);
            control.inserisciPunteggio(domanda, 54);
            assertEquals(54, domanda.getPunteggio());
        } finally {
            db.chiudiConnessione();
        }
        
    }
    
    
    /**
     * 
     * @throws DBConnectionException
     * @throws BandoException
     * @throws SQLException
     */
    @Test
    public final void testInserisciIntervalloBando()
        
            throws DBConnectionException, BandoException, SQLException {
        Database db = new Database();
        if (!db.apriConnessione())
        {
            throw new DBConnectionException("Connessione Fallita");
        }
        try {
            DBBando dbBando = new DBBando(db);
            Bando bando = new Bando();
            bando.setId(1);
            bando.setDataInizioBando("2011-05-01");
            bando.setDataFineBando("2011-05-02");
            bando.setDataInizioPresentazioneRinuncia("2011-05-03");
            bando.setDataFinePresentazioneRinuncia("2011-05-04");
            bando.setDataFineRinuncia("2011-05-05");
            bando.setPostiDisponibili(40);
            
            control.modificaBando("2011-05-06", "2011-05-07", "2011-05-08", "2011-05-09", "2011-05-10", 30);
            
            assertEquals("2011-05-06", dbBando.getBando().getDataInizioBando());
            assertEquals("2011-05-07", dbBando.getBando().getDataFineBando());
            assertEquals("2011-05-08", dbBando.getBando().getDataInizioPresentazioneRinuncia());
            assertEquals("2011-05-09", dbBando.getBando().getDataFinePresentazioneRinuncia());
            assertEquals("2011-05-10", dbBando.getBando().getDataFineRinuncia());
            assertEquals(30, dbBando.getBando().getPostiDisponibili());
        } finally 
        {
            db.chiudiConnessione();
        }
    }
    
    /**
     * Test method for {@link
     * atsilo.application.ControlGestioneBando#modificaPostiDisponibili(int} .
     * 
     */
    @Test
    public final void testModificaPath() throws DBConnectionException,
            BandoException, SQLException {
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        try {
            DBBando dbBando = new DBBando(db);
            Bando bando = new Bando();
            bando.setId(1);
            bando.setDataInizioBando("10");
            bando.setDataFineBando("11");
            bando.setDataInizioPresentazioneRinuncia("12");
            bando.setDataFinePresentazioneRinuncia("13");
            bando.setDataFineRinuncia("14");
            bando.setPostiDisponibili(40);
            bando.setPath("ciaoo");
            control.modificaPath("bye");
            
            assertEquals("bye", dbBando.getBando().getPath());
        } finally 
        {
            db.chiudiConnessione();
        }
    }
    
}
