package atsilo.storage;
import java.util.Date;
import atsilo.entity.Assenza;

public class DBAssenza extends DBBeans {
    Tabella tabella;
    
    public DBAssenza(Database db){super("Assenza",db);}


    public List<Assenza> ricercaAssenzaPerData(Date d){}
    
    public List<Assenza> ricercaAssenzaPerBambino(String codicefiscale) {} //aggiunto
    
    
}