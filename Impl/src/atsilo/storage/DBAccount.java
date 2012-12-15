package atsilo.storage;

import atsilo.entity.Account;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.ResponsabileQuestionario;
import atsilo.entity.Utente;
import atsilo.storage.DBBeans.Assegnazione;
import atsilo.entity.Tirocinante;
import atsilo.entity.PersonaleAsilo;

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
    public DBAccount(Database db){super("account",db); }
    
    
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
     * Ricerca username dato in input, e restituisce l'
     * account con quell'username
     * @param user username da ricercare
     * @return un account con username=a oppure null
     * @throws SQLException
     */
    public Account ricercaPerUsername(String user) throws SQLException{
        Account a = new Account();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE username = ?");
            tabella.setParam(stmt, 1, "username", user);
            ResultSet r = stmt.executeQuery();  
        if (r.next()) // dovrebbe trovare solo un account perchï¿½ l'username ï¿½ unico. quindi restituisce un unico record. 
        {
            Utente u=new Utente();
            a.setUserName(r.getString("username"));
            a.setPassWord(r.getString("password"));
            if(r.getString("genitore")!=null){
                u = new Genitore();
                u.setCodiceFiscale(r.getString("genitore"));
                
            }
            else if(r.getString("psico_pedagogo")!=null){
                u=new Psicopedagogo();
                u.setCodiceFiscale(r.getString("psico_pedagogo"));
            }
            else if(r.getString("tirocinante")!=null){
                u=new Tirocinante();
                u.setCodiceFiscale(r.getString("tirocinante"));
            }
            else if(r.getString("responsabile_questionario")!=null){
                u=new ResponsabileQuestionario();
                u.setCodiceFiscale(r.getString("responsabile_questionario"));
            }
            else if(r.getString("personale_asilo")!=null){
                u=new PersonaleAsilo();
                u.setCodiceFiscale(r.getString("personale_asilo"));
            }
            else if(r.getString("educatore_didattico")!=null){
                u=new EducatoreDidattico();
                u.setCodiceFiscale(r.getString("educatore_didattico"));
            }
           
            a.setOwner(u);
        }
        else{
            r.close();
            return null;
        }
         
            r.close();  
             return a;
       
    }


    /** 
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     * Questo metodo restituisce un account il cui campo <b>owner</b> è un utente del tipo corretto e che ha come unico campo 
     * correttamente settato il suo codice fiscale.
     * Nel caso in cui altre informazioni siano necessarie, occorre sostituire l'Owner con un oggetto
     * letto dal database tramite il DBBean associato (se l'owner è un genitore, usare DBGenitore sul
     * codice fiscale già presente nell'account.)
     * @throw SQLException può esserci quando si esegue la query
     * @return Account o null
     */
    protected Account creaBean(ResultSet r) throws SQLException {
        Account a = new Account();
        Utente u=new Utente();
        a.setUserName(r.getString("username"));
        a.setPassWord(r.getString("password"));
        if(r.getString("genitore")!=null){
            u = new Genitore();
            u.setCodiceFiscale(r.getString("genitore"));
            
        }
        if(r.getString("psico_pedagogo")!=null){
            u=new Psicopedagogo();
            u.setCodiceFiscale(r.getString("psico_pedagogo"));
        }
        if(r.getString("tirocinante")!=null){
            u=new Tirocinante();
            u.setCodiceFiscale(r.getString("tirocinante"));
        }
        if(r.getString("responsabile_questionario")!=null){
            u=new ResponsabileQuestionario();
            u.setCodiceFiscale(r.getString("responsabile_questionario"));
        }
        if(r.getString("personale_asilo")!=null){
            u=new PersonaleAsilo();
            u.setCodiceFiscale(r.getString("personale_asilo"));
        }
        if(r.getString("educatore_didattico")!=null){
            u=new EducatoreDidattico();
            u.setCodiceFiscale(r.getString("educatore_didattico"));
        }
        a.setOwner(u);
        
        return a;
        
    }
    
    /**Ricerca un account associato ad un utente con codice fiscale=cf
     * @param cf codice fiscale dell'account da ricercare
     * @return Account o null
     * @throws SQLException 
     */
    public Account ricercaPerCodiceFiscale(String cf) throws SQLException {
        
        Account a = new Account();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE genitore = ? " +
                        "OR personale_asilo = ? OR psico_pedagogo = ? OR responsabile_questionario = ? " +
                "OR responsabile_tirocini = ? OR tirocinante = ? ");
        
        tabella.setParam(stmt, 1, "genitore", cf);
        tabella.setParam(stmt, 2, "personale_asilo", cf);
        tabella.setParam(stmt, 3, "psico_pedagogo", cf);
        tabella.setParam(stmt, 4, "responsabile_questionario", cf);
        tabella.setParam(stmt, 5, "responsabile_tirocini", cf);
        tabella.setParam(stmt, 6, "tirocinante", cf);
        
        ResultSet r = stmt.executeQuery();  
        if (r.next()){
            Utente u=new Utente();
            a.setUserName(r.getString("username"));
            a.setPassWord(r.getString("password"));
            if(r.getString("genitore")!=null){
                u = new Genitore();
                u.setCodiceFiscale(r.getString("genitore"));
                
            }
            else if(r.getString("psico_pedagogo")!=null){
                u=new Psicopedagogo();
                u.setCodiceFiscale(r.getString("psico_pedagogo"));
            }
            else if(r.getString("tirocinante")!=null){
                u=new Tirocinante();
                u.setCodiceFiscale(r.getString("tirocinante"));
            }
            else if(r.getString("responsabile_questionario")!=null){
                u=new ResponsabileQuestionario();
                u.setCodiceFiscale(r.getString("responsabile_questionario"));
            }
            else if(r.getString("personale_asilo")!=null){
                u=new PersonaleAsilo();
                u.setCodiceFiscale(r.getString("personale_asilo"));
            }
            else if(r.getString("educatore_didattico")!=null){
                u=new EducatoreDidattico();
                u.setCodiceFiscale(r.getString("educatore_didattico"));
            }
            
            a.setOwner(u);
        }
        else{
            r.close();
            return null;
        }
        
        r.close();  
        return a;
    }
    
    
    
    
    /** Metodo utilizzato dagli altri metodi di DBBeans per ricavare le
     * assegnazioni predefinite relativamente a un bean.<br/>
     * Nella sua implementazione predefinita, questo metodo restituisce sempre
     * {@link #NESSUNA_ASSEGNAZIONE}. Le classi estendenti possono sovrascrivere
     * questo metodo per indicare in modo comodo delle assegnazioni predefinite
     * per tutti i metodi di modifica della base di dati.
     * 
     * @param bean
     *            Bean per cui valutare le assegnazioni
     * @return Array di assegnazioni
     */
    protected Assegnazione[] creaAssegnazioni(Account bean) {
        Assegnazione DBAccount_assegnazione = new Assegnazione("responsabile_questionario",null);
        Assegnazione DBAccount_assegnazione1 = new Assegnazione("genitore",null);
        Assegnazione DBAccount_assegnazione2 = new Assegnazione("tirocinante",null);
        Assegnazione DBAccount_assegnazione3 = new Assegnazione("personale_asilo",null);
        Assegnazione DBAccount_assegnazione4 = new Assegnazione("psico_pedagogo",null);
        Assegnazione DBAccount_assegnazione5= new Assegnazione("responsabile_tirocini", null);
        Assegnazione DBAccount_assegnazione6= new Assegnazione("educatore_didattico", null);
        
        
        Assegnazione[] DBAssign = new Assegnazione[7];
        
        DBAssign[0]=DBAccount_assegnazione;
        DBAssign[1]=DBAccount_assegnazione1;
        DBAssign[2]=DBAccount_assegnazione2;
        DBAssign[3]=DBAccount_assegnazione3;
        DBAssign[4]=DBAccount_assegnazione4;
        DBAssign[5]=DBAccount_assegnazione5;
        DBAssign[6]=DBAccount_assegnazione6;
        
        if(bean.getOwner() instanceof ResponsabileQuestionario){
            DBAccount_assegnazione = new Assegnazione("responsabile_questionario",bean.getOwner().getCodiceFiscale());
            DBAssign[0]=DBAccount_assegnazione;
        }
        if(bean.getOwner() instanceof Genitore){
            DBAccount_assegnazione1 = new Assegnazione("genitore",bean.getOwner().getCodiceFiscale());
            DBAssign[1]=DBAccount_assegnazione1;
        }
        if(bean.getOwner() instanceof Tirocinante){
            DBAccount_assegnazione2 = new Assegnazione("tirocinante",bean.getOwner().getCodiceFiscale());
            DBAssign[2]=DBAccount_assegnazione2;
        }
        if(bean.getOwner() instanceof PersonaleAsilo){
            DBAccount_assegnazione3 = new Assegnazione("personale_asilo",bean.getOwner().getCodiceFiscale());
            DBAssign[3]=DBAccount_assegnazione3;
        }
        if(bean.getOwner() instanceof Psicopedagogo){
            DBAccount_assegnazione4 = new Assegnazione("psico_pedagogo",bean.getOwner().getCodiceFiscale());
            DBAssign[4]=DBAccount_assegnazione4;
        }
        if(bean.getOwner() instanceof PersonaleAsilo){
            DBAccount_assegnazione5 = new Assegnazione("responsabile_tirocini",bean.getOwner().getCodiceFiscale());
            DBAssign[5]=DBAccount_assegnazione5;
        }
        if(bean.getOwner() instanceof EducatoreDidattico){
            DBAccount_assegnazione6 = new Assegnazione("educatore_didattico",bean.getOwner().getCodiceFiscale());
            DBAssign[6]=DBAccount_assegnazione6;
        }
        
        return DBAssign;
    }
       
    
    
}


