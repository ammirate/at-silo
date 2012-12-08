
package atsilo.stub.application;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import atsilo.entity.DomandaIscrizione;
import atsilo.storage.Database;

public class StubDomandaIscrizione
{
    DomandaIscrizione di;
    List<DomandaIscrizione> ldi=new ArrayList<DomandaIscrizione>();
    Database database;
    
    public StubDomandaIscrizione(Database db){
        database=db;
        di = new DomandaIscrizione();
        ldi.add(di);
    }
        
    public boolean inserisciDomandaIscizione(DomandaIscrizione domanda){
        ldi.add(domanda);
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
    
    public boolean modificaCertificatiIscrizione(int id, String str1, String str2, String str3){
        return true;
    }
    
    public boolean replace(DomandaIscrizione di1, DomandaIscrizione di2){
        return true;
    }
    
    public List<DomandaIscrizione> ricercaDomandeInAttesa(){
        return ldi;
    }

    /**
     * @param id
     * @return
     */
    public DomandaIscrizione ricercaDomandaDaId(int id) throws SQLException{
      
        return di;
    }


}