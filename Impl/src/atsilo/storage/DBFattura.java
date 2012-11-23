package atsilo.storage;

import atsilo.entity.Fattura;
import atsilo.entity.PersonaleAsilo;

public class DBFattura extends DBBeans {
    
    public DBFattura(Database db){
        super("Fattura",db);
    }

    public Fattura ricercaFatturaDaId(int ID) {
        return null;
    }

}
