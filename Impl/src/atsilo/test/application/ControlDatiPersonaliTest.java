/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlDatiPersonaliTest.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Elisa, 05/dic/2012
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

import atsilo.entity.Genitore;
import atsilo.exception.DBConnectionException;
import atsilo.exception.GenitoreException;

/**
 * Classe ControlDatiPersonaliTest
 * <Descrizione classe>
 * 
 * @author Elisa
 * 
 */
public class ControlDatiPersonaliTest {
    
    ControlDatiPersonali control = new ControlDatiPersonali();
    Genitore g;
    

    
    @Test
    public void test() throws GenitoreException, DBConnectionException, SQLException  {
         g = control.getDatiGenitore("MSCGNN75H43H654K");
         assertNotNull(g);
    }
    
    @Test
    public void nhtest() throws GenitoreException, DBConnectionException, SQLException  {
         g = control.getDatiGenitore("MSCGNN75H43H654");
         assertNotNull(g);
    }
}
