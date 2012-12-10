/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: StubBando.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Frank, 05/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.stub.storage;

import java.sql.SQLException;

import atsilo.entity.Bando;
import atsilo.storage.Database;

/**
 * Classe Stub di DBBando <Descrizione classe>
 * 
 * @author Frank
 * 
 */

public class DBBando {
    private static Bando bando=new Bando();
    
    
    public DBBando(Database db) 
    {
    }


    /**
     * @param bando
     * @return
     */
    public boolean inserisci(Bando nuovo) throws SQLException
    {
        bando=nuovo;
        return true;
    }
    public void replace(Bando darimpazziare ,Bando rimpiazzo)
    {
       bando=rimpiazzo;
    }
    public Bando getBAndo() throws SQLException 
    {
        return bando;
    }


    
    
    
}
