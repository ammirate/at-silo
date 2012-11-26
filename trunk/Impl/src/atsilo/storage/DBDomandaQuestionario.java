package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Psicopedagogo;

import atsilo.entity.Questionario;

import java.util.List;

public class DBDomandaQuestionario extends DBBeans {
    Tabella tabella;
    /**
     * 
     * @param db
     */
    public DBDomandaQuestionario(Database db){super("DomandaQuestionario",db);}
    
    
        public DomandaQuestionario ricercaDomandaQuestionarioPerId(String id){}
        
}       