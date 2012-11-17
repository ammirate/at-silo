package atsilo.storage;

import atsilo.entity.Evento;

public class DBEvento extends DBBeans {
    Tabella tabella;
    
    public DBEvento(){
        tabella= new Tabella("Evento");
        super(tabella);
    }}