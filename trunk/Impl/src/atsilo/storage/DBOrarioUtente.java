package atsilo.storage;

import atsilo.entity.OrarioUtente;
import atsilo.entity.Servizio;

public class DBOrarioUtente extends DBBeans {
    
    public DBOrarioUtente(Database db){
        super("OrarioUtente",db);
    }

    public OrarioUtente ricercaOrarioUtenteDaId(int ID) {
        return null;
    }

}
