package atsilo.storage;
/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBProgrammaEducativoSettimanale.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 *///TODO da implementare priorità bassa
import atsilo.entity.Attivita;
import atsilo.entity.Feedback;
import atsilo.entity.MenuMensa;
import atsilo.entity.ProgrammaEducativoSettimanale;

import atsilo.entity.Tirocinante;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;
import java.util.Map;

public class DBProgrammaEducativoSettimanale extends DBBeans {
    
    public DBProgrammaEducativoSettimanale(Database db){
        super("programma_educativo_settimanale",db);
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
    /**
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() {
        // TODO Scheletro generato automaticamente
        return null;
    }
    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {
        // TODO Scheletro generato automaticamente
        return null;
    }
    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Object creaBean(ResultSet r) throws SQLException {
        // TODO Scheletro generato automaticamente
        return null;
    }
}