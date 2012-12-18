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

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import atsilo.entity.Account;
import atsilo.entity.Bambino;
import atsilo.entity.Bando;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Evento;
import atsilo.entity.Genitore;
import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.ResponsabileQuestionario;
import atsilo.entity.Tirocinante;
import atsilo.entity.Utente;
import atsilo.storage.DBAccount;
import atsilo.storage.DBBambino;
import atsilo.storage.DBBando;
import atsilo.storage.DBDomandaIscrizione;
import atsilo.storage.DBEducatoreDidattico;
import atsilo.storage.DBEvento;
import atsilo.storage.DBGenitore;
import atsilo.storage.DBPartecipa;
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
     /* List<String> l=dbb.getGenitoriBambino("MSCLGU12A24T928s");
      Bambino b=new Bambino();
      
      for(int i=0;i<l.size();i++){
          System.out.println(l.get(i));
      }
     /*  b=dbb.ricercaBambinoPerCodFiscale("DBNLCU11A23B222C");
       System.out.println("Bambino Nome := "+b.getNome());
       System.out.println("Bambino CogNome := "+b.getCognome());
       System.out.println("Bambino CodiceFisclae := "+b.getCodiceFiscale());
       
       int c=0;
       
       c=dbb.ricercaClasseBambino("DBNLCU11A23B222C");
       
       System.out.println("id classe "+c);*/
      DBBando dbbb=new DBBando(db);
     /* Bando bando=new Bando();
      bando=dbbb.cercaBandoPerId(3);
      if (bando==null)
          System.out.println("Non esiste alcun bando con quell id");
      else{
      System.out.println("id bando : = "+bando.getId());
      System.out.println("posti bansdo"+bando.getPostiDisponibili());
      System.out.println("dataFinePresentazioneRinuncia"+bando.getDataFinePresentazioneRinuncia());
      }
       
      bando=dbbb.getBando();
      if (bando==null)
          System.out.println("Non esiste alcun bando con quell id");
      else{
      System.out.println("id bando : = "+bando.getId());
      System.out.println("posti bansdo"+bando.getPostiDisponibili());
      System.out.println("dataFinePresentazioneRinuncia"+bando.getDataFinePresentazioneRinuncia());
      }*/
      DBAccount dba=new DBAccount(db);
     // Account a=dba.ricercaPerUsername("l.vella");
      /*if(a==null){
          System.out.println("Account inesistente");
      }
      else{
      System.out.println("Ciao "+a.getOwner().getCodiceFiscale());
      System.out.println("Ciao "+a.getUserName());
      System.out.println("Ciao "+a.getPassWord());}*/
      
    /*  Account a=dba.ricercaPerCodiceFiscale("VRRMDD64T32A048N");
      if(a==null){
          System.out.println("Account inesistente");
      }
      else{
      System.out.println("Ciao "+a.getOwner().getCodiceFiscale());
      System.out.println("Ciao "+a.getUserName());
      System.out.println("Ciao "+a.getPassWord());}
*/
      DBEvento dbE = new DBEvento(db);
      Evento e = dbE.ricercaEventoPerChiave(2);
      System.out.println(" Test metodo ricercaPerChiave()");

      System.out.println(" Evento preso : = "+e.getDescrizione());
      
      Utente u= dbE.ricercaEventPlannerEvento(2);
      System.out.println(" Test metodo ricercaPerChiave()");

      System.out.println("EventPlannerEvento "+u.getCodiceFiscale());
      
      List<Evento> ev = dbE.ricercaAllEventi();
      
      for(int i=0;i<ev.size();i++){
          System.out.println(" Evento "+i + " = " +ev.get(i).getDescrizione());
      }  
      
      DBPartecipa p= new DBPartecipa(db);
      
      List<Integer> l1 = p.getClassiPerEvento(2);
      System.out.println(" Test metodo classiperevento");

      for(int i=0;i<l1.size();i++){
         
          System.out.println(" Classe =  "+i + " = " +l1.get(i));
      }
           
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
