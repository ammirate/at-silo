package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;

public class DBDomandaIscrizione extends DBBeans {
    Tabella tabella;
    
    public DBDomandaIscrizione(){
        tabella= new Tabella("DomandaIscrizione");
        super(tabella);
    }

    public DomandaIscrizione getDomanda(Bambino b) {
        return null;
    }
    public DomandaIscrizione getDomanda(Genitore g) {
        return null;
    }

    public boolean inserisci(DomandaIscrizione d) {
        return true;
    }

    public boolean delete(DomandaIscrizione d) {
        return true;
    }
}
