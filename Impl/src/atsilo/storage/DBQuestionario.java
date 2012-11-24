package atsilo.storage;

import atsilo.entity.Questionario;
import java.util.Date;
import java.util.List;
public class DBQuestionario extends DBBeans
{
    Tabella tabella;
    
    public DBQuestionario(Database db){
        
        super("Questionario",db);
    }
    
    public void ModificaPeriodoInizio(Date d){}
    
    public void ModificaPeriodoFine(Date d){}
    

    public List<Questionario> ricercaQuestionariPerPeriodoInizio (Date d){}
    public List<Questionario> ricercaQuestionarioPerPeriodoFine(Date d) {}
    public List<Questionario> ricercaQuestionarioPerNome(String nome){}
}