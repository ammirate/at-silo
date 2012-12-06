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
import java.util.Iterator;
import java.util.List;

import atsilo.entity.Account;
import atsilo.entity.Bando;
import atsilo.entity.DomandaIscrizione;
import atsilo.storage.Database;

/**
 * Classe StubBando <Descrizione classe>
 * 
 * @author Frank
 * 
 */
public class StubBando implements Iterable<Bando>{
    Bando bando;
    Iterable<Bando> bandi;
    List<Bando> bandilista;
    Database database;
    
    
    public StubBando(Database db) {
        bando =new Bando();
        database = db;
        bandilista.add(bando);
      
    }


    /**
     * @param bando2
     * @return
     */
    public boolean inserisci(Bando bando2) {
        // TODO Scheletro generato automaticamente
        return true;
    }


    /**
     * @param getiD
     * @return
     */
    public Bando cercaBandoPerId(int getiD) throws SQLException {
        // TODO Scheletro generato automaticamente
        return bando;
    }


    public Iterable<Bando> getAll() 
    {
        return this;
    }


    public Iterator<Bando> iterator() {
        return (Iterator<Bando>) bandilista;
    }
    
    
    
}
