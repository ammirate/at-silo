package atsilo.storage;

import atsilo.entity.Extra;

public class DBExtra extends DBBeans {
    Tabella tabella;
    
    public DBExtra(){
        tabella= new Tabella("Extra");
        super(tabella);
    }}