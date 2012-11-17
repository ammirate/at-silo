package atsilo.storage;

import atsilo.entity.EventPlanner;

public class DBEventPlanner extends DBBeans {
    Tabella tabella;
    
    public DBEventPlanner(){
        tabella= new Tabella("EventPlanner");
        super(tabella);
    }}