package atsilo.storage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Assenza;
import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.RispostaQuestionario;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBDomandaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Fabio Napoli, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBCampoDomandaQuestionario extends DBBeans<CampoDomandaQuestionario> {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    
    /**
     * Costruttore
     * @param db connesione al database
     */
    public DBCampoDomandaQuestionario(Database db){ super("CampoDomandaQuestionario",db);}
    
    /**
     * Ricerca campodomandaquestionario per tipo
     * @param tipo
     * @return restituisce una lista di campodomandaquestionario
     * @throws SQLException 
     */
    public List<CampoDomandaQuestionario> ricercaPerTipo(String tipo) throws SQLException
    {
        List<CampoDomandaQuestionario> a= new ArrayList<CampoDomandaQuestionario> ();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE tipo = ?");
        tabella.setParam(stmt, 1, "tipo", tipo);
        ResultSet res = stmt.executeQuery();
        for (CampoDomandaQuestionario c : iteraResultSet(res)) 
            a.add(c);
        
        
        res.close();
        return a;
    } 
    
    
    
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    protected Map getMappingFields() {
        return MAPPINGS;
    }
    
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    protected List getKeyFields() {
        return CHIAVE;
    }
    /**
     * metodo che associa all' attributo del database (nome attributo db) 
     * il rispettivo valore(nome attributo classe)
     * @return mappa <chiave,valore>
     */
    private static Map<String,String> creaMapping(){
        
        Map<String,String> res= new HashMap<String,String>();
        res.put("domanda_questionario","domandaQuestionario");
        res.put("tipo","tipo");
        res.put("descrizione","descrizione");
        res.put("valore","valore");
        res.put("risposta_questionario","rispostaQuestionario");
        res.put("domanda_questionario","domandaQuestionario");
        res.put("risposta_questionario","rispostaQuestionario");
        
        return Collections.unmodifiableMap(res);
    }
    
    /**
     * Metodo che crea la chiave
     * @return lista string
     */
    private static List<String> creaChiave(){
        
        List<String> res=  Arrays.asList("domanda_questionario","risposta_questionario");// da chiarire
        
        return Collections.unmodifiableList(res);
    }
    
    
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    protected CampoDomandaQuestionario creaBean(ResultSet res) throws SQLException {
        CampoDomandaQuestionario temp = new CampoDomandaQuestionario();
        temp.setIdDomandaQuestionario(res.getString("domanda_questionario"));
        temp.setIdRispostaQuestionario(res.getString("risposta_questionario"));
        temp.setTipo(res.getString("tipo"));
        temp.setDescrizione(res.getString("descrizione"));
        temp.setValore(res.getString("valore"));
        return temp;
    }
    
    /**
     * Restituisce tutti i campi domanda di una determinata domanda questionario
     * @param i id della domanda di cui restituire i campi domanda
     * @return lista di campi domanda oppure null
     * @throws SQLException
     */
    public List<CampoDomandaQuestionario> getCampiDomandaQuestionario(int i) throws SQLException{
        
        List<CampoDomandaQuestionario> l=new ArrayList<CampoDomandaQuestionario>();
        CampoDomandaQuestionario c=new CampoDomandaQuestionario();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE id = ?");
        tabella.setParam(stmt, 1, "id", i);
        ResultSet res = stmt.executeQuery();
        
        while(res.next()){
            c.setIdDomandaQuestionario(res.getString("domanda_questionario"));
            c.setIdRispostaQuestionario(res.getString("risposta_questionario"));
            c.setTipo(res.getString("tipo"));
            c.setDescrizione(res.getString("descrizione"));
            c.setValore(res.getString("valore"));   
            l.add(c);
        }
        res.close();
        return l;
    }
    
}
    

  