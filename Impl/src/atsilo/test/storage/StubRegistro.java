package atsilo.test.storage;

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
    Registro r,r1,r2;
    EducatoreDidattico maestra;
    
    public StubRegistro(){
        maestra = new EducatoreDidattico(null, "antonio", "cesarano", "csrntn91l26c129j", "email@email.com", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
       
        r = new Registro(1,null,1,maestra);
        r1 = new Registro(2,null,2,maestra);
        r2 = new Registro(1,null,3,maestra);
    }
        
    public boolean inserisciRegistroNelDatabase(Registro registro){
        return true;
    }
    
    public boolean assegnaRegistroAClasse(int idRegistro, int i){
        return false;
    }


    public Registro ricercaRegistroPerClasse(Classe classe){
        
            return r;
    }
        
    public Registro ricercaRegistroPerAnno(Date d){
        return r;
    }
    
    public List<EducatoreDidattico> ricercaEducatoriDidattici(){
        List<EducatoreDidattico> l = new ArrayList<EducatoreDidattico>();
        l.add(maestra);
        return l;
    }   

}