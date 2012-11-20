package atsilo.storage;

import atsilo.entity.Extra;
import atsilo.entity.Retta;

public class DBExtra extends DBBeans {
    
    public DBExtra(){
        super("Extra");
    }

    public Extra getExtra(Retta r) {
    }

    public boolean inserisci(Extra e) {
        return true;
    }

    public boolean delete(Extra e) {
        return true;
    }
}
