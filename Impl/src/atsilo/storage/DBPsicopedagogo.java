package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.Psicopedagogo;

public class DBPsicopedagogo extends DBBeans {
    Tabella tabella;
    
    public DBPsicopedagogo(){
        tabella= new Tabella("Psicopedagogo");
        super(tabella);
    }

    public Psicopedagogo ricercaPsicopedagogoCf(String cf){
        Psicopedagogo p;
        return p;
    }
    
    public Classe ricercaClassiPsicopedagogo(){
        Classe c;
        return c;
    }
    

}