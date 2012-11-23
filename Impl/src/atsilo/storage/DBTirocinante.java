package atsilo.storage;

import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Tirocinante;

public class DBTirocinante extends DBBeans {
    
    public DBTirocinante(Database db){
        super("Tirocinante",db);
    }

    public Tirocinante ricercaTirocinante(PersonaleAsilo pers) {
        return null;
    }


}
