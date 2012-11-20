package atsilo.storage;

import atsilo.entity.ResponsabileQuestionario;

import java.util.List;

public class DBResponsabileQuestionario extends DBBeans {
    Tabella tabella;
    
    public DBResponsabileQuestionario(){
        tabella= new Tabella("ResponsabileQuestionario");
        super(tabella);
    }
    
    public List<ResponsabileQuestionario> ricercaRespQuestPerNome(String nome){
        List<ResponsabileQuestionario> r;
        return r;
    }
    
    public ResponsabileQuestionario ricercaRespQuestPerCf(String cf){
        ResponsabileQuestionario r;
        return r;
    }
    
    public String ricercaEmailRespQuest(ResponsabileQuestionario r){
        String e;
        return e;
    } 
    
}