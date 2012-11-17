package atsilo.storage;

import atsilo.entity.PersonaleAsilo;

public class DBPersonaleAsilo extends DBBeans {
    Tabella tabella;
    
    public DBPersonaleAsilo(){
        tabella= new Tabella("PersonaleAsilo");
        super(tabella);
    }}