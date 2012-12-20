package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.Genitore;
import atsilo.entity.Richiesta;
import atsilo.entity.Servizio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBRichiesta.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, Ferdinando Di Palma 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 *///TODO da implementare
public class DBRichiesta extends DBBeans {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    public DBRichiesta(Database db){
        super("richiesta",db);
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
        res.put("id","id");// la classe Assenza del package entity ha come attributi (data e bambino)????
        res.put("tipo","tipo");
        res.put("menuRichiesto","menu_richiesto");
        res.put("orarioRichiesto","orario_richiesto");
        res.put("allegato","allegato");
        res.put("servizio","servizio");
        res.put("genitore","genitore");
   
        return Collections.unmodifiableMap(res);
    }
    
    public Richiesta ricercaRichiestaDaServizio(int ID) throws SQLException {
        Richiesta ric=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE id =" + ID);
        if(r.next())
        {
            ric.setId(r.getInt("id"));
            ric.setAllegato(r.getString("allegato"));
            ric.setMenuRichiesto(r.getString("menu_richiesto"));
            ric.setOrarioRichiesto(r.getString("orario_richiesto"));
            ric.setServizio((Servizio) r.getObject("servizio"));
            ric.setTipo(r.getString("tipo"));
            ric.setGenitore((Genitore) r.getObject("genitore"));
        }
        r.close();
        return ric;
    }
    
    public List<Richiesta> ricerdaRichiestaPerGenitore(Genitore g) throws SQLException {
        Richiesta ric=null;
        List<Richiesta> lr=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE genitore =" + g.getCodiceFiscale());
        int i=0;
        while(r.next())
        {
            ric.setId(r.getInt("id"));
            ric.setAllegato(r.getString("allegato"));
            ric.setMenuRichiesto(r.getString("menu_richiesto"));
            ric.setOrarioRichiesto(r.getString("orario_richiesto"));
            ric.setServizio((Servizio) r.getObject("servizio"));
            ric.setTipo(r.getString("tipo"));
            ric.setGenitore((Genitore) r.getObject("genitore"));
            
            lr.add(i,ric);
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
    protected Richiesta creaBean(ResultSet r) throws SQLException {
        Richiesta ric = null;
        if(r.next()){
            ric.setId(r.getInt("id"));
            ric.setAllegato(r.getString("allegato"));
            ric.setMenuRichiesto(r.getString("menu_richiesto"));
            ric.setOrarioRichiesto(r.getString("orario_richiesto"));
            ric.setServizio((Servizio) r.getObject("servizio"));
            ric.setTipo(r.getString("tipo"));
            ric.setGenitore((Genitore) r.getObject("genitore"));
            
        }
        
        return ric;
    }
    
}
