package atsilo.storage;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Bambino;
import atsilo.entity.Genitore;
import atsilo.entity.Utente;

public class DBUtente extends DBBeans {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    public DBUtente(Database db){
        super("Utente",db);
    }
    
    /**
     * @return
     */
    private static List<String> creaChiave() {
        List<String> res=  Arrays.asList("codice_fiscale");
        return Collections.unmodifiableList(res);
    }
    
    /**
     * @return
     */
    private static Map<String, String> creaMapping() {
        Map<String,String> res= new HashMap<String,String>();
        res.put("nome","nome");
        res.put("data_di_nascita","dataNascita");
        res.put("cognome","cognome");
        res.put("codice_fiscale","codiceFiscale");
        res.put("email", "email");
        res.put("comune_nascita", "comuneNascita");
        res.put("telefono", "telefono");
        res.put("residenza", "residenza");
        return res;
    }
    
    /**
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() {
        return MAPPINGS;
    }
    
    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {
        return CHIAVE;
    }
    
    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Utente creaBean(ResultSet r) throws SQLException {
        Utente u=null;
        if(r.next())
        {
            u.setNome(r.getString("nome"));
            u.setCognome(r.getString("cognome"));
            u.setCodiceFiscale(r.getString("codice_fiscale"));
            u.setDataNascita(r.getDate("data_nascita"));
            u.setResidenza(r.getString("residenza"));
            u.setEmail(r.getString("email"));
            u.setComuneNascita(r.getString("comune_nascita"));
            u.setTelefono(r.getString("telefono"));   
        }
        return u;
    }}