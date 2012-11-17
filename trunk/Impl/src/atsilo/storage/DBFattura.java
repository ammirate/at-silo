package atsilo.storage;

import atsilo.entity.Fattura;

public class DBFattura extends DBBeans {
    Tabella tabella;
    
    public DBFattura(){
        tabella= new Tabella("Fattura");
        super(tabella);
    }}