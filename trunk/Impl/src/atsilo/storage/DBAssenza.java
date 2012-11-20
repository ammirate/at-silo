package atsilo.storage;
import java.util.Date;
import atsilo.entity.Assenza;

public class DBAssenza extends DBBeans {
    Tabella tabella;
    
    public DBAssenza(){
        tabella= new Tabella("Assenza");
        super(tabella);
    }


    public List<Assenza> ricercaAssenzaPerData(Date d){}
}