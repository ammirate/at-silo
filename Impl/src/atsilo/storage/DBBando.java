package atsilo.storage;

import atsilo.entity.Bando;

public class DBBando extends DBBando {
    Tabella tabella;
    
    public DBBando(){
        tabella= new Tabella("Bando");
        super(tabella);
    }}