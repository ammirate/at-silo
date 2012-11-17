package atsilo.storage;

import atsilo.entity.MenuMensa;

public class DBMenuMensa extends DBBeans {
    Tabella tabella;
    
    public DBMenuMensa(){
        tabella= new Tabella("MenuMensa");
        super(tabella);
    }}