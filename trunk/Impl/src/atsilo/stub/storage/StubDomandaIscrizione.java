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
import java.util.List;

import atsilo.entity.DomandaIscrizione;
import atsilo.storage.Database;

/**
 * Classe StubDomandaIscrizione <Descrizione classe>
 * 
 * @author Frank
 * 
 */
public class StubDomandaIscrizione {
    private DomandaIscrizione domanda;
    private List<DomandaIscrizione> listadomande;
    
    /**
     * @param db
     */
    public StubDomandaIscrizione(Database db) {
        domanda = new DomandaIscrizione();
        listadomande = new ArrayList<DomandaIscrizione>();
        listadomande.add(domanda);
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
    
    public void replace(DomandaIscrizione iscrizione,DomandaIscrizione domandaDaModificare) throws SQLException {
        for (DomandaIscrizione domandatrovata : listadomande) {
            {
                if (domandatrovata.getId() == iscrizione.getId())
                    domandatrovata=domandaDaModificare;
                    
            }
        }
        
    }
}
