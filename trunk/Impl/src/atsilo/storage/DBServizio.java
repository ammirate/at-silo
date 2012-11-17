package atsilo.storage;

import atsilo.entity.Servizio;

public class DBServizio extends DBBeans {
    Tabella tabella;
    
    public DBServizio(){
        tabella= new Tabella("Servizio");
        super(tabella);
    }}