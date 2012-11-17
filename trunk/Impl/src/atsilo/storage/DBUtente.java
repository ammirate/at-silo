package atsilo.storage;

import atsilo.entity.Utente;

public class DBUtente extends DBBeans {
    Tabella tabella;
    
    public DBUtente(){
        tabella= new Tabella("Utente");
        super(tabella);
    }}