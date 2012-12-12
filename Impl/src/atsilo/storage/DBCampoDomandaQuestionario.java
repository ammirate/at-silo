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
import atsilo.storage.DBBeans.Assegnazione;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBCampoDomandaQuestionario.java
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
    public DBCampoDomandaQuestionario(Database db){ super("campo_domanda_questionario",db);}
    
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
        res.put("tipo","tipo");
        res.put("descrizione","descrizione");
        res.put("valore","valore");
     
        
        return Collections.unmodifiableMap(res);
    }
    
    /**
     * Metodo che crea la chiave
     * @return lista string
     */
    private static List<String> creaChiave(){
        
        List<String> res=  Arrays.asList("domanda_questionario");
        
        return Collections.unmodifiableList(res);
    }
    
    
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    protected CampoDomandaQuestionario creaBean(ResultSet res) throws SQLException {
        CampoDomandaQuestionario temp = new CampoDomandaQuestionario();
        temp.setIdDomandaQuestionario(res.getInt("domanda_questionario"));
        temp.setIdRispostaQuestionario(res.getInt("risposta_questionario"));
        temp.setTipo(res.getString("tipo"));
        temp.setDescrizione(res.getString("descrizione"));
        temp.setValore(res.getString("valore"));
        return temp;
    }
    
    /**
     * Restituisce tutti i campi domanda di una determinata domanda questionario
     * @param idDomanda id della domanda di cui restituire i campi domanda
     * @return lista di campi domanda oppure null
     * @throws SQLException
     */
    public List<CampoDomandaQuestionario> getCampiDomandaQuestionario(int idDomanda) throws SQLException{
        
        List<CampoDomandaQuestionario> l=new ArrayList<CampoDomandaQuestionario>();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE domanda_questionario = ?");
        tabella.setParam(stmt, 1, "domanda_questionario", idDomanda);
        ResultSet res = stmt.executeQuery();
        
        while(res.next()){
            CampoDomandaQuestionario c=new CampoDomandaQuestionario();
            
            c.setIdDomandaQuestionario(res.getInt("domanda_questionario"));
            c.setIdRispostaQuestionario(res.getInt("risposta_questionario"));
            c.setTipo(res.getString("tipo"));
            c.setDescrizione(res.getString("descrizione"));
            c.setValore(res.getString("valore"));   
            l.add(c);
        }
        res.close();
        return l;
    }
    
    
  
    
    /**
     * Metodo utilizzato dagli altri metodi di DBBeans per ricavare le
     * assegnazioni predefinite relativamente a un bean.<br/>
     * Nella sua implementazione predefinita, questo metodo restituisce sempre
     * {@link #NESSUNA_ASSEGNAZIONE}. Le classi estendenti possono sovrascrivere
     * questo metodo per indicare in modo comodo delle assegnazioni predefinite
     * per tutti i metodi di modifica della base di dati.
     * 
     * @param bean
     *            Bean per cui valutare le assegnazioni
     * @return Array di assegnazioni
     */
    protected Assegnazione[] creaAssegnazioni(CampoDomandaQuestionario bean) {
        Assegnazione DBDomandaQuestionario_assegnazione = new Assegnazione("domanda_questionario",bean.getIdDomandaQuestionario());
        Assegnazione DBDomandaQuestionario_assegnazione1 = new Assegnazione("risposta_questionario",bean.getIdRispostaQuestionario());
        Assegnazione[] DBAssign = new Assegnazione[2];
        DBAssign[0]=DBDomandaQuestionario_assegnazione;
        DBAssign[1]=DBDomandaQuestionario_assegnazione1;
        
        return DBAssign;
    }
    
}


