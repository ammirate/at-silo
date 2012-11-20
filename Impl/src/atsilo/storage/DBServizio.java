package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.Servizio;

public class DBServizio extends DBBeans {
    
    public DBServizio(Database db){
        super("Servizio",db);
    }

    public Servizio getServizio(Bambino b) {
        return null;
    }

    public boolean inserisci(Servizio s, Bambino b) {
        return true;
    }

    public boolean delete(Servizio s) {
        return true;
    }
}
