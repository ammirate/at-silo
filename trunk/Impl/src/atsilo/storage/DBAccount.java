package atsilo.storage;
import atsilo.entity.Account;
import atsilo.entity.DomandaQuestionario;
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
        res.put("personaleAsilo","personale_asilo");
        res.put("psicoPedagogo","psico_pedagogo");
        res.put("responsabileQuestionario","responsabile_questionario");
        res.put("responsabileTirocini","responsabile_tirocini");
        res.put("tirocinante","tirocinante");
        res.put("delegatoRettore","delegato_rettore");
        
        
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
            Utente u=new Utente();
            a.setUserName(r.getString("username"));
            a.setPassWord(r.getString("password"));
            if(r.getString("genitore")!=null)
            {
                u = new Genitore();
                u.setCodiceFiscale(r.getString("genitore"));
                
            }
            else if(r.getString("psico_pedagogo")!=null)
            {
                u=new Psicopedagogo();
                u.setCodiceFiscale(r.getString("psico_pedagogo"));
            }
            else if(r.getString("tirocinante")!=null)
            {
                u=new Tirocinante();
                u.setCodiceFiscale(r.getString("tirocinante"));
            }
            else if(r.getString("responsabile_questionario")!=null)
            {
                u=new ResponsabileQuestionario();
                u.setCodiceFiscale(r.getString("responsabile_questionario"));
            }
            else if(r.getString("personale_asilo")!=null)
            {
                u=new PersonaleAsilo();
                u.setCodiceFiscale(r.getString("personale_asilo"));
            }
            else if(r.getString("delegato_rettore")!=null)
            {
                u=new PersonaleAsilo();
                u.setCodiceFiscale(r.getString("delegato_rettore"));
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
     * Questo metodo restituisce un account il cui campo <b>owner</b> � un utente del tipo corretto e che ha come unico campo 
     * correttamente settato il suo codice fiscale.
     * Nel caso in cui altre informazioni siano necessarie, occorre sostituire l'Owner con un oggetto
     * letto dal database tramite il DBBean associato (se l'owner � un genitore, usare DBGenitore sul
     * codice fiscale gi� presente nell'account.)
     */
    @Override
    protected Account creaBean(ResultSet r) throws SQLException {
        Account a = new Account();
        Utente u=new Utente();
        a.setUserName(r.getString("username"));
        a.setPassWord(r.getString("password"));
        if(r.getString("genitore")!=null)
        {
            u = new Genitore();
            u.setCodiceFiscale(r.getString("genitore"));
            
        }
        if(r.getString("psico_pedagogo")!=null)
        {
            u=new Psicopedagogo();
            u.setCodiceFiscale(r.getString("psico_pedagogo"));
        }
        if(r.getString("tirocinante")!=null)
        {
            u=new Tirocinante();
            u.setCodiceFiscale(r.getString("tirocinante"));
        }
        if(r.getString("responsabile_questionario")!=null)
        {
            u=new ResponsabileQuestionario();
            u.setCodiceFiscale(r.getString("responsabile_questionario"));
        }
        if(r.getString("personale_asilo")!=null)
        {
            u=new PersonaleAsilo();
            u.setCodiceFiscale(r.getString("personale_asilo"));
        }
       if(r.getString("delegato_rettore")!=null)
        {
            u=new PersonaleAsilo();
            u.setCodiceFiscale(r.getString("delegato_rettore"));
        }
        a.setOwner(u);
        
        return a;
        
    }
    
    /**
     * Metodo utilizzato dagli altri metodi di DBBeans per ricavare le
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
        Assegnazione DBAccount_assegnazione5 = new Assegnazione("delegato_rettore",null);
        Assegnazione DBAccount_assegnazione6= null;
        
        
        Assegnazione[] DBAssign = new Assegnazione[7];
        
        DBAssign[0]=DBAccount_assegnazione;
        DBAssign[1]=DBAccount_assegnazione1;
        DBAssign[2]=DBAccount_assegnazione2;
        DBAssign[3]=DBAccount_assegnazione3;
        DBAssign[4]=DBAccount_assegnazione4;
        DBAssign[5]=DBAccount_assegnazione5;
        DBAssign[6]=DBAccount_assegnazione6;
        
        if(bean.getOwner() instanceof ResponsabileQuestionario){
            DBAccount_assegnazione5 = new Assegnazione("responsabile_questionario",bean.getOwner().getCodiceFiscale());
            DBAssign[0]=DBAccount_assegnazione6;
        }
        if(bean.getOwner() instanceof Genitore){
            DBAccount_assegnazione5 = new Assegnazione("genitore",bean.getOwner().getCodiceFiscale());
            DBAssign[1]=DBAccount_assegnazione6;
        }
        if(bean.getOwner() instanceof Tirocinante){
            DBAccount_assegnazione5 = new Assegnazione("tirocinante",bean.getOwner().getCodiceFiscale());
            DBAssign[2]=DBAccount_assegnazione6;
        }
        if(bean.getOwner() instanceof PersonaleAsilo){
            DBAccount_assegnazione5 = new Assegnazione("personale_asilo",bean.getOwner().getCodiceFiscale());
            DBAssign[3]=DBAccount_assegnazione6;
        }
        if(bean.getOwner() instanceof Psicopedagogo){
            DBAccount_assegnazione5 = new Assegnazione("psico_pedagogo",bean.getOwner().getCodiceFiscale());
            DBAssign[4]=DBAccount_assegnazione6;
        }
        if(bean.getOwner() instanceof PersonaleAsilo){
            DBAccount_assegnazione5 = new Assegnazione("delegato_rettore",bean.getOwner().getCodiceFiscale());
            DBAssign[5]=DBAccount_assegnazione6;
        }
        
        return DBAssign;
    }
}


