package atsilo.storage;

import atsilo.entity.Fattura;
import atsilo.entity.PersonaleAsilo;

public class DBFattura extends DBBeans {
    Tabella tabella;
    
    public DBFattura(){
        tabella= new Tabella("Fattura");
        super(tabella);
    }

    public Fattura getFattura(PersonaleAsilo pers) {
        return null;
    }

    public boolean inserisci(Fattura f) {
        return true;
    }
}
