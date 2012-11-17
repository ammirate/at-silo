package atsilo.storage;

import atsilo.entity.Questionario;

public class DBRegistro extends DBBeans {
    Tabella tabella;
    
    public DBRegistro(){
        tabella= new Tabella("Registro");
        super(tabella);
    }}