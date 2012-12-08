package atsilo.storage;
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

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBAccount.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Luigi Lomastro,Fabio Napoli 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
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
            ResultSet r = stmt.executeQuery();  
        if (r.next()) // dovrebbe trovare solo un account perch� l'username � unico. quindi restituisce un unico record. 
        {
            a.setUserName(r.getString("username"));
            a.setPassWord(r.getString("password"));
            if(r.getString("genitore")!=null)
                a.setOwner(r.getString("genitore"));
                if(r.getString("psico_pedagogo")!=null)
                    a.setOwner(r.getString("psico_pedagogo"));
                if(r.getString("tirocinante")!=null)
                    a.setOwner(r.getString("tirocinante"));
                if(r.getString("responsabile_questionario")!=null)
                    a.setOwner(r.getString("responsabile_questionario"));
                if(r.getString("personale_asilo")!=null)
                    a.setOwner(r.getString("personale_asilo"));
        }
         
            r.close();  
             return a;
       
    }


    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Account creaBean(ResultSet r) throws SQLException {
        Account a = new Account();
            a.setUserName(r.getString("username"));
            a.setPassWord(r.getString("password"));
            if(r.getString("genitore")!=null)
            a.setOwner(r.getString("genitore"));
            if(r.getString("psico_pedagogo")!=null)
                a.setOwner(r.getString("psico_pedagogo"));
            if(r.getString("tirocinante")!=null)
                a.setOwner(r.getString("tirocinante"));
            if(r.getString("responsabile_questionario")!=null)
                a.setOwner(r.getString("responsabile_questionario"));
            if(r.getString("personale_asilo")!=null)
                a.setOwner(r.getString("personale_asilo"));
            
        return a;
        
    }


  
 }

