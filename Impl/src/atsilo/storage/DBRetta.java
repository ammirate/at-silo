package atsilo.storage;

import atsilo.entity.DomandaIscrizione;

public class DBRetta extends DBBeans {
    Tabella tabella;
    
    public DBRetta(){
        tabella= new Tabella("Retta");
        super(tabella);
    }}