
package test.storage;

import atsilo.entity.DomandaIscrizione;
import atsilo.storage.Database;

public class StubDomandaIscrizione
{
    DomandaIscrizione di;
    Database database;
    
    public StubDomandaIscrizione(Database db){
        database=db;
        di = new DomandaIscrizione();
    }
        
    public boolean inserisciDomandaIscizione(DomandaIscrizione di){
        return true;
    }
    
    public DomandaIscrizione rimuoviDomandaIscizione(DomandaIscrizione di){
        return di;
    }
    
    public String verificaStato(int id){
        return "idoneo";
    }

}