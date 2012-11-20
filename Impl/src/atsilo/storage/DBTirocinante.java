package atsilo.storage;

import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Tirocinante;

public class DBTirocinante extends DBBeans {
    
    public DBTirocinante(Database db){
        super("Tirocinante",db);
    }

    public Tirocinante getTirocinante(PersonaleAsilo pers) {
        return null;
    }

    public boolean inserisci(Tirocinante t) {
        return true;
    }

    public boolean delete(Tirocinante t) {
        return true;
    }
}
