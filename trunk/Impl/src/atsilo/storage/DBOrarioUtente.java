package atsilo.storage;

import atsilo.entity.OrarioUtente;
import atsilo.entity.Servizio;

public class DBOrarioUtente extends DBBeans {
    Tabella tabella;
    
    public DBOrarioUtente(){
        tabella= new Tabella("OrarioUtente");
        super(tabella);
    }

    public OrarioUtente getOrario(Servizio s) {
        return null;
    }

    public boolean inserisci(OrarioUtente o) {
        return true;
    }
}
