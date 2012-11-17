package atsilo.storage;

import atsilo.entity.Genitore;

public class DBGenitore extends DBBeans {
    Tabella tabella;
    
    public DBGenitore(){
        tabella= new Tabella("Genitore");
        super(tabella);
    }}