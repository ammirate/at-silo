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
 * Fabio Napoli, 05/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package test.storage;


//testate DBCompilaQuestionario,DBDomandaQuestionario,DBQuestionario,DBCampoDomandaQuestionario
//DBRispostaQuestionario
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.CompilaQuestionario;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;
import atsilo.storage.DBCampoDomandaQuestionario;
import atsilo.storage.DBCompilaQuestionario;
import atsilo.storage.DBDomandaQuestionario;
import atsilo.storage.DBQuestionario;
import atsilo.storage.DBRispostaQuestionario;
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
      /* int i=dbc.getNumeroCompilazioniQuestionario(1);
      
      System.out.println(i);*/
      
      //============test===isCompilatoda ok======
      
    //  boolean risBool=dbc.isCompilatoDa(2,"CVLMRA69A23B333C");
   //   System.out.println("Risultato Bool"+risBool);
      
      //_______________testgetGenitorePerquestionariocompilato___
      
    /*  List<String> l=dbc.getGenitoriPerQuestionarioCompilato(2);
      int index=0;
      for(index=0;index<l.size();index++)
         System.out.println(l.get(index));
      */
      /*
       *______________testGetQuestionariPerGenitore
      List<Integer> l=dbc.getQuestionariCompilatiPerGenitore("asdGPP69A23B222C");
      int index=0;
      for(index=0;index<l.size();index++)
         System.out.println(l.get(index));*/
      
      //_____________Test___Classe__DBDomandaQuestionario
    //___test___getDomanda()
      DBDomandaQuestionario dbd= new DBDomandaQuestionario(db);
      
      /*DomandaQuestionario d=dbd.getDomanda(4);
      System.out.println("stampaDescrizioneDomanda"+d.getDescrizione());*/
      //________test____getDomandeQuestionario
     /* List<DomandaQuestionario>l=dbd.getDomandeQuestionario(2);
     int index=0;
      for(index=0;index<l.size();index++)
          System.out.println(l.get(index).getDescrizione());
*//*TEST_metodo_isDomandaInQUestionario()
     boolean f=dbd.isDomandaInQuestionario(6, 1);
     System.out.println(f);
      */
      
      
      //__testClasseDBRispostaQuerstionario___metodo___getRispostaGenitore
      DBRispostaQuestionario dbr=new DBRispostaQuestionario(db);
      List<RispostaQuestionario> l=dbr.getRisposteGenitore("CVLMRA69A23B333C");
      //for(int i=0;i<l.size();i++)
      //    System.out.println("Risposta Codice _ "+l.get(i).getId());
      //test_____getRisposteDomandaSpecifica
     // l=dbr.getRisposteDomandaSpecifica(5);
     
     // for(int i=0;i<l.size();i++)
        //  System.out.println("Risposta Codice _ "+l.get(i).getValore());
      l=dbr.getRisposteQuestionarioPerGenitore("CVLMRA69A23B333C", 1);
     // for(int i=0;i<l.size();i++)
       //   System.out.println("Risposta valore _ "+l.get(i).getValore());
    //___testDBCampoDomandaQuestionario
      DBCampoDomandaQuestionario dbcd=new DBCampoDomandaQuestionario(db);
      List<CampoDomandaQuestionario> ll=dbcd.getCampiDomandaQuestionario(8);
      for(int i=0;i<ll.size();i++)
           System.out.println("CampoDOmanda _ "+ll.get(i).getValore());
      
      db.chiudiConnessione();
    
    }
    
    
   
}
