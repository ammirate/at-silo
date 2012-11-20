package atsilo.storage;

import atsilo.entity.Attivita;
import atsilo.entity.Feedback;
import atsilo.entity.MenuMensa;
import atsilo.entity.ProgrammaEducativoSettimanale;

import atsilo.entity.Tirocinante;

import java.sql.Date;

import java.util.List;

public class DBProgrammaEducativoSettimanale extends DBBeans {
    Tabella tabella;
    
    public DBProgrammaEducativoSettimanale(){
        tabella= new Tabella("ProgrammaEducativoSettimanale");
        super(tabella);
    }
     public List<ProgrammaEducativoSettimanale> ricercaProgrammaEducativoSettimanalePerAttività(Attivita attivita){
        List<ProgrammaEducativoSettimanale> programmi;
        return  programmi;   
        }

     public List<ProgrammaEducativoSettimanale> ricercaProgrammaEducativoSettimanalePerSettimana(Date data){
        List<ProgrammaEducativoSettimanale> programmi;
        return  programmi;   
        }
     public List<ProgrammaEducativoSettimanale> ricercaProgrammaEducativoSettimanalePerObbiettivoSettimanale(String ObbiettivoSettimanale){
        List<ProgrammaEducativoSettimanale> programmi;
        return  programmi;   
        }
}