package atsilo.storage;

import atsilo.entity.OrarioUtente;
import atsilo.entity.Servizio;

public class DBOrarioUtente extends DBBeans {
    
    public DBOrarioUtente(){
        super("OrarioUtente");
    }

    public OrarioUtente getOrario(Servizio s) {
        return null;
    }

    public boolean inserisci(OrarioUtente o) {
        return true;
    }
}
