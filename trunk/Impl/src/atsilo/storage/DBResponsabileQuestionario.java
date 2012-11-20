package atsilo.storage;

import atsilo.entity.ResponsabileQuestionario;

public class DBResponsabileQuestionario extends DBBeans {
    
    public DBResponsabileQuestionario(Database db){
        super("ResponsabileQuestionario",db);
    }
    
    public ResponsabileQuestionario ricercaRespQuestNome(String nome){
        ResponsabileQuestionario r;
        return r;
    }
    
    public ResponsabileQuestionario ricercaRespQuestCf(String cf){
        ResponsabileQuestionario r;
        return r;
    }
    
    public String ricercaEmailRespQuest(String cf){
        String e;
        return e;
    } 
    
}