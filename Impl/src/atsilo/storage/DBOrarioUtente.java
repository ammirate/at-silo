package atsilo.storage;

import atsilo.entity.OrarioUtente;

public class DBOrarioUtente extends DBBeans {
    Tabella tabella;
    
    public DBOrarioUtente(){
        tabella= new Tabella("OrarioUtente");
        super(tabella);
    }}