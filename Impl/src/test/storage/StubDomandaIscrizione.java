
package test.storage;


import java.util.List;

import atsilo.entity.DomandaIscrizione;
import atsilo.storage.Database;

public class StubDomandaIscrizione
{
    DomandaIscrizione di;
    List<DomandaIscrizione> ldi;
    Database database;
    
    public StubDomandaIscrizione(Database db){
        database=db;
        di = new DomandaIscrizione();
        ldi.add(di);
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
    
    public DomandaIscrizione ricercaDomandaPerId(int id){
        return di;
    }
    
    public boolean inserisci(DomandaIscrizione di){
        return true;
    }
    
    public boolean delete(DomandaIscrizione di){
        return true;
    }
    
    public boolean modificaCertificatiIscrizione(int id){
        return true;
    }
    
    public boolean replace(DomandaIscrizione di1, DomandaIscrizione di2){
        return true;
    }
    
    public List<DomandaIscrizione> ricercaDomandeInAttesa(){
        return ldi;
    }


}