package atsilo.storage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Bambino;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Genitore;
import atsilo.entity.Utente;

public class DBEducatoreDidattico extends DBBeans {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    /**
     * Costruttore
     * @param db
     */
    public DBEducatoreDidattico(Database db){ super("EducatoreDidattico",db);}


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
        //
        res.put("titolo_di_studio", "TitoloDiStudio");
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


    public EducatoreDidattico ricercaEducatoreDidatticoPerTitoloStudio(String titoloS) throws SQLException{
        EducatoreDidattico e=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE titolo_di_studio =" + titoloS);
        if(r.next())
        {
            //settare lista classi
            e.setTitoloDiStudio(r.getString("titolo_di_studio"));
            e.setNome(r.getString("nome"));
            e.setCognome(r.getString("cognome"));
            e.setCodiceFiscale(r.getString("codice_fiscale"));
            e.setDataNascita(r.getDate("data_nascita"));
            e.setResidenza(r.getString("residenza"));
            e.setEmail(r.getString("email"));
            e.setComuneNascita(r.getString("comune_nascita"));
            e.setTelefono(r.getString("telefono")); 
        }
        r.close();
        return e;
    }
    
    public EducatoreDidattico ricercaEducatoreDidatticoPerCf(String cf) throws SQLException{
        EducatoreDidattico e=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE codice_fiscale =" + cf);
        if(r.next())
        {
            //settare lista classi
            e.setTitoloDiStudio(r.getString("titolo_di_studio"));
            e.setNome(r.getString("nome"));
            e.setCognome(r.getString("cognome"));
            e.setCodiceFiscale(r.getString("codice_fiscale"));
            e.setDataNascita(r.getDate("data_nascita"));
            e.setResidenza(r.getString("residenza"));
            e.setEmail(r.getString("email"));
            e.setComuneNascita(r.getString("comune_nascita"));
            e.setTelefono(r.getString("telefono")); 
        }
        r.close();
        return e;
     
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
    protected EducatoreDidattico creaBean(ResultSet r) throws SQLException {
        EducatoreDidattico e=null;
        if(r.next())
        {
            //settare lista classi
            e.setTitoloDiStudio(r.getString("titolo_di_studio"));
            e.setNome(r.getString("nome"));
            e.setCognome(r.getString("cognome"));
            e.setCodiceFiscale(r.getString("codice_fiscale"));
            e.setDataNascita(r.getDate("data_nascita"));
            e.setResidenza(r.getString("residenza"));
            e.setEmail(r.getString("email"));
            e.setComuneNascita(r.getString("comune_nascita"));
            e.setTelefono(r.getString("telefono"));   
        }
        return e;
    }
    
   
    
}