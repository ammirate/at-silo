package atsilo.storage;

import atsilo.entity.ResponsabileQuestionario;

public class DBResponsabileQuestionario extends DBBeans {
    Tabella tabella;
    
    public DBResponsabileQuestionario(){
        tabella= new Tabella("ResponsabileQuestionario");
        super(tabella);
    }}