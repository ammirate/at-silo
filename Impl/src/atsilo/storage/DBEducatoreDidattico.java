package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.EducatoreDidattico;

import java.util.List;

public class DBEducatoreDidattico extends DBBeans {
    Tabella tabella;
    
    public DBEducatoreDidattico(){
        tabella= new Tabella("EducatoreDidattico");
        super(tabella);
    }
    
    public List<Classe> ricercaClassiInsegnate(EducatoreDidattico e){
        List<Classe> c;
        return c;
    }
    
 
    public List<EducatoreDidattico> ricercaEducatoreDidatticoPerTitoloStudio(String titoloS){
    List<EducatoreDidattico> ed;
    return ed;
    }
    
    public EducatoreDidattico ricercaEducatoreDidatticoPerCf(String cf){
    EducatoreDidattico ed;
    return ed;
    }
    
    public List<EducatoreDidattico> ricercaEducatoreDidatticoPerCognome(String cf){
    List<EducatoreDidattico> ed;
    return ed;
    }
   
    

    
}