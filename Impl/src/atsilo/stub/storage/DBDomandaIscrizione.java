/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: StubDomandaIscrizione.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Frank, 06/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.stub.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import atsilo.entity.DomandaIscrizione;
import atsilo.storage.Database;

/**
 * Classe Stub di DBDomandaIscrizione <Descrizione classe>
 * 
 * @author Frank
 * 
 */
public class DBDomandaIscrizione {
    private static ArrayList<DomandaIscrizione> listadomande = new ArrayList<DomandaIscrizione>();
    static {
        DomandaIscrizione d = new DomandaIscrizione();
        listadomande.add(d);
    }
    
    
    /**
     * @param db
     */
    public DBDomandaIscrizione(Database db) {
    }
    
    public DomandaIscrizione ricercaDomandaDaId(int id) throws SQLException {
        
        for (DomandaIscrizione domandatrovata : listadomande) {
            {
                if (domandatrovata.getId() == id)
                    return domandatrovata;
            }
        }
        return null;
    }
    
    public void replace(DomandaIscrizione iscrizione,
            DomandaIscrizione domandaDaModificare) throws SQLException {
        for (int k=0;k<listadomande.size();k++) {
            {
                if (listadomande.get(k).getId() == iscrizione.getId())
                    listadomande.set(k,domandaDaModificare);
            }
        }
        
    }
    
    /**
     * @param domanda2
     */
    public void inserisciDomanda(DomandaIscrizione domanda2) {
        listadomande.add(domanda2);
        
    }
}
