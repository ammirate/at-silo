/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: StubBambino.java
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

import atsilo.entity.Bambino;
import atsilo.entity.DomandaIscrizione;
import atsilo.storage.Database;



public class StubBambino
{
    Bambino b;
    Database database;
    
    public StubBambino(Database db){
        database=db;
        b = new Bambino();
    }
        
    public Bambino ricercaBambino(Bambino b){
        return b;
    }
    
    public Bambino rimuoviIscritto(Bambino b){
        return b;
    }

}