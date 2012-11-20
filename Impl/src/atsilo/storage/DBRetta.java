package atsilo.storage;

import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;
import atsilo.entity.Retta;

import java.util.List;

public class DBRetta extends DBBeans {
    
    public DBRetta(){
        super("Retta");
    }

    public List<Retta> getAllRetta(Genitore g) {
        return null;
    }

    public boolean inserisci(Retta r, Genitore g) {
        return true;
    }

    public Retta update(Retta oldR, Retta newR) {
        return null;
    }
}
