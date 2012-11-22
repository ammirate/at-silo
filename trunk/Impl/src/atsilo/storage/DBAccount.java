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

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#inserisci(atsilo.entity.Beans)
     */
    @Override
    public boolean inserisci(Account realBeans) throws SQLException {
        Account account= realBeans;
        List<String> valori=null;
        valori.add(account.getUserName());
        valori.add(account.getPassWord());
        valori.add(account.getOwner().getCodiceFiscale());
        if (tabella.insert(valori))
            return true;
        return false;
    }

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#replace(java.lang.Object, java.lang.Object)
     */
    @Override
    public boolean replace(Account realBeans, Account newRealBeans)
            throws SQLException {
        Account old=realBeans;
        Account accountNew=newRealBeans;
        if (delete(realBeans) && inserisci(newRealBeans))
                return true;
        inserisci(old);//inserisco il vecchio se cancellato
        delete(accountNew);//cancello il nuovo inserito
        return false;
    }

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#delete(java.lang.Object)
     */
    @Override
    public boolean delete(Account realBeans) throws SQLException {
        Account account=realBeans;
        ArrayList<String> chiavi= new ArrayList<String>();
        ArrayList<String> valChiavi=new ArrayList<String>();
        chiavi.add("username");
        valChiavi.add(account.getUserName());
        if (tabella.rimuovi(chiavi, valChiavi))
            return true;
        else return false;
    }

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#ifInTable(atsilo.entity.Beans)
     */
    @Override
    public boolean ifInTable(Account realBeans) {
        
    }
    
    public HashMap<String,String> getMappingFields()
    {
        HashMap<String,String> toReturn = new HashMap<String,String>();
        toReturn.put("userName", "userName");
        toReturn.put("password","password");
        return toReturn;
    }
    
    public List<String> getKeyFields()
    {
        ArrayList<String> toReturn = new ArrayList<String>();
        toReturn.add("userName");
        
        return toReturn;
    }

    
   
    }

