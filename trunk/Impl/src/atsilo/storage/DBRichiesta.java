package atsilo.storage;

import atsilo.entity.Richiesta;
import atsilo.entity.Servizio;

public class DBRichiesta extends DBBeans {
    Tabella tabella;
    
    public DBRichiesta(){
        tabella= new Tabella("Richiesta");
        super(tabella);
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
