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

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBServizio.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */
//TODO da implementare

public class DBServizio extends DBBeans {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    public DBServizio(Database db){
        super("servizio",db);
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

    public Servizio ricercaServizioPerBambino(String b) throws SQLException {
        Servizio s= new Servizio();
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE bambino =" + b);
        if(r.next()){
            s.setId(r.getInt("id"));
            s.setOrarioFine(r.getString("orario_fine"));
            s.setOrarioInizio(r.getString("orario_inizio"));
            s.setPianoPasto(r.getString("piano_pasto"));
            s.setBambino(r.getString("bambino"));
            OrarioUtente o= new OrarioUtente();
            s.setOrarioUtente(r.getInt("orario_utente"));
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
            s.setId(r.getInt("id"));
            s.setOrarioFine(r.getString("orario_fine"));
            s.setOrarioInizio(r.getString("orario_inizio"));
            s.setPianoPasto(r.getString("piano_pasto"));
            s.setBambino( r.getString("bambino"));
            s.setOrarioUtente( r.getInt("orario_utente"));
    }
        return s;


    }
}
