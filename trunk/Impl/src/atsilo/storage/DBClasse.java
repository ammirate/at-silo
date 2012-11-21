package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.Bambino;

public class DBClasse extends DBBeans 
{
    
    public DBClasse(Database db)
    {
        super("Classe",db);
    }

    public Classe RicercaClassePerId (String id) 
    {
        Classe classe;
        return classe;
    }
    
    
    
    
}