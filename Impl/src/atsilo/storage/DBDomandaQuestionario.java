package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Psicopedagogo;

import atsilo.entity.Questionario;

import java.util.List;

public class DBDomandaQuestionario extends DBBeans {
    Tabella tabella;
    
    public DBDomandaQuestionario(){
        tabella= new Tabella("DomandaQuestionario");
        super(tabella);
    }
        public DomandaQuestionario ricercaDomandaQuestionarioPerId(String id){
            DomandaQuestionario c;
            return c;}
        public void modificaDescrizione(String d){}
        }