package test.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import atsilo.entity.Questionario;

public class StubQuestionario {
   
        List<Questionario> l;
      
        //costruttore
        public StubQuestionario() {
            l = new ArrayList<Questionario>();
            
        }
    
        
        
        public void inserisci(Questionario q){
            //simulo inserimento nel database
        }
        
        
        
        
        
        public List<Questionario> ricercaQuestionariPerNome (String n) throws SQLException{
            
             List<Questionario> list = new ArrayList<Questionario>();
             
             Date dataInizio = new Date(2012, 1, 1);
             Date dataFine = new Date(2012,3,31);
             Questionario q = new Questionario("inizio anno", "no", "inizio", 1, dataInizio, dataFine);
            
             if(n==q.getNome())
                list.add(q);
             return list;
         }
         
        
        
         
         
         public List<Questionario> visualizzaQuestionariCompilabili() throws SQLException{
            
             List<Questionario> l= new ArrayList<Questionario>();

             Date dataInizio = new Date(2012, 1, 1);
             Date dataFine = new Date(2012,3,31);
             Questionario q = new Questionario("inizio anno", "no", "inizio", 1, dataInizio, dataFine);
             Questionario q1 = new Questionario("meta anno", "no", "meta", 2, dataInizio, dataFine);
             l.add(q);
             l.add(q1);
             return l;
         }
            
       
         
         
         
          public Questionario getQuestionario(int idQuestionario) throws SQLException{
              

              Date dataInizio = new Date(2012, 1, 1);
              Date dataFine = new Date(2012,3,31);
              Questionario q = new Questionario("inizio anno", "no", "inizio", 1, dataInizio, dataFine);
              if(idQuestionario==q.getId())
                  return q;
              throw new SQLException("non c'è!");

          }
         
        
         
     
    
}
