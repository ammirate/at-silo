package atsilo.storage;

import atsilo.entity.DomandaIscrizione;

public class DBDomandaIscrizione extends DBBeans {
    Tabella tabella;
    
    public DBDomandaIscrizione(){
        tabella= new Tabella("DomandaIscrizione");
        super(tabella);
    }}