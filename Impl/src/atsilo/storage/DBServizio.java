package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.Servizio;

public class DBServizio extends DBBeans {
    Tabella tabella;
    
    public DBServizio(){
        tabella= new Tabella("Servizio");
        super(tabella);
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
