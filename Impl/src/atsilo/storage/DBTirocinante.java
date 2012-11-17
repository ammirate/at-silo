package atsilo.storage;

import atsilo.entity.Tirocinante;

public class DBTirocinante extends DBBeans {
    Tabella tabella;
    
    public DBTirocinante(){
        tabella= new Tabella("Tirocinante");
        super(tabella);
    }}