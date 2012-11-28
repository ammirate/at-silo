package atsilo.storage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Bambino;
import atsilo.entity.Classe;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;

public class DBPsicopedagogo extends DBBeans {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    public DBPsicopedagogo(Database db){
        super("Psicopedagogo",db);
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
        res.put("numero_classi", "numeroClassi");
        
        res.put("nome","nome");
        res.put("data_di_nascita","dataNascita");
        res.put("cognome","cognome");
        res.put("codice_fiscale","codiceFiscale");
        res.put("email", "email");
        res.put("comune_nascita", "comuneNascita");
        res.put("telefono", "telefono");
        res.put("residenza", "residenza");
        
        return Collections.unmodifiableMap(res);
    }
    
    public Psicopedagogo ricercaPsicopedagogoCf(String cf) throws SQLException{
        Psicopedagogo p=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE codice_fiscale =" + cf);
        if(r.next())
        {
            p.setNumeroClassi(r.getInt("numero_classi"));
            
            p.setNome(r.getString("nome"));
            p.setCognome(r.getString("cognome"));
            p.setCodiceFiscale(r.getString("codice_fiscale"));
            p.setDataNascita(r.getDate("data_nascita"));
            p.setResidenza(r.getString("residenza"));
            p.setEmail(r.getString("email"));
            p.setComuneNascita(r.getString("comune_nascita"));
            p.setTelefono(r.getString("telefono"));
        }
        r.close();
        return p;
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
    protected Psicopedagogo creaBean(ResultSet r) throws SQLException {
        Psicopedagogo p = null;
        if(r.next()){
            p.setNumeroClassi(r.getInt("numero_classi"));
            
            p.setNome(r.getString("nome"));
            p.setCognome(r.getString("cognome"));
            p.setCodiceFiscale(r.getString("codice_fiscale"));
            p.setDataNascita(r.getDate("data_nascita"));
            p.setResidenza(r.getString("residenza"));
            p.setEmail(r.getString("email"));
            p.setComuneNascita(r.getString("comune_nascita"));
            p.setTelefono(r.getString("telefono"));
        }
        return p;
    }
    
    
}