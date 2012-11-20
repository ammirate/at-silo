package atsilo.storage;

import atsilo.entity.Genitore;
import atsilo.entity.Richiesta;
import atsilo.entity.Servizio;

import java.util.List;

public class DBRichiesta extends DBBeans {
    
    public DBRichiesta(){
        super("Richiesta");
    }

    public Richiesta getAllRichiesta(Servizio s) {
        return null;
    }

    public List<Richiesta> getAllRichiesta(Genitore g) {
        return null;
    }

    public boolean inserisci(Richiesta r) {
        return true;
    }
}
