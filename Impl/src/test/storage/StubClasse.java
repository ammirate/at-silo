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

    public Classe ricercaClassePerId (String id){
        return c;
    }
    
    public boolean inserisciClasse (Classe c){
        return true;
    }
    
    public boolean cancellaClasse (Classe c){
        return true;
    }
    
    public boolean replace(Classe c1, Classe c2){
        return true;
    }
    
    public boolean confermaClasse(Classe c){
        return true;
    }
    
    public boolean rifiutaClasse(Classe c){
        return true;
    }
    
    
}
