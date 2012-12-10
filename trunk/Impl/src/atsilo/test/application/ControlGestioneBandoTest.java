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

import java.sql.Date;
import java.sql.SQLException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import atsilo.application.ControlGestioneBando;
import atsilo.entity.Bando;
import atsilo.entity.DomandaIscrizione;

import atsilo.exception.BandoException;
import atsilo.exception.DBConnectionException;
import atsilo.storage.Database;
import atsilo.storage.DBBando;
import atsilo.storage.DBDomandaIscrizione;


public class ControlGestioneBandoTest {
    private ControlGestioneBando control = ControlGestioneBando.getIstance();
    private Database db = new Database();
    
    
    @Before
    /**
     * @throws Exception
     */
    public void setUp() throws Exception {
        
    }
    
    @After
    /**
     * @throws Exception
     */
    public void tearDown() throws Exception {
    }
    
    /**
     * creo una domanda in locale e gli do punteggio 0 poi la inserisco nel
     * database e tramite il metodo inserisci punteggio cambio il punteggio e
     * verifico che sia andato a buon fine Test method for
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
        DBDomandaIscrizione dbDomande = new DBDomandaIscrizione(db);
        DomandaIscrizione domanda = new DomandaIscrizione();
        
        Date dataPresentazione = new Date(0);
        
        domanda.se
        dbDomande.inserisci(domanda);
        control.inserisciPunteggio(domanda, 54);
        domanda = dbDomande.ricercaDomandaDaId(domanda.getId());
        
        assertEquals(54, domanda.getPunteggio());
        
    }
    
    
    /**
     * Test method for
     * {@link atsilo.application.ControlGestioneBando#modificaintervalli(java.lang.String, java.lang.String,java.lang.String,java.lang.String,java.lang.String)}
     * .
     * 
     * @throws BandoException
     * @throws DBConnectionException
     * @throws SQLException
     */
    @Test
    public final void testInserisciIntervalloBando()
            throws DBConnectionException, BandoException, SQLException {
        DBBando dbBando = new DBBando(db);
        Bando bando = new Bando();
        bando.setiD(1);
        bando.setDataInizioBando("10");
        bando.setDataFineBando("11");
        bando.setDataInizioPresentazioneRinuncia("12");
        bando.setDataFinePresentazioneRinuncia("13");
        bando.setDataFineRinuncia("14");
        control.modificaintervalli("15", "16", "17", "18", "19");
        
        assertEquals("15", dbBando.getBAndo().getDataInizioBando());
        assertEquals("16", dbBando.getBAndo().getDataFineBando());
        assertEquals("17", dbBando.getBAndo()
                .getDataInizioPresentazioneRinuncia());
        assertEquals("18", dbBando.getBAndo()
                .getDataFinePresentazioneRinuncia());
        assertEquals("19", dbBando.getBAndo().getDataFineRinuncia());
        
        
    }
    
    /**
     * Test method for
     * {@link atsilo.application.ControlGestioneBando#modificaPostiDisponibili(int}
     * .
     *
     */
     @Test 
     public final void testModificaPostiDisponibili() 
             throws DBConnectionException, BandoException, SQLException 
      {
         DBBando dbBando = new DBBando(db);
         Bando bando = new Bando();
         bando.setiD(1);
         bando.setPostiDisponibili(40);
         control.modificaPostiDisponibili(30);
         assertEquals(30, dbBando.getBAndo().getPostiDisponibili());
         
         ;
              
     }
     
    
}
