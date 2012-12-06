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
 * Angelo Scafuro, Fabio Napoli, Luigi Lomasto, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBBando extends DBBeans<Bando> {
    
    private static final Map<String, String> MAPPINGS = creaMapping();
    private static final List<String> CHIAVE = creaChiave();
    
    
    /**
     * 
     * @param db
     */
    public DBBando(Database db) {
        super("Bando", db);
    }
    
    
    /**
     * metodo che asocia alla chiave(nome campo db) il rispettivo valore(nome
     * attributo classe)
     * 
     * @return
     */
    private static Map<String, String> creaMapping() {
        Map<String, String> res = new HashMap<String, String>();
        res.put("id", "id");// la classe Assenza del package entity ha come
                            // attributi (data e bambino)????
        res.put("data_inizio", "dataInizio");
        res.put("data_fine", "dataFine");
        
        
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
            b.setiD(r.getInt("id"));
            b.setDataInizio(r.getString("data_inizio"));
            b.setDataFine(r.getString("data_fine"));
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
     * @param id
     *            , identificativo usato per la ricerca del bando
     * @return restituisce il bando avente id ricercato oppure un bando vuoto
     *         nel caso in cui non trova un id
     * @throws SQLException
     *             nel caso in cui si verifica un errore di connessione
     */
    public Bando cercaBandoPerId(int id) throws SQLException {
        Bando b = new Bando();
        
        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM "
                + tabella.getNomeTabella() + "WHERE id = ?");
        tabella.setParam(stmt, 1, "id", id);
        ResultSet r = stmt.executeQuery();
        if (r.next()) {
            b.setiD(id);
            b.setDataInizio(r.getString("data_inizio"));
            b.setDataFine(r.getString("data_fine"));
            
        }
        r.close();
        return b;
    }
    
    
    /**
     * ricerca bando per una data inizio
     * 
     * @param dataInizio
     *            da ricercare nel database
     * @return lista di bandi aventi come data inizio la data passata tra i
     *         parametri, oppure una lista vuota qualora non ci fossero bandi
     *         con quella data d'inizio
     * @throws SQLException
     *             se si verifica un errore di connessione
     */
    public List<Bando> cercaPerDataInizio(String dataInizio)
            throws SQLException {
        List<Bando> lb = new ArrayList<Bando>();
        Bando b = new Bando();
        
        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM "
                + tabella.getNomeTabella() + "WHERE data_inizio = ?");
        tabella.setParam(stmt, 1, "data_inizio", dataInizio);
        ResultSet r = stmt.executeQuery();
        if (r.next()) {
            b.setiD(r.getInt("id"));
            b.setDataInizio(r.getString("data_inizio"));
            b.setDataFine(r.getString("data_fine"));
            lb.add(b);
            
        }
        r.close();
        return lb;
    }
    
    /**
     * ricerca bando per una specifica datafine
     * 
     * @param dataFine
     *            � la data ricercata nel database per indivuduare i bandi
     * @return lista di bandi aventi la datafine richiesta o una lista vuota se
     *         non esiste un bando avente come data di fine "datafine"
     * @throws SQLException
     *             se si verifica un eccezione nella connessione al database
     */
    public List<Bando> cercaPerDataFine(String dataFine) throws SQLException {
        List<Bando> lb = new ArrayList<Bando>();
        Bando b = new Bando();
        Date id, fine = new Date();
        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM "
                + tabella.getNomeTabella() + "WHERE data_fine = ?");
        tabella.setParam(stmt, 1, "data_fine", dataFine);
        ResultSet r = stmt.executeQuery();
        if (r.next()) {
            b.setiD(r.getInt("id"));
            b.setDataInizio(r.getString("data_inizio"));
            b.setDataFine(r.getString("data_fine"));
            lb.add(b);
            
        }
        r.close();
        return lb;
    }
    
    /**
     * dato che il bando � uno solo invece di fare i metodi di ricerca fammi un
     * solo metodo che mi restituisce un bando con il record completo
     *  e i metodi di modifica dei campi dei record 
     * @return
     */
    public Bando getBAndo() {
        return null;
    }
    /**
     * 
     * @param dataInizioBando
     * @param dataFineBando
     * @param dataInizioPresentazioneRinuncia
     * @param dataFinePresentazioneRinuncia
     * @param dataFineRinuncia
     * @return
     */
    
    public boolean modificaintervalli (String dataInizioBando, String dataFineBando, String dataInizioPresentazioneRinuncia, 
            String dataFinePresentazioneRinuncia, String dataFineRinuncia)
    {
        return true;
    }
    /**
     * 
     * @param postiDisponibili
     * @return
     * 
     */
    public boolean modificaPostiDisponibili( int postiDisponibili)
    {
        return true;
    }
    
}