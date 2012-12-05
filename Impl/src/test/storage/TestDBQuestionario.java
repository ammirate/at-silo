/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: TestDBQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio, 05/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package test.storage;



import java.sql.SQLException;
import java.util.Iterator;

import atsilo.entity.CompilaQuestionario;
import atsilo.entity.Questionario;
import atsilo.storage.DBCompilaQuestionario;
import atsilo.storage.DBQuestionario;
import atsilo.storage.Database;

/**
 * Classe TestDBQuestionario
 * <Descrizione classe>
 * 
 * @author Antonio
 * 
 */
public class TestDBQuestionario {
    
    /**
     * @param args
     * @throws SQLException 
     */
    public static void main(String[] args) throws SQLException  {
        // TODO Scheletro generato automaticamente
        
        
        Database db=new Database();
        db.apriConnessione();
        DBQuestionario q=new DBQuestionario(db);
        
        /*
        
      Iterable<Questionario> i;
    
        i = q.getAll();
        Iterator<Questionario> it = i.iterator();
        
        while(it.hasNext())
        {
            Questionario dbq=it.next();
            System.out.println("ALL QUESTIONARI "+dbq.getDescrizione());
        }
        
        
        
       Iterable<Questionario> ii;
       ii=q.visualizzaQuestionariCompilabili();
       
       Iterator<Questionario> iit=ii.iterator();
       
       while(iit.hasNext())
       {
           Questionario dbqq= iit.next();
           System.out.println("QUESTIONARI COMPILABILI "+dbqq.getDescrizione());
       }
       
       
     
      
      Questionario iii=q.getQuestionario(3);
      System.out.println("QUESTIONARIO DA ID "+iii.getDescrizione());
      
     
   
      Iterable<Questionario> iq;
      iq=q.ricercaQuestionariPerNome("Controllo");
      
      Iterator<Questionario> itq=iq.iterator();
      
      while(itq.hasNext())
      {
          Questionario dbb= itq.next();
          System.out.println("Questionario da nome"+dbb.getDescrizione());
      }
      
     
      //=================Numero===persone==che==hanno==compilato==un==questionario=======================
    */
    
      DBCompilaQuestionario dbc=new DBCompilaQuestionario(db);
       int i=dbc.getNumeroCompilazioniQuestionario(1);
      
      System.out.println(i);
      
      //============test===isCompilatoda======
      
      db.chiudiConnessione();
      
    }
   
}
