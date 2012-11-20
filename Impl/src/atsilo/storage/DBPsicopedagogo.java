package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.Psicopedagogo;

import java.util.List;

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
    
    public List<Classe> ricercaClassiPsicopedagogo(Psicopedagogo p){
        List<Classe> c;
        return c;
    }
    
    public List<String> ricercaNominativoPsicopedagogo(Psicopedagogo p){
       List <String> s;
        return s;
    }
    
    public String ricercaTelPsicoPedagogo(Psicopedagogo p){
        String s;
        return s;
    }
    
    public Psicopedagogo ricercaPsicoPedagogoPerClasse(Classe c){
        Psicopedagogo p;
        return p;
    }
    
    public String ricercaEmailPsicopedagogo(Psicopedagogo p){
        String e;
        return e;
    }

}