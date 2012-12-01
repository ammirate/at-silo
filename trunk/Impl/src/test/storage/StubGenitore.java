/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: StubGenitore.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Elisa, 28/nov/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package test.storage;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import atsilo.entity.Genitore;
import atsilo.storage.Database;



public class StubGenitore
{
    Genitore g;
    Database database;
    
    public StubGenitore(Database db){
        database=db;
        g = new Genitore();
    }
        
    public Genitore ricercaGenitore(Genitore g){
        return g;
    }
    
    public boolean inserisciGenitore(Genitore g){
        return true;
    }

}