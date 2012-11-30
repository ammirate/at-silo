package atsilo.storage;
import atsilo.entity.Account;
import atsilo.entity.Genitore;
import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Psicopedagogo;

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
     * Ricerca nel database un account il cui username corrisponde
     * a quello fornito in input.
     * Il metodo provvede a caricare un istanza di utente del tipo appropriato,
     * con il codice fiscale preimpostato.
     * @param user      Nome utente da ricercare
     * @return un account con username=a oppure null
     * @throws SQLException
     */
    public Account ricercaPerUsername(String user) throws SQLException {
        Account a = new Account();
        
        ResultSet res = tabella.getDatabase().directQuery(
                "SELECT * FROM " + tabella.getNomeTabella()
                        + "WHERE username =" + user);
        
        try {
            if (res.next()) // dovrebbe trovare solo un account perchè
                            // l'username è unico. quindi restituisce un unico
                            // record.
            {
                String cf;
                
                a.setUserName(res.getString("user_name"));
                a.setPassWord(res.getString("pass_word"));
                
                if ((cf = res.getString("genitore")) != null) {
                    a.setOwner(new Genitore());
                } else if ((cf = res.getString("personale_asilo")) != null) {
                    a.setOwner(new PersonaleAsilo());
                } else if ((cf = res.getString("psico_pedagogo")) != null) {
                    a.setOwner(new Psicopedagogo());
                } else if ((cf = res.getString("responsabile_questionario")) != null) {
                    a.setOwner(new Psicopedagogo());
                } else {
                    a.setOwner(null);
                }
                
                if (cf != null) {
                    a.getOwner().setCodiceFiscale(cf);
                }
            }
        } finally {
            res.close();
        }
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

