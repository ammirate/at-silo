package atsilo.storage;

import atsilo.entity.Questionario;

public class DBQuestionario extends DBBeans {
    Tabella tabella;
    
    public DBQuestionario(){
        tabella= new Tabella("Questionario");
        super(tabella);
    }}