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
import atsilo.entity.Questionario;

public class DBGenitore extends DBBeans {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    public DBGenitore(Database db){
        super("Genitore",db);
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
        res.put("tipo","tipo");
        res.put("figli","figli");
        res.put("questionari_compilati","questionariCompilati");
        
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
    
    public Genitore ricercaGenitoreCf(String codicefiscale) throws SQLException{
        Genitore g=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE codice_fiscale =" + codicefiscale);
        if(r.next())
        {
            g.setTipo(r.getString("tipo"));
            //
            //
            
            g.setNome(r.getString("nome"));
            g.setCognome(r.getString("cognome"));
            g.setCodiceFiscale(r.getString("codice_fiscale"));
            g.setDataNascita(r.getDate("data_nascita"));
            g.setResidenza(r.getString("residenza"));
            g.setEmail(r.getString("email"));
            g.setComuneNascita(r.getString("comune_nascita"));
            g.setTelefono(r.getString("telefono")); 
            
        }
        r.close();
        return g;
    }
    
    public Genitore ricercaGenitoreComune(String comune) throws SQLException{
        Genitore g=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE comune_nascita =" + comune);
        if(r.next())
        {
            g.setTipo(r.getString("tipo"));
            //
            //
            
            g.setNome(r.getString("nome"));
            g.setCognome(r.getString("cognome"));
            g.setCodiceFiscale(r.getString("codice_fiscale"));
            g.setDataNascita(r.getDate("data_nascita"));
            g.setResidenza(r.getString("residenza"));
            g.setEmail(r.getString("email"));
            g.setComuneNascita(r.getString("comune_nascita"));
            g.setTelefono(r.getString("telefono")); 
            
        }
        r.close();
        return g;
    }
    public Genitore ricercaGenitoreResidenza(String residenza) throws SQLException{
        Genitore g=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE residenza =" + residenza);
        if(r.next())
        {
            g.setTipo(r.getString("tipo"));
            //
            //
            
            g.setNome(r.getString("nome"));
            g.setCognome(r.getString("cognome"));
            g.setCodiceFiscale(r.getString("codice_fiscale"));
            g.setDataNascita(r.getDate("data_nascita"));
            g.setResidenza(r.getString("residenza"));
            g.setEmail(r.getString("email"));
            g.setComuneNascita(r.getString("comune_nascita"));
            g.setTelefono(r.getString("telefono")); 
            
        }
        r.close();
        return g;
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
    protected Genitore creaBean(ResultSet r) throws SQLException {
        Genitore g = null;
        if(r.next()){
            g.setTipo(r.getString("tipo"));
            //settare listafigli e listaquestionario
            
            g.setNome(r.getString("nome"));
            g.setCognome(r.getString("cognome"));
            g.setCodiceFiscale(r.getString("codice_fiscale"));
            g.setDataNascita(r.getDate("data_nascita"));
            g.setResidenza(r.getString("residenza"));
            g.setEmail(r.getString("email"));
            g.setComuneNascita(r.getString("comune_nascita"));
            g.setTelefono(r.getString("telefono")); 
        }
        return g;
    }
    
    
    
    
}

