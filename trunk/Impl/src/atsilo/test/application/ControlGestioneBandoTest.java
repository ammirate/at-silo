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

import org.junit.Test;

import atsilo.application.ControlGestioneBando;
import atsilo.entity.Bando;

import atsilo.exception.BandoException;
import atsilo.exception.DBConnectionException;
import atsilo.storage.Database;
import atsilo.storage.DBBando;


public class ControlGestioneBandoTest {
    private ControlGestioneBando control = ControlGestioneBando.getIstance();
    private Database db = new Database();
    
    
    /**
     * DB DOMANDA NON FIXATO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
    /*@Test
    public final void testInsrisciPunteggio() throws DBConnectionException,
    BandoException, SQLException {
        
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione Fallita");
        }
        try {
            Date data = new Date(234);
            DBDomandaIscrizione dbDomande = new DBDomandaIscrizione(db);
            
            DomandaIscrizione domanda = new DomandaIscrizione(data,999,104,45,null,null,"stato","certificato","certificato","privacy",
                    true,true,true,true,true,true,true,true,true,"punteggio",12,null,"convalida");
            
            dbDomande.inserisci(domanda);
            control.inserisciPunteggio(domanda, 54);
            domanda = dbDomande.ricercaDomandaDaId(domanda.getId());
            
            assertEquals(54, domanda.getPunteggio());
        } finally {
            db.chiudiConnessione();
        }
        
    }
    */
    
    /**
     *  
     * @throws DBConnectionException
     * @throws BandoException
     * @throws SQLException
     */
    @Test public final void testInserisciIntervalloBando() throws
    DBConnectionException, BandoException, SQLException 
    {
        if(!db.apriConnessione()) 
        { throw new
            DBConnectionException("Connessione Fallita"); 
        }
        try 
        {
            DBBando dbBando =new DBBando(db);
            Bando bando = new Bando(); 
            System.out.println(dbBando.getBAndo().getiD());
            bando.setiD(1);
            bando.setDataInizioBando("10"); 
            bando.setDataFineBando("11");
            bando.setDataInizioPresentazioneRinuncia("12");
            bando.setDataFinePresentazioneRinuncia("13");
            bando.setDataFineRinuncia("14");
            bando.setPostiDisponibili(40);
            control.modificaBando("15", "16", "17", "18", "19", 30);
            
            assertEquals("15", dbBando.getBAndo().getDataInizioBando());
            assertEquals("16", dbBando.getBAndo().getDataFineBando());
            assertEquals("17", dbBando.getBAndo().getDataInizioPresentazioneRinuncia()); 
            assertEquals("18", dbBando.getBAndo() .getDataFinePresentazioneRinuncia());
            assertEquals("19", dbBando.getBAndo().getDataFineRinuncia());
            assertEquals(30, dbBando.getBAndo().getPostiDisponibili());
          }
        finally 
        {
            db.chiudiConnessione(); 
        } 
    }
    
    /** Test method for {@link
     * atsilo.application.ControlGestioneBando#modificaPostiDisponibili(int} .
     * 
     /*
     * @Test public final void testModificaPath() throws DBConnectionException,
     * BandoException, SQLException { if (!db.apriConnessione()) { throw new
     * DBConnectionException("Connessione Fallita"); } try { DBBando dbBando =
     * new DBBando(db); Bando bando = new Bando(); bando.setiD(1);
     * bando.setDataInizioBando("10"); bando.setDataFineBando("11");
     * bando.setDataInizioPresentazioneRinuncia("12");
     * bando.setDataFinePresentazioneRinuncia("13");
     * bando.setDataFineRinuncia("14"); bando.setPostiDisponibili(40);
     * bando.setPath("ciaoo"); control.modificaPath("bye"); assertEquals("bye",
     * dbBando.getBAndo().getPath()); } finally { db.chiudiConnessione(); } }
     */
}
