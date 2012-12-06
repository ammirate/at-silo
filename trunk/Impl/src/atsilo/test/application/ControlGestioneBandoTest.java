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
import atsilo.application.ControlRegistro;
import atsilo.entity.Bambino;
import atsilo.entity.Bando;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;
import atsilo.exception.BandoException;
import atsilo.exception.DBConnectionException;
import atsilo.storage.Database;
import atsilo.stub.application.StubDomandaIscrizione;
import atsilo.stub.storage.StubBando;

public class ControlGestioneBandoTest {
   private  ControlGestioneBando  control=ControlGestioneBando.getIstance();
   private Database db = new Database();
    @Before
    /**
     * @throws Exception
     */
    public void setUp() throws Exception 
    {
        
    }
    
    @After
    /**
     * @throws Exception
     */
    public void tearDown() throws Exception 
    {
    }
    
    /**
     * creo una domanda in locale e  gli do punteggio 0 poi la inserisco nel database e tramite il metodo inserisci punteggio cambio il punteggio 
     * e verifico che sia andato a buon fine
     * Test method for {@link atsilo.application.ControlGestioneBando#insrisciPunteggio(atsilo.entity.DomandaIscrizione, int)}.
     * @throws BandoException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
    @Test
    public final void testInsrisciPunteggio() throws DBConnectionException, BandoException, SQLException 
    {
        StubDomandaIscrizione dbDomande=new StubDomandaIscrizione(db);
        Genitore genitore=new Genitore();
        Bambino bambino=new Bambino();
        DomandaIscrizione domanda=new DomandaIscrizione("ciao", 9999, 0,"0", genitore, bambino);
        dbDomande.inserisci(domanda);
       
        control.inserisciPunteggio(domanda, 54);
        assertEquals(54,domanda.getPunteggio());
        
    }
    
    /*
    /**
     * Test method for {@link atsilo.application.ControlGestioneBando#inserisciIntervalloBando(java.lang.String, java.lang.String)}.
     * @throws BandoException 
     * @throws DBConnectionException 
     
    @Test
    public final void testInserisciIntervalloBando() throws DBConnectionException, BandoException 
    {
        StubBando dbBando=new StubBando(db);
        Bando bando=new Bando();
        bando.setDataInizio("ciao");
        bando.setDataFine("bye");
        dbBando.inserisci(bando);
        System.out.println("l'id è questo"+bando.getiD());
        control.inserisciIntervalloBando("ciao", "fine");
        
    }
    
    /**
     * Test method for {@link atsilo.application.ControlGestioneBando#modificaBando(atsilo.entity.Bando, java.lang.String, java.lang.String)}.
     
    @Test
    public final void testModificaBando()
    {
    }
    */
    
}
