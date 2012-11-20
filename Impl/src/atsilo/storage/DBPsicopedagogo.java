package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.Psicopedagogo;

public class DBPsicopedagogo extends DBBeans {
    
    public DBPsicopedagogo(Database db){
        super("Psicopedagogo",db);
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