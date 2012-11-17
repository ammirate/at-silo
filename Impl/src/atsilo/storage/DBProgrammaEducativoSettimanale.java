package atsilo.storage;

import atsilo.entity.ProgrammaEducativoSettimanale;

public class DBProgrammaEducativoSettimanale extends DBBeans {
    Tabella tabella;
    
    public DBProgrammaEducativoSettimanale(){
        tabella= new Tabella("ProgrammaEducativoSettimanale");
        super(tabella);
    }}