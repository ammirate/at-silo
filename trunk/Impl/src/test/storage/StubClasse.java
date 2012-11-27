/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: StubClasse.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio, 27/nov/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package test.storage;

import atsilo.entity.Classe;
import atsilo.storage.Database;

/**
 * Classe StubClasse
 * <Descrizione classe>
 * 
 * @author Antonio
 * 
 */
public class StubClasse {
    
    Classe c;
    
    public StubClasse(Database db) {
    
        c = new Classe();
    }

    public Classe RicercaClassePerId (String id){
        return c;
    }
    
    
}
