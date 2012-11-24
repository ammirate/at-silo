package atsilo.storage;
import atsilo.entity.Account;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 
 * Gestore storage di Account
 * 
 * @author Angelo G. Scafuro
 *
 */
public class DBAccount extends DBBeans<Account> {
    
    /**
     * Crea un gestore per il bean Account 
     * @param nomeTabella nome reale della tabella nel database
     * @param db database con relativa connessione
     */
    public DBAccount(String nomeTabella,Database db){
        super(nomeTabella,db); 
    }
   
    /**
     *  @see atsilo.storage.DBBeans#getMappingFields()
     */
    public HashMap<String,String> getMappingFields()
    {
        HashMap<String,String> toReturn = new HashMap<String,String>();
        toReturn.put("userName", "userName");
        toReturn.put("password","password");
        return toReturn;
    }
    
    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    public List<String> getKeyFields()
    {
        ArrayList<String> toReturn = new ArrayList<String>();
        toReturn.add("userName");
        return toReturn;
    }

    public Account ricercaPerUsername(String user) {} //aggiunto
    
    
   
    }

