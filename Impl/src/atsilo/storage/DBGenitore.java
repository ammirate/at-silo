package atsilo.storage;

import atsilo.entity.Genitore;

public class DBGenitore extends DBBeans {
    Tabella tabella;
    
    public DBGenitore(){
        tabella= new Tabella("Genitore");
        super(tabella);
    }
    
    public Genitore ricercaGenitoreCf(String cf){
        Genitore g;
        return g;
    }
    
    public Genitore ricercaGenitoreComune(String comune){
        Genitore g;
        return g;
    }
    
    
    
        
}

    