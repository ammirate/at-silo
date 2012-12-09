package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Extra;
import atsilo.entity.Genitore;
import atsilo.entity.Retta;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBRetta extends DBBeans {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    public DBRetta(Database db){
        super("retta",db);
    }
    
    /**
     * @return
     */
    private static List<String> creaChiave() {
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
        
    }
    
    /**
     * @return
     */
    private static Map<String, String> creaMapping() {
        Map<String,String> res= new HashMap<String,String>();
        res.put("id","id");
        res.put("classe","classe");
        res.put("extra","extra");
        res.put("genitore","genitore");
        
        
        return Collections.unmodifiableMap(res);
    }
    
    public List<Retta> ricarcaRettaPerGenitore(Genitore g) throws SQLException {
        Retta rt=null;
        List<Retta> lr=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE genitore =" + g.getCodiceFiscale());
        int i=0;
        while(r.next())
        {
            rt.setId(r.getString("id"));
            rt.setImporto(r.getFloat("importo"));
            rt.setGenitore((Genitore) r.getObject("genitore"));
            rt.setExtra((List<Extra>) r.getArray("extra"));
            
            lr.add(i,rt);
            i++;
        }
        r.close();
        return lr;
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
    protected Retta creaBean(ResultSet r) throws SQLException {
        Retta rt = null;
        if(r.next()){
            rt.setId(r.getString("id"));
            rt.setImporto(r.getFloat("importo"));
            rt.setGenitore((Genitore) r.getObject("genitore"));
            rt.setExtra((List<Extra>) r.getArray("extra"));
        }
        return rt;
    }
}
