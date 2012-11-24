package atsilo.storage;

import atsilo.entity.EducatoreDidattico;

public class DBEducatoreDidattico extends DBBeans {
    /**
     * Costruttore
     * @param db
     */
    public DBEducatoreDidattico(Database db){ super("EducatoreDidattico",db);}
    
    public EducatoreDidattico ricercaEducatoreDidatticoPerNome(String nome){}

    public EducatoreDidattico ricercaEducatoreDidatticoPerTitoloStudio(String titoloS){}
    
    public EducatoreDidattico ricercaEducatoreDidatticoPerCf(String cf){}
    
    public EducatoreDidattico ricercaEducatoreDidatticoPerCognome(String cf){}
   
    
}