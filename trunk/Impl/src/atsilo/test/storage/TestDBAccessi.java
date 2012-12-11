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

package atsilo.test.storage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import atsilo.entity.Bambino;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Genitore;
import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.ResponsabileQuestionario;
import atsilo.entity.Tirocinante;
import atsilo.storage.DBBambino;
import atsilo.storage.DBDomandaIscrizione;
import atsilo.storage.DBEducatoreDidattico;
import atsilo.storage.DBGenitore;
import atsilo.storage.DBPersonaleAsilo;
import atsilo.storage.DBPsicopedagogo;
import atsilo.storage.DBQuestionario;
import atsilo.storage.DBResponsabileQuestionario;
import atsilo.storage.DBTirocinante;
import atsilo.storage.Database;

/**
 * Classe TestDBAccessi
 * <Descrizione classe>
 * 
 * @author fabio Napoli
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
      
    /*  List<Genitore> g=dbg.getGenitoriPerCategoriaAppartenenza("Miao");
      
      for(int i=0;i<g.size();i++){
          System.out.println("Codice Fiscale : = "+g.get(i).getCodiceFiscale());
      }
      //test_metodo_getCategoriaAppartenenza
      Genitore h=dbg.getGenitorePerCF("DRGSNT81A26B045C");
      System.out.println("dati genitore ricercato : = "+h.getCategoriaAppartenenza()+h.getEmail()+h.getIndirizzoResidenza()+h.getTipo());
      
      String s=dbg.getCategoriaAppartenenzaGenitore("CVLMRA69A23B333C");
      System.out.println("Cat appartenenza := "+s);*/
        //test___Classi_DBPsicopedagogo_e_DBEducatoreDidattico
        DBPsicopedagogo dbp=new DBPsicopedagogo(db);
       /* Psicopedagogo p=new Psicopedagogo();
        p=dbp.getPsicopedagogoPerCF("VRRMDD64T32A048N");
        System.out.println("Dati Psicopedagogo = "+p.getCognome()+p.getNome()+p.getEmail());*/
      
        DBEducatoreDidattico dbe=new DBEducatoreDidattico(db);
        /* EducatoreDidattico p=new EducatoreDidattico();
         p=dbe.getEducatoreDidatticoPerCF("SSSLRL78B19B908X");
         System.out.println("Dati Educatore = "+p.getCognome()+p.getNome()+p.getEmail());
        */
        DBDomandaIscrizione dbi=new DBDomandaIscrizione(db);
        
       DomandaIscrizione d = new DomandaIscrizione();
       /* d= dbi.ricercaDomandaDaBambino("MSCLGU12A24T928B");
      /*  System.out.println("DomandaIscrizione ID = "+d.getId());
        System.out.println("DomandaIscrizione punteggio = "+d.getPunteggio());
        System.out.println("DomandaIscrizione genitore = "+d.getGenitore().getCodiceFiscale());*/
       /* List<DomandaIscrizione> l= dbi.ricercaDomandaDaGenitore("PSSSN4385L98A980I");
        for(int i=0;i<l.size();i++){
          
            System.out.println("Id domanda "+i+ " : = "+l.get(i).getId());*/
      //  }
       /* d= dbi.ricercaDomandaDaId(3);
        System.out.println("DomandaIscrizione punteggio = "+d.getPunteggio());
        System.out.println("DomandaIscrizione genitore = "+d.getGenitore().getCodiceFiscale());
*/
       DBBambino dbb=new DBBambino(db);
       
      /* List<Bambino> l= dbb.ricercaFigliGenitore("PSSSNN85L98A980I");
       for(int i=0;i<l.size();i++){
           System.out.println("Bambino Nome := "+l.get(i).getNome());
           System.out.println("Bambino CogNome := "+l.get(i).getCognome());
           System.out.println("Bambino CodiceFisclae := "+l.get(i).getCodiceFiscale());
           
       
           

       }
       */
      Bambino b=new Bambino();
       b=dbb.ricercaBambinoPerCodFiscale("DBNLCU11A23B222C");
       System.out.println("Bambino Nome := "+b.getNome());
       System.out.println("Bambino CogNome := "+b.getCognome());
       System.out.println("Bambino CodiceFisclae := "+b.getCodiceFiscale());
       
       int c=0;
       
       c=dbb.ricercaClasseBambino("DBNLCU11A23B222C");
       
       System.out.println("id classe "+c);
       
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
