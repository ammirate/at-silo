package atsilo.storage;

import atsilo.entity.Classe;

public class DBClasse extends DBBeans {
    Tabella tabella;
    
    public DBClasse(){
        tabella= new Tabella("Classe");
        super(tabella);
    }}