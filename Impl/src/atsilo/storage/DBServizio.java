package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.Servizio;

public class DBServizio extends DBBeans {
    
    public DBServizio(Database db){
        super("Servizio",db);
    }

    public Servizio ricercaServizioPerBambino(String cf) {
        return null;
    }


}
