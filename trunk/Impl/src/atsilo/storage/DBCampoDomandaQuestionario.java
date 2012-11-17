package atsilo.storage;

import atsilo.entity.CampoDomandaQuestionario;

public class DBCampoDomandaQuestionario extends DBBeans {
    Tabella tabella;
    
    public DBCampoDomandaQuestionario(){
        tabella= new Tabella("CampoDomandaQuestionario");
        super(tabella);
    }}