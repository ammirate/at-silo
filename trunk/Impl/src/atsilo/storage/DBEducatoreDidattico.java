package atsilo.storage;

import atsilo.entity.EducatoreDidattico;

public class DBEducatoreDidattico extends DBBeans {
    Tabella tabella;
    
    public DBEducatoreDidattico(){
        tabella= new Tabella("EducatoreDidattico");
        super(tabella);
    }}