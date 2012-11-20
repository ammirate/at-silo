package atsilo.storage;
import java.util.ArrayList;
import java.util.List;

public class DBBeans {
   
    final protected Tabella tabella;
    private Database db;
    
    public DBBeans(String nomeTabella){
        tabella=new Tabella(nomeTabella);
        db=tabella.getDatabase();
    }
 
    public void setTabella(Tabella tabella){
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
    public Database getDatabase(){
        return db;
    }

}
