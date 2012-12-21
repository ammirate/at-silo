package atsilo.storage;

import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.Classe;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.RispostaQuestionario;

import atsilo.entity.Questionario;
import atsilo.storage.DBBeans.Assegnazione;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
 * FILE: DBDomandaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBDomandaQuestionario extends DBBeans<DomandaQuestionario> {
    
    /**
     * Crea un gestore per il bean DomandaQuestionario
     * @author Fabio Napoli
     */
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    /**
     * Costruttore
     * @param db connessione al db
     */
    public DBDomandaQuestionario(Database db){super("domanda_questionario",db);}
    
    /**
     * Metodo che crea la chiave
     * @return lista string
     */
    private static List<String> creaChiave(){
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }
    
    /**
     * metodo che associa all' attributo del database (nome attributo db) 
     * il rispettivo valore(nome attributo classe)
     * @return mappa <chiave,valore>
     */
    private static Map<String,String> creaMapping(){
        Map<String,String> res= new HashMap<String,String>();
        res.put("id","id");
        res.put("descrizione","descrizione");
        
        return Collections.unmodifiableMap(res);
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
    
    /*
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */    
    protected DomandaQuestionario creaBean(ResultSet r) throws SQLException {
        DomandaQuestionario temp = new DomandaQuestionario();
        temp.setId(r.getInt("id"));
        temp.setDescrizione(r.getString("descrizione"));
        temp.setIdQuestionario(r.getInt("questionario"));          
        return temp;
    }
    
    
    
    /**
     * Data l'id di una domanda viene restituita
     * l' oggetto bean corrispondente
     * @param idDomanda id della domanda da restituire
     * @return domanda questionario con id=idDomanda oppure null
     * @throws SQLException
     */
    public DomandaQuestionario getDomanda(int idDomanda) throws SQLException{
        
        DomandaQuestionario q=new DomandaQuestionario();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " +  tabella.getNomeTabella()  + " WHERE id = ?");
        tabella.setParam(stmt, 1, "id", idDomanda);
        ResultSet res = stmt.executeQuery();
        
        while(res.next()){
            q.setId(res.getInt("id"));
            q.setDescrizione(res.getString("descrizione"));
            q.setIdQuestionario(res.getInt("questionario"));  
           
        }
        res.close();
        return q;
        
    }
    
    
    
    /**
     * Dato l'id di un questionario vengono restituite le
     * domande che compongono il questionario con id=idQuestionario
     * @param idQuestionario id del questionario di cui restituire le domande
     * @return lista di domandeQuestionario  oppure null
     * @throws SQLException
     */
    public List<DomandaQuestionario> getDomandeQuestionario(int idQuestionario)
            throws SQLException{
        List<DomandaQuestionario> l=new ArrayList<DomandaQuestionario>();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE questionario = ?");
        tabella.setParam(stmt, 1, "questionario", idQuestionario);
        ResultSet res = stmt.executeQuery();
        
        while (res.next()){
            DomandaQuestionario temp = new DomandaQuestionario();
            temp.setId(res.getInt("id"));
            temp.setDescrizione(res.getString("descrizione"));
            temp.setIdQuestionario(res.getInt("questionario"));  
            l.add(temp);
        }
        res.close();
        return l;
    }
    
    /**
     * Data l'id di una domanda e l id del questionario viene restituito 
     * vero o falso a seconda se la domanda è presente o meno nel Questionario
     * @param idDomanda id della domanda da controllare
     * @param idQuestionario id del questionario dove verificare l'esistenza della domanda
     * @return boolean 
     * @throws SQLException
     */
    public boolean isDomandaInQuestionario(int idDomanda,int idQuestionario) throws SQLException{
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella()  + " WHERE id = ? AND questionario = ?");
        tabella.setParam(stmt, 1, "id", idDomanda);
        tabella.setParam(stmt, 2, "questionario", idQuestionario);

        ResultSet res = stmt.executeQuery();
        
        if(res.next()){
            res.close();
            return true;
        }   
        else{
            res.close();
            return false;
        }
        
        
        
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
    protected Assegnazione[] creaAssegnazioni(DomandaQuestionario bean) {
        Assegnazione DBDomandaQuestionario_assegnazione = new Assegnazione("questionario",bean.getIdQuestionario());
        Assegnazione[] DBAssign = new Assegnazione[1];
        DBAssign[0]=DBDomandaQuestionario_assegnazione;
        return DBAssign;
    }
}