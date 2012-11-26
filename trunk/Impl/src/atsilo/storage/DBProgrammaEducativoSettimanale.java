package atsilo.storage;

import atsilo.entity.Attivita;
import atsilo.entity.Feedback;
import atsilo.entity.MenuMensa;
import atsilo.entity.ProgrammaEducativoSettimanale;

import atsilo.entity.Tirocinante;

import java.sql.Date;

import java.util.List;

public class DBProgrammaEducativoSettimanale extends DBBeans {
    
    public DBProgrammaEducativoSettimanale(Database db){
        super("ProgrammaEducativoSettimanale",db);
    }
     public List<ProgrammaEducativoSettimanale> ricercaProgrammaEducativoSettimanalePerAttivita(Attivita attivita){
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