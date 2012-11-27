package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.Bando;
import atsilo.entity.Genitore;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Collections;

/**
 * 
 * Classe DBBando
 * <Descrizione classe>
 * 
 * @author 
 *
 */


public class DBBando extends DBBeans<Bando> {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave();
    
    /**
     * 
     * @param db
     */
    public DBBando(Database db){super("Bando",db);}
    
    
    /**
     * metodo che asocia alla chiave(nome campo db) il rispettivo valore(nome attributo classe)
     * @return
     */
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        res.put("id","id");// la classe Assenza del package entity ha come attributi (data e bambino)????
        res.put("data_inizio","dataInizio");
        res.put("data_fine","dataFine");
       
        
        return Collections.unmodifiableMap(res);
    }
    
    /**
     * Metodo che crea la chiave
     * @return
     */
    private static List<String> creaChiave()
    {
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }
    
    

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Bando creaBean(ResultSet r) throws SQLException {
        Bando b=null;
        if(r.next())
        {
            b.setiD(r.getInt("id"));
            b.setDataInizio(r.getString("data_inizio"));
            b.setDataFine(r.getString("data_fine"));
        }
        
        return b;
    }
    
    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    public Map getMappingFields() {return MAPPINGS;}

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    public List getKeyFields() { return CHIAVE; }
    
    
    /**
     * cerca bando per data inizio
     * @param id
     * @return bando
     * @throws SQLException 
     */
    public Bando cercaBandoPerId (int id) throws SQLException 
    {
       Bando b=null;
       Date inizio,fine;
       ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE id =" + id);
       if(r.next())
       {
           b.setiD(id);
           b.setDataInizio(r.getString("data_inizio"));
           b.setDataFine(r.getString("data_fine"));
           
       }
          r.close();
       return b;
    }
    
    
    /**
     * ricerca bando per data inizio
     * @param dataInizio
     * @return lista di bandi
     * @throws SQLException 
     */
    public List<Bando> cercaPerDataInizio (String dataInizio) throws SQLException 
    {
        List<Bando> lb=null;
        Bando b=null;
        Date id,fine;
        int i=0;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE data_inizio =" + dataInizio);
        if(r.next())
        {
            b.setiD(r.getInt("id"));
            b.setDataInizio(r.getString("data_inizio"));
            b.setDataFine(r.getString("data_fine"));
            lb.add(i, b);
            i++;
        }
           r.close();
        return lb;
     }
    
    /**
     * ricerca bando per datafine
     * @param dataFine
     * @return lista di bandi
     * @throws SQLException 
     */
    public List<Bando> cercaPerDataFine (String dataFine) throws SQLException 
    {
        List<Bando> lb=null;
        Bando b=null;
        Date id,fine;
        int i=0;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE data_fine =" + dataFine);
        if(r.next())
        {
            b.setiD(r.getInt("id"));
            b.setDataInizio(r.getString("data_inizio"));
            b.setDataFine(r.getString("data_fine"));
            lb.add(i, b);
            i++;
        }
           r.close();
        return lb;
    }

  
}