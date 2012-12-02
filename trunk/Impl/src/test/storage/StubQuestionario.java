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
         /**
          * Ricerca nel database un questionario a 
          * seconda del nome fornito in input.
          * Il metodo provvede a caricare un istanza di una lista di Questionari 
          * @param n      Nome del questionario da ricercare
          * @return lista di questionario oppure Null
          * @throws SQLException
          */
        public List<Questionario> ricercaQuestionariPerNome (String n) throws SQLException{
            
             List<Questionario> list = new ArrayList<Questionario>();
             
             Date dataInizio = new Date(2012, 1, 1);
             Date dataFine = new Date(2012,3,31);
             Questionario q = new Questionario("inizio anno", "no", "inizio", 1, dataInizio, dataFine);
            
             if(n==q.getNome())
                list.add(q);
             return list;
         }
         
         /**
          * Ricerca nel database la lista dei questionari
          * che possono essere compilati.
          * Il metodo provvede a caricare un istanza di una lista di Questionario
          * @return lista di questionario oppure Null
          * @throws SQLException
          */
         
         public List<Questionario> visualizzaQuestionariCompilabili() throws SQLException{
            
             List<Questionario> l=null;

             Date dataInizio = new Date(2012, 1, 1);
             Date dataFine = new Date(2012,3,31);
             Questionario q = new Questionario("inizio anno", "no", "inizio", 1, dataInizio, dataFine);
             l.add(q);
             return l;
         }
            
         /**
          * Ricerca nel database un questionario a secondo dell'
          *  id fornito in input.
          * Il metodo provvede a caricare un istanza di un Questionario
          * @param idQuestionario Id del questionario da ricercare
          * @return questionario oppure Null
          * @throws SQLException
          */
          public Questionario getQuestionario(int idQuestionario) throws SQLException{
              

              Date dataInizio = new Date(2012, 1, 1);
              Date dataFine = new Date(2012,3,31);
              Questionario q = new Questionario("inizio anno", "no", "inizio", 1, dataInizio, dataFine);
              if(idQuestionario==q.getId())
                  return q;
              throw new SQLException("non c'è!");

          }
         
        
         
     
    
}
