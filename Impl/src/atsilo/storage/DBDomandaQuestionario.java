package atsilo.storage;

import atsilo.entity.DomandaQuestionario;

public class DBDomandaQuestionario extends DBBeans {
    Tabella tabella;
    
    public DBDomandaQuestionario(){
        tabella= new Tabella("DomandaQuestionario");
        super(tabella);
    }}