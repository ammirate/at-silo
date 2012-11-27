package test.storage;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import atsilo.entity.Classe;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Registro;
import atsilo.storage.DBBeans;
import atsilo.storage.Database;
import atsilo.storage.Tabella;

public class StubRegistro
{
    Registro r;
    Database database;
    
    public StubRegistro(Database db){
        database=db;
        r = new Registro();
    }
        
    public boolean inserisciRegistroNelDatabase(Registro registro){
        return true;
    }
    
    public boolean assegnaRegistroAClasse(Registro registro, Classe classe){
        return false;
    }


    public Registro ricercaRegistroPerClasse(Classe c){
            return r;
    }
        
    public Registro ricercaRegistroPerAnno(Date d){
        return r;
    }
    
    public List<EducatoreDidattico> ricercaEducatoriDidattici(){
        List<EducatoreDidattico> l = new ArrayList<EducatoreDidattico>();
        return l;
    }   

}