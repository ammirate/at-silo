package atsilo.storage;

import atsilo.entity.Assenza;

public class DBAssenza extends DBBeans {
    Tabella tabella;
    
    public DBAssenza(){
        tabella= new Tabella("Assenza");
        super(tabella);
    }}