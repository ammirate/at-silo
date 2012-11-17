package atsilo.storage;

import atsilo.entity.Psicopedagogo;

public class DBPsicopedagogo extends DBBeans {
    Tabella tabella;
    
    public DBPsicopedagogo(){
        tabella= new Tabella("Psicopedagogo");
        super(tabella);
    }}