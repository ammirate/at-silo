package atsilo.storage;

import atsilo.entity.PersonaleAsilo;

public class DBPersonaleAsilo extends DBBeans {
    
    public DBPersonaleAsilo(Database db)
    {
        super("PersonaleAsilo",db);
    }

    public PersonaleAsilo CercaPerCategoria 
        {
         PersonaleAsilo personale;
         return personale;
        }
}