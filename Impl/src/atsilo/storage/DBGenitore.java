package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.Genitore;

import java.util.List;

public class DBGenitore extends DBBeans {
    Tabella tabella;
    
    public DBGenitore(){
        tabella= new Tabella("Genitore");
        super(tabella);
    }
    
    public Genitore ricercaGenitorePerCf(String cf){
        Genitore g;
        return g;
    }
    
    public List<Genitore> ricercaGenitorePerComune(String comune){
        List<Genitore> g;
        return g;
    }
    
    public String ricercaEmailGenitore(Genitore g){
        String s;
        return s;
    }
    
    public Bambino ricercaFiglio(){
        Bambino b;
        return b;
    }
    
    public String getTipoGenitore(Genitore g){
        String s;
        return s;
    }
    
    
    
        
}

    