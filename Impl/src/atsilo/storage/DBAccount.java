package atsilo.storage;
import atsilo.entity.Account;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Collections;


public class DBAccount extends DBBeans<Account> 
{
    /**
     * Crea un gestore per il bean Account 
     * @param nomeTabella nome reale della tabella nel database
     * @param db database con relativa connessione
     */
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    
     /**
     * Costruttore
     * @param nomeTabella
     * @param db
     */
    public DBAccount(Database db){super("Account",db); }
    
    
    /**
     * metodo creaMapping
     * @return 
     */
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        res.put("user_name","userName");
        res.put("pass_word","passWord");
        
        return Collections.unmodifiableMap(res);
    }
    
    
    /**
     * Metodo che crea una chiave
     * @return 
     */
    private static List<String> creaChiave()
    {
        List<String> res=  Arrays.asList("userName");
        
        return Collections.unmodifiableList(res);
    }
   
    
    /**
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    protected Map<String,String> getMappingFields(){return MAPPINGS;}
    
    
    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    protected List<String> getKeyFields() {return CHIAVE;}
    
    
    /**
     * 
     * @param user
     * @return un account con username=a oppure null
     * @throws SQLException
     */
    public Account ricercaPerUsername(String user) throws SQLException 
    {
        Account a = null;
        
        ResultSet res = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE username =" + user);
        if (res.next()) // dovrebbe trovare solo un account perchè l'username è unico. quindi restituisce un unico record. 
        {
            a.setUserName(res.getString("user_name"));
            a.setPassWord(res.getString("pass_word"));
        }
         
            res.close();  
             return a;
       
    }


    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Account creaBean(ResultSet r) throws SQLException {
        Account a = null;
        if(r.next())
        {
            a.setUserName(r.getString("user_name"));
            a.setPassWord(r.getString("pass_word"));
        }
        return a;
        
    }


  
 }

