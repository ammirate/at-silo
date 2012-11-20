package atsilo.storage;

import atsilo.entity.Fattura;
import atsilo.entity.PersonaleAsilo;

public class DBFattura extends DBBeans {
    
    public DBFattura(Database db){
        super("Fattura",db);
    }

    public Fattura getFattura(PersonaleAsilo pers) {
        return null;
    }

    public boolean inserisci(Fattura f) {
        return true;
    }
}
