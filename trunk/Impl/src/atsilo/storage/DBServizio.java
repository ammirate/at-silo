package atsilo.storage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Bambino;
import atsilo.entity.OrarioUtente;
import atsilo.entity.Servizio;

public class DBServizio extends DBBeans {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    public DBServizio(Database db){
        super("Servizio",db);
    }

    /**
     * @return
     */
    private static Map<String, String> creaMapping() {
        Map<String,String> res= new HashMap<String,String>();
        res.put("id", "id");
        res.put("orario_fine","orarioFine");
        res.put("orario_inizio","orarioInizio");
        res.put("piano_pasto","pianoPasto");
        res.put("bambino","bambino");
        res.put("orario_utente", "orarioUtente");
        return Collections.unmodifiableMap(res);
    }

    /**
     * @return
     */
    private static List<String> creaChiave() {
        List<String> res=  Arrays.asList("id"); 
        return Collections.unmodifiableList(res);
    }

    public Servizio ricercaServizioPerBambino(Bambino b) throws SQLException {
        Servizio s= null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE bambino =" + b.getCodice_Fiscale());
        if(r.next()){
            s.setId(r.getString("id"));
            s.setOrarioFine(r.getString("orario_fine"));
            s.setOrarioInizio(r.getString("orario_inizio"));
            s.setPianoPasto(r.getString("piano_pasto"));
            s.setBambino((Bambino) r.getObject("bambino"));
            s.setOrarioUtente((OrarioUtente) r.getObject("orario_utente"));
        }
        r.close();
        return s;
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
    protected Servizio creaBean(ResultSet r) throws SQLException {
        Servizio s =null;
        if(r.next())
        {
            s.setId(r.getString("id"));
            s.setOrarioFine(r.getString("orario_fine"));
            s.setOrarioInizio(r.getString("orario_inizio"));
            s.setPianoPasto(r.getString("piano_pasto"));
            s.setBambino((Bambino) r.getObject("bambino"));
            s.setOrarioUtente((OrarioUtente) r.getObject("orario_utente"));
    }
        return s;


    }
}