package atsilo.storage;

import atsilo.entity.Tirocinante;

public class DBTirocinante extends DBBeans {
    Tabella tabella;
    
    public DBTirocinante(){
        tabella= new Tabella("Tirocinante");
        super(tabella);
    }

    public Tirocinante getTirocinante(PersonaleAsilo pers) {
        return null;
    }

    public boolean inserisci(Tirocinante t) {
        return true;
    }

    public boolean delete(Tirocinante t) {
        return true;
    }
}
