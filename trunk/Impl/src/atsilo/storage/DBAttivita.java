package atsilo.storage;

import atsilo.entity.Attivita;
import atsilo.entity.ProgrammaEducativoSettimanale;
import atsilo.entity.Registro;

public class DBAttivita extends DBBeans {
    
    public DBAttivita(Database db){
        super("Attivita",db);
    }
    
    public Attivita ricercaAttivitaTitolo(String titolo){
        Attivita a;
        return a;
    }
    
    public Attivita ricercaAttivitaCategoria(String cat){
        Attivita a;
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
    

}