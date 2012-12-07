/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: TestDBAccessi.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * fabio, 06/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package test.storage;

import java.sql.SQLException;
import java.util.List;

import atsilo.entity.Genitore;
import atsilo.entity.PersonaleAsilo;
import atsilo.entity.ResponsabileQuestionario;
import atsilo.entity.Tirocinante;
import atsilo.storage.DBGenitore;
import atsilo.storage.DBPersonaleAsilo;
import atsilo.storage.DBQuestionario;
import atsilo.storage.DBResponsabileQuestionario;
import atsilo.storage.DBTirocinante;
import atsilo.storage.Database;

/**
 * Classe TestDBAccessi
 * <Descrizione classe>
 * 
 * @author fabio
 * 
 */
public class TestDBAccessi {
    
    /**
     * @param args
     * @throws SQLException 
     */
    public static void main(String[] args) throws SQLException {
        // TODO Scheletro generato automaticamente
        Database db=new Database();
        db.apriConnessione();
        
        DBPersonaleAsilo q=new DBPersonaleAsilo(db);
        //___testClasseDBPersonaleAsilo
       
        //metodo_getPersonaleAsiloPerCf
       /* PersonaleAsilo a=q.getPersonaleAsiloPerCF("MRSVRN90A32B235B");
        System.out.println("Nome : "+a.getCognome());
        System.out.println("Nome : "+a.getNome());
*/
        //metodo_getCategoriaAppartenenzaPersonaleAsilo
      /* String s=q.getCategoriaAppartenenzaPersonaleAsilo("MRSVRN90A32B235B");
       System.out.println("Eccoti la cat : "+s);*/
      /*metodo_getTirocinantePerCf*/
        
        /*DBTirocinante dbt=new DBTirocinante(db);
        Tirocinante t=dbt.getTirocinantePerCF("MZZCRS91L44X098Y");
        System.out.println("Tirocinante : ="+t.getCapDomicilio()+t.getTelefono()+t.getEmail());
       */
        //testClasseDBResponsabileQuestionario_
        //metodo_getResponsabileQuestionarioPerCF
        DBResponsabileQuestionario dbrq=new DBResponsabileQuestionario(db);
        
      /* ResponsabileQuestionario res=new ResponsabileQuestionario();
       res= dbrq.getResponsabileQuestionarioPerCF("NPLFBA91D03H703H");
       System.out.println("Email e altro RESQUEst ="+res.getCognome()+res.getEmail());*/
      /*___test_classe_DBGenitore
       * test_metodo_getGenitoriPerCategoriaAppartenenza
       */
        DBGenitore dbg=new DBGenitore(db);
      
      List<Genitore> g=dbg.getGenitoriPerCategoriaAppartenenza("Miao");
      
      for(int i=0;i<g.size();i++){
          System.out.println("Codice Fiscale : = "+g.get(i).getCodiceFiscale());
      }
      //test_metodo_getCategoriaAppartenenza
      Genitore h=dbg.getGenitorePerCF("DRGSNT81A26B045C");
      System.out.println("dati genitore ricercato : = "+h.getCategoriaAppartenenza()+h.getEmail()+h.getIndirizzoResidenza()+h.getTipo());
      
      String s=dbg.getCategoriaAppartenenzaGenitore("CVLMRA69A23B333C");
      System.out.println("Cat appartenenza := "+s);
      db.chiudiConnessione();

    }
    //Logger
    /*
     * private static final java.util.Logger LOG
     *         = Logger.getLogger(TestDBAccessi.class.getName());
     */
    
    //Variabili di istanza
    
    
    //Costruttori
    
    
    //Metodi
}
