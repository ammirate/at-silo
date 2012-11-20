package atsilo.storage;
import java.util.*;
import java.util.Date;
import atsilo.entity.Classe;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.Questionario;
import atsilo.entity.Registro;

public class DBRegistro extends DBBeans 
{
    Tabella tabella;
    
    public DBRegistro(){
        tabella= new Tabella("Registro");
        super(tabella);
    }
        
        public Registro ricercaRegistroPerClasse(Classe c){
            Registro p;
            return p;
        }
        
    public Registro ricercaRegistroPerAnno(Date d){
        Registro p;
        return p;
    }
    
    public List<EducatoreDidattico> ricercaEducatoriDidattici(){
        List<EducatoreDidattico> l;
        return l;
        

}