/**
 * Progetto \@silo
 * Copyleft
 */
package test;

import java.sql.SQLException;
import java.util.logging.Logger;

import atsilo.entity.Account;
import atsilo.entity.Utente;
import atsilo.storage.DBAccount;
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
        // TODO Scheletro generato automaticamente
        database=new Database();
        database.apriConnessione();
        if (database.isOpen())
            LOG.info("Connessione riuscita");
        gestoreAccount = new DBAccount("account", database);
        account1=new Account();
        account1.setUserName("angelosca");
        account1.setPassWord("fattiifattituoi");
        Utente owner=new Utente();
        owner.setCodiceFiscale("scnlg91h20a488a");
        account1.setOwner(owner);
        //gestoreAccount.inserisci(account1);
        System.out.println("Username da inserire: "+account1.getUserName());
    }
    //Logger
    private static final Logger LOG = Logger.getGlobal();
    
    static Database database;
    static Account account1;
    Account account2;
    static DBAccount gestoreAccount;
    
}
    
  

