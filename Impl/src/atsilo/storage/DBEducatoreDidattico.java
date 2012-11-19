package atsilo.storage;

import atsilo.entity.EducatoreDidattico;

public class DBEducatoreDidattico extends DBBeans {
    Tabella tabella;
    
    public DBEducatoreDidattico(){
        tabella= new Tabella("EducatoreDidattico");
        super(tabella);
    }}
    public EducatoreDidattico ricercaEducatoreDidatticoNome(String nome){
    EducatoreDidattico ed;
    return ed;
    }

    public EducatoreDidattico ricercaEducatoreDidatticoTitoloStudio(String titoloS){
    EducatoreDidattico ed;
    return ed;
    }
    
    public EducatoreDidattico ricercaEducatoreDidatticoCf(String cf){
    EducatoreDidattico ed;
    return ed;
    }
    
    public EducatoreDidattico ricercaEducatoreDidatticoCognome(String cf){
    EducatoreDidattico ed;
    return ed;
    }
   
    

    
}