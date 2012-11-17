package atsilo.storage;

import atsilo.entity.RispostaQuestionario;

public class DBRispostaQuestionario extends DBBeans {
    Tabella tabella;
    
    public DBRispostaQuestionario(){
        tabella= new Tabella("RispostaQuestionario");
        super(tabella);
    }}