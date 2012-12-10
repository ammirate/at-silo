/**
 * Progetto \@silo
 * Copyleft
 * @author Angelo SCafuro
 */
package atsilo.test.storage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Logger;

import atsilo.entity.Account;
import atsilo.entity.Bando;
import atsilo.entity.Utente;
import atsilo.storage.DBAccount;
import atsilo.storage.DBBando;
import atsilo.storage.Database;
import atsilo.storage.ManagerDB;
import atsilo.storage.Tabella;

/**
 * Classe TestStorageDBAccount
 * <Descrizione classe>
 * 
 * @author Angelo
 * 
 */
public class TestStorageDBAccount {
    
    /**
     * @param args
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
     * @throws SQLException 
     */
    public static void main(String[] args) throws IllegalArgumentException, IllegalAccessException, SQLException {
        Database database;
        Account account1;
       DBBando gestoreBando;
        DBAccount gestoreAccount;
        Bando bando;
        Tabella tabella;
        
        database=new Database();
        //prove varie apertura, chiusura e riapertura database
        //Errore corretto
        if (database.apriConnessione())
            LOG.info("1Connessione riuscita");
        if (  database.isOpen())
          LOG.info("2Connessione aperta");
            database.chiudiConnessione();
        if (  database.isOpen())
          LOG.info("3Connessione aperta");
        if (database.apriConnessione())
            LOG.info("6Connessione riuscita");
        if (  database.isOpen())
            LOG.info("7Connessione aperta");
  
    /* creazione account        FALLITO
        gestoreAccount = new DBAccount("account", database);
        account1=new Account();
        account1.setUserName("angelosca");
        account1.setPassWord("fattiifattituoi");
        Utente owner=new Utente();
        owner.setCodiceFiscale("scnlg91h20a488a");
        account1.setOwner(owner);
        //String query=("insert into account (username,password) values ('"+account1.getUserName()+"','"+account1.getPassWord()+"')");
         gestoreAccount.inserisci(account1);
       
        */
      /* prove query direttamente sul DB     PASS
       * Introdotto preparedStatement e modificati metodi
       * 
        // System.out.println(query);
        //ResultSet result = database.eseguiQuerySpecifica(query);
        //System.out.println(result); 
         
        //Boolean result = database.eseguiQueryB("UPDATE account SET password='angelo' WHERE username='a.damelia' ");
        Boolean result = database.eseguiQueryB("SELECT * FROM account ");
        Boolean result = database.eseguiQueryB("UPDATE account SET password='angelo' WHERE username='a.damelia' ");
        System.out.println(result); 
           
         ResultSet result = database.eseguiQueryRS("UPDATE account SET password='angelo' WHERE username='a.damelia' ");
        System.out.println(result); 
        /*
        ResultSet r2 = database.eseguiQueryRS("select * from account ");
         System.out.println(r2);
        // ResultSet k = database.getChiavi("Account");
        // System.out.println(k);
      
      /*
       * test classe tabella
       
        tabella=new Tabella("Bando", database);
        ArrayList<String> temp = tabella.getChiaviPrimarie();
        for (int i=0;i<temp.size();i++)
            System.out.println(temp.get(i));//stampa id OK
        */
        
   
        /*  TEST FALLITO DA RICONTROLLARE
        tabella=new Tabella("Bando", database);
        ArrayList<String> t=new ArrayList<String>();
        t.add("id");
        t.add("data_inizio");
        ArrayList<String> temp = tabella.getTipoColonne(t); NON RESTITUISCE TIPO GIUSTO
        for (int i=0;i<temp.size();i++)
            System.out.println(temp.get(i));//stampa id OK

       */
            
      
       // tabella.eseguiQuerySpecifica("select * from bando");OK
        /* Creazione e test bando
         * 
         */
        bando=new Bando();
       
       bando.setiD(85);
       bando.setDataInizio("2011-10-20");
       bando.setDataFine("2012-09-20");
      Bando bando2 = new Bando();
      
      bando2.setiD(15);
      bando2.setDataInizio("2000-10-20");
      bando2.setDataFine("2000-09-20");
      gestoreBando = new DBBando("Bando", database);
        
        /* Test getALL    TEST PASS*/
       /* ArrayList<ArrayList<String>> all = gestoreBando.getAll();
       
        for (int i=0;i<all.size();i++)
            for (int j=0;j<all.get(i).size();j++)
                System.out.println(all.get(i).get(j));
              
      */
       
     //  gestoreBando.inserisci(bando);// TEST PASS
       gestoreBando.replace(bando,bando2);// TEST PASS
    // System.out.println(gestoreBando.isInTable(bando)); 
       
    }
    //Logger
    private static final Logger LOG = Logger.getGlobal();
    
}
    
  

