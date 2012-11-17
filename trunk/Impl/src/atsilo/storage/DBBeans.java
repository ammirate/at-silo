package atsilo.storage;
import java.util.ArrayList;
import java.util.List;

public class DBBeans {
   
    private Tabella tabella;
    
    public DBBeans(Tabella tabella){
        this.setTabella(tabella);
        
    }
 
    public boolean setTabella(Tabella tabella){
        this.tabella=tabella;
    }
    public List<Object> getAll(Object RealBeans) {
        
       //query inserimento account nel database
    }
    public boolean inserisci(Object RealBeans) {
        
       //query inserimento account nel database
    }
    public Object update(Object RealBeans,Object NewRealBeans) {
     
       //query inserimento account nel database
    }
    public boolean delete(Object RealBeans) {

       //query inserimento account nel database
        
    }

}
