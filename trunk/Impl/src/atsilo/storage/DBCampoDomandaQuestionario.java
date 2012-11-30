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

public class DBCampoDomandaQuestionario extends DBBeans<CampoDomandaQuestionario> {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    
    /**
     * Costruttore
     * @param db
     */
    public DBCampoDomandaQuestionario(Database db){ super("CampoDomandaQuestionario",db);}
    
    /**
     * Ricerca campodomandaquestionario per tipo
     * @param tipo
     * @return restituisce una lista di campodomandauestionario
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
    
    /**
     * cerca le domande questionario alle quali il campo appartiene
     * @param c
     * @return lista di stringhe
     * @throws SQLException 
     */
    public List<DomandaQuestionario> ricercaDomandaQuestionarioAppartenenza(CampoDomandaQuestionario c) throws SQLException
    {
        
        List<DomandaQuestionario> a=new ArrayList<DomandaQuestionario> ();
       
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE domanda_questionario = ?");
            tabella.setParam(stmt, 1, "domanda_questionario", c.getDomandaQuestionario().getId());
            ResultSet res = stmt.executeQuery();
        for(CampoDomandaQuestionario c1: iteraResultSet(res))
        { DomandaQuestionario d=c1.getDomandaQuestionario();
            a.add(d);
        }
   
        
        res.close();
        return a;
    }
    /**
     * cerca le risposte questionario alle quali il campo appartiene
     * @param c
     * @throws SQLException 
     * @returnlista di stringhe
     */
    public List<RispostaQuestionario> ricercaRispostaQuestionarioAppartenenza(CampoDomandaQuestionario c) throws SQLException{
        
        List<RispostaQuestionario> a= new ArrayList<RispostaQuestionario> ();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE risposta_questionario = ?");
            tabella.setParam(stmt, 1, "risposta_questionario", c.getRispostaQuestionario().getId());
            ResultSet res = stmt.executeQuery();
        for(CampoDomandaQuestionario c1: iteraResultSet(res))
        {
            RispostaQuestionario r= c1.getRispostaQuestionario();
            a.add(r);
        }
        
        res.close();
        return a;
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

    private static Map<String,String> creaMapping()
    {
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

    
    private static List<String> creaChiave()
    {
        List<String> res=  Arrays.asList("domanda_questionario","risposta_questionario");// da chiarire
        
        return Collections.unmodifiableList(res);
    }
    
    
    
    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected CampoDomandaQuestionario creaBean(ResultSet res) throws SQLException {
        CampoDomandaQuestionario temp = new CampoDomandaQuestionario();
        temp.getDomandaQuestionario().setId(res.getString("domanda_questionario"));
        temp.getRispostaQuestionario().setId(res.getString("risposta_questionario"));
        temp.setTipo(res.getString("tipo"));
        temp.setDescrizione(res.getString("descrizione"));
        temp.setValore(res.getString("valore"));
        return temp;
    }
    
    public List<CampoDomandaQuestionario> getCampiDomandaQuestionario(String idDomanda) throws SQLException{
        
        List<CampoDomandaQuestionario> l=null;
        CampoDomandaQuestionario c=new CampoDomandaQuestionario();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE id = ?");
            tabella.setParam(stmt, 1, "id", idDomanda);
            ResultSet res = stmt.executeQuery();
            
            while(res.next()){
               c.getDomandaQuestionario().setId(res.getString("domanda_questionario"));
                c.getRispostaQuestionario().setId(res.getString("risposta_questionario"));
                c.setTipo(res.getString("tipo"));
                c.setDescrizione(res.getString("descrizione"));
                c.setValore(res.getString("valore"));   
            l.add(c);
            }
        res.close();
            return l;
    }

}