package atsilo.storage;

import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;
import atsilo.entity.Retta;

import java.util.List;

public class DBRetta extends DBBeans {
    
    public DBRetta(Database db){
        super("Retta",db);
    }

    public List ricarcaRettaPerGenitore(Genitore g) {
        return null;
    }


    public Retta modificaRetta(Retta oldR, Retta newR) {
        return null;
    }
}
