package atsilo.storage;

import atsilo.entity.Attivita;
import atsilo.entity.ProgrammaEducativoSettimanale;
import atsilo.entity.Registro;

import java.util.List;

public class DBAttivita extends DBBeans {
    Tabella tabella;
    
    public DBAttivita(){
        tabella= new Tabella("Attivita");
        super(tabella);
    }
    
    public List<Attivita> ricercaAttivitaTitolo(String titolo){
        List<Attivita> a;
        return a;
    }
    
    public List<Attivita> ricercaAttivitaPerCategoria(String cat){
        List<Attivita> a;
        return a;
    }
    
    public ProgrammaEducativoSettimanale ricercaProgrammaEducativoDiAppartenenza(Attivita a){
        ProgrammaEducativoSettimanale p;
        return p;
    }
    
    public Registro ricercaRegistroDiAppartenenza(Attivita a){
        Registro p;
        return p;
    }
    
    public String ricercaCategoriaAppartenenza(Attivita a){
        String s;
        return s;
    }
    

}