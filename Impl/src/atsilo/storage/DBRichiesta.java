package atsilo.storage;

import atsilo.entity.Richiesta;

public class DBRichiesta extends DBBeans {
    Tabella tabella;
    
    public DBRichiesta(){
        tabella= new Tabella("Richiesta");
        super(tabella);
    }}