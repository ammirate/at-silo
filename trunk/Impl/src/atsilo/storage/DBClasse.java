package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.Bambino;

public class DBClasse extends DBBeans<Classe> 
{
    /**
     * Costruttore
     * @param db
     */
    public DBClasse(Database db){super("Classe",db);}

    public Classe RicercaClassePerId (String id){}
    
    
    
    
}