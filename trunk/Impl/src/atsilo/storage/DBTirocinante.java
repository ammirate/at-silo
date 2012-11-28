package atsilo.storage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Bambino;
import atsilo.entity.Genitore;
import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Tirocinante;

public class DBTirocinante extends DBBeans {
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    public DBTirocinante(Database db){
        super("Tirocinante",db);
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
        res.put("ore_lavoro","oreLavoro");
        res.put("ore_totali","oreTotali");
        res.put("personale_asilo","PersonaleAsilo");
        
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
    
    public Tirocinante ricercaTirocinante(PersonaleAsilo pers) throws SQLException {
        Tirocinante t=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE personale_asilo =" + pers.getCodiceFiscale());
        if(r.next())
        {
            t.setOreLavoro(r.getInt("ore_lavoro"));
            t.setOreTotali(r.getInt("ore_totali"));
            t.setPersonaleAsilo((PersonaleAsilo) r.getObject("personale_asilo"));
            
            t.setNome(r.getString("nome"));
            t.setCognome(r.getString("cognome"));
            t.setCodiceFiscale(r.getString("codice_fiscale"));
            t.setDataNascita(r.getDate("data_nascita"));
            t.setResidenza(r.getString("residenza"));
            t.setEmail(r.getString("email"));
            t.setComuneNascita(r.getString("comune_nascita"));
            t.setTelefono(r.getString("telefono"));   
        }
        r.close();
        return t;
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
    protected Tirocinante creaBean(ResultSet r) throws SQLException {
        Tirocinante t=null;
        if(r.next())
        {
            t.setOreLavoro(r.getInt("ore_lavoro"));
            t.setOreTotali(r.getInt("ore_totali"));
            t.setPersonaleAsilo((PersonaleAsilo) r.getObject("personale_asilo"));
            //info ereditate
            t.setNome(r.getString("nome"));
            t.setCognome(r.getString("cognome"));
            t.setCodiceFiscale(r.getString("codice_fiscale"));
            t.setDataNascita(r.getDate("data_nascita"));
            t.setResidenza(r.getString("residenza"));
            t.setEmail(r.getString("email"));
            t.setComuneNascita(r.getString("comune_nascita"));
            t.setTelefono(r.getString("telefono"));   
        }
        
        return t;
    }
    
    
}
