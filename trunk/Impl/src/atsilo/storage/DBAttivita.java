package atsilo.storage;

import atsilo.entity.Attivita;

public class DBAttivita extends DBBeans {
    Tabella tabella;
    
    public DBAttivita(){
        tabella= new Tabella("Attivita");
        super(tabella);
    }}