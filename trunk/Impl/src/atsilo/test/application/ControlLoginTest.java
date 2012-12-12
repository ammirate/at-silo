/*
 *-----------------------------------------------------------------
ù * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlLoginTest.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * fabio, 08/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;

import static org.junit.Assert.assertEquals;

import java.sql.SQLException;

import javax.security.auth.login.LoginException;

import junit.framework.Assert;

import org.junit.Test;

import atsilo.application.ControlLogin;
import atsilo.entity.Account;
import atsilo.entity.PersonaleAsilo;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBPersonaleAsilo;
import atsilo.storage.DBPsicopedagogo;
import atsilo.storage.Database;
import atsilo.util.AtsiloConstants;

/**
 * Classe ControlLoginTest <Descrizione classe>
 * 
 * @author fabio
 * @author Marko
 * @author Frank
 * 
 */
public class ControlLoginTest {    
    /**
     * @param args
     * @throws DBConnectionException
     * @throws LoginException
     */
    
    
    @Test
    public final void testGetValoreLogin() throws LoginException
    {        
        
        ControlLogin control = ControlLogin.getInstance();
        
        Account account1 = control.getValoreLogin("a.senatore", "antonellas",AtsiloConstants.CAT_DIRETTORE);
        assertEquals("SNTNTN53N69B309D",account1.getOwner().getCodiceFiscale());
         
        Account account2 = control.getValoreLogin("d.tranfa", "domenicot", AtsiloConstants.CAT_DELEGATO_RETTORE);
        assertEquals("TRNDMN64L12T048Y",account2.getOwner().getCodiceFiscale());
        
        Account account3 = control.getValoreLogin("v.mars", "veronicam", AtsiloConstants.CAT_IMP_DIR_STUDIO);
        assertEquals("MRSVRN90A32B235B",account3.getOwner().getCodiceFiscale());
        
        Account account4= control.getValoreLogin("s.buselli", "silvanab", AtsiloConstants.CAT_IMP_ASILO);
        
        assertEquals("BSLSVN62L12B099E",account4.getOwner().getCodiceFiscale());
        
        Account account5 = control.getValoreLogin("a.defazio", "andreadf", "genitore");
        
        assertEquals("DFZNDR91L14A909D",account5.getOwner().getCodiceFiscale());

        //Account account6 = control.getValoreLogin("a.defazio", "andreadf", "educatore_didattico");
        
       // assertEquals("DFZNDR91L14A909D",account6.getOwner().getCodiceFiscale());

        Account account7 = control.getValoreLogin("c.mezzano", "cristinam", "tirocinante");
        
        assertEquals("MZZCRS91L44X098Y",account7.getOwner().getCodiceFiscale());

        Account account8 = control.getValoreLogin("a.desantis", "arturods", "responsabile_questionario");
        
        assertEquals("DSTRTR58L32A333B",account8.getOwner().getCodiceFiscale());

        Account account9 = control.getValoreLogin("a.damelia", "alfonsoda", "psicopedagogo");
        
        assertEquals("DMLLFN71L12A333B",account9.getOwner().getCodiceFiscale());
        
    }
}
