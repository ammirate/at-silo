package atsilo.storage;

import atsilo.entity.Questionario;
import java.util.Date;
public class DBQuestionario extends DBBeans
{
    Tabella tabella;
    
    public DBQuestionario(){
        tabella= new Tabella("Questionario");
        super(tabella);
    }
    
    public void ModificaPeriodoInizio(Date d){}
    
    public void ModificaPeriodoFine(Date d){}
    

    public List<Questionario> ricercaQuestionariPerPeriodoInizio (Deta d){}
    public List<Questionario> ricercaQuestionarioPerPeriodoFine(Deta d) {}
    public Questionario ricercaQuestionarioPerNome(String nome){}
}


