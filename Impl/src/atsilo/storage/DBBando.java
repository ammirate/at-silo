package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.Bando;
import atsilo.entity.Genitore;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Collections;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBBando.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro,Luigi Lomasto,Fabio Napoli 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBBando extends DBBeans<Bando> {
    
    /**
     * Crea il gestore del bean Bando
     * 
     */
    private static final Map<String, String> MAPPINGS = creaMapping();
    private static final List<String> CHIAVE = creaChiave();
    
    
    /**
     * 
     * @param db
     */
    public DBBando(Database db) {
        super("bando", db);
    }
    
    
    /**
     * metodo che asocia alla chiave(nome campo db) il rispettivo valore(nome
     * attributo classe)
     * 
     * @return
     */
    private static Map<String, String> creaMapping() {
        Map<String, String> res = new HashMap<String, String>();
        res.put("id", "id");
        res.put("data_inizio_bando", "dataInizioBando");
        res.put("data_fine_bando", "dataFineBando");
        res.put("data_inizio_presentazione", "dataInizioPresentazione");
        res.put("data_fine_presentazione", "dataFinePresentazione");
        res.put("data_fine_rinuncia", "dataFineRinuncia");
        res.put("posti_disponibili", "postiDisponibili");
        res.put("path", "path");     
        
        return Collections.unmodifiableMap(res);
    }
    
    /**
     * Metodo che crea la chiave
     * 
     * @return
     */
    private static List<String> creaChiave() {
        List<String> res = Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }
    
    
    /*
     * (non-Javadoc)
     * 
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Bando creaBean(ResultSet r) throws SQLException {
        Bando b = new Bando();
        if (r.next()) {
            b.setId(r.getInt("id"));
            b.setDataInizioBando(r.getString("data_inizio_bando"));
            b.setDataFineBando(r.getString("data_fine_bando"));
            b.setDataFinePresentazioneRinuncia(r.getString("data_fine_presentazione_rinuncia"));
            b.setDataInizioPresentazioneRinuncia(r.getString("data_inizio_presentazione_rinuncia"));
            b.setDataFineRinuncia(r.getString("data_fine_rinuncia"));
            b.setPostiDisponibili(r.getInt("posti_disponibili"));
            b.setPath(r.getString("path"));
        }
        
        return b;
    }
    
    /*
     * (non-Javadoc)
     * 
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    public Map getMappingFields() {
        return MAPPINGS;
    }
    
    /*
     * (non-Javadoc)
     * 
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    public List getKeyFields() {
        return CHIAVE;
    }
    
    
    /**
     * cerca bando per il valore di un id specifico.
     * 
     * @param id identificativo usato per la ricerca del bando
     * @return restituisce il bando avente id ricercato oppure null
     *         nel caso in cui non trova un bando con quell id
     * @throws SQLException
     *             nel caso in cui si verifica un errore di connessione
     */
    public Bando cercaBandoPerId(int id) throws SQLException {
        
        Bando b = new Bando();
        
        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM "
                + tabella.getNomeTabella() + " WHERE id = ?");
        tabella.setParam(stmt, 1, "id", id);
        ResultSet r = stmt.executeQuery();
       
        if (r.next()) {
            b.setId(r.getInt("id"));
            b.setDataInizioBando(r.getString("data_inizio_bando"));
            b.setDataFineBando(r.getString("data_fine_bando"));
            b.setDataFinePresentazioneRinuncia(r.getString("data_fine_presentazione_rinuncia"));
            b.setDataInizioPresentazioneRinuncia(r.getString("data_inizio_presentazione_rinuncia"));
            b.setDataFineRinuncia(r.getString("data_fine_rinuncia"));
            b.setPostiDisponibili(r.getInt("posti_disponibili"));
            b.setPath(r.getString("path"));
        }
        else
            b=null;
       
        r.close();
        return b;
    }
    
    
       
    /**
     * restituisce l'unico bando presente nel database
     * 
     * 
     * @return Bando se presente null se non vi è alcun bando
     * @throws SQLException
     */
    public Bando getBando() throws SQLException {
        
        Bando b=new Bando();
        
        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM "
                + tabella.getNomeTabella());
        ResultSet r = stmt.executeQuery();
      
        if (r.next()) {
            b.setId(r.getInt("id"));
            b.setDataInizioBando(r.getString("data_inizio_bando"));
            b.setDataFineBando(r.getString("data_fine_bando"));
            b.setDataFinePresentazioneRinuncia(r.getString("data_fine_presentazione_rinuncia"));
            b.setDataInizioPresentazioneRinuncia(r.getString("data_inizio_presentazione_rinuncia"));
            b.setDataFineRinuncia(r.getString("data_fine_rinuncia"));
            b.setPostiDisponibili(r.getInt("posti_disponibili"));
            b.setPath(r.getString("path"));
        }
        else
            b=null;
        
        return b;
    }
    
    
   
    
}