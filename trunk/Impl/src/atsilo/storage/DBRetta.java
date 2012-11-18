package atsilo.storage;

import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;
import atsilo.entity.Retta;

public class DBRetta extends DBBeans {
    Tabella tabella;
    
    public DBRetta(){
        tabella= new Tabella("Retta");
        super(tabella);
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
