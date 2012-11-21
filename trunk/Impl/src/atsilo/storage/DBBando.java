package atsilo.storage;

import atsilo.entity.Bando;

public class DBBando extends DBBeans 
{
    
    public DBBando(Database db)
    {
        super("Bando",db);
    }
    
    public Bando cercaBandoPerId (String id) 
    {
        Bando ObjBando;
       return ObjBando; 
    }
    
    public Bando cercaPerDataInizio (String dataInizio) 
    {
        Bando ObjBando;
        return ObjBando;
     }
    
    public Bando cercaPerDataFine (String dataFine) 
    {
        Bando ObjBando;
        return ObjBando;
    }
}