/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: StubAccount.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Marko, 06/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.stub.storage;

import atsilo.storage.Database;
import atsilo.entity.Account;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Collections;

/**
 * 
 * Classe DBAccount
 * <Descrizione classe>
 * 
 * @author Marko
 *
 */

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
        res.put("userName", "username");
        res.put("passWord", "password");
        
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
        Account a = new Account();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE username = ?");
            tabella.setParam(stmt, 1, "username", user);
            ResultSet res = stmt.executeQuery();  
        if (res.next()) // dovrebbe trovare solo un account perch� l'username � unico. quindi restituisce un unico record. 
        {
            a.setUserName(res.getString("username"));
            a.setPassWord(res.getString("password"));
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
            a.setUserName(r.getString("username"));
            a.setPassWord(r.getString("password"));
        }
        return a;
        
    }


  
 }


