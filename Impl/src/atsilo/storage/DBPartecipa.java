/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBPartecipa.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * fabio Napoli, 15/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */
package atsilo.storage;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Classe;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Insegna;
import atsilo.entity.Partecipa;
import atsilo.storage.DBBeans.Assegnazione;



public class DBPartecipa extends DBBeans<Partecipa> {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    /**
     * Costruttore
     * @param db connessione al database
     */
    public DBPartecipa(Database db){super("partecipa",db); }
    
    /**
     * Metodo che crea la chiave
     * @return lista string
     */
    private static List<String> creaChiave() {
        List<String> res=  Arrays.asList("-evento_nome","-evento_data","-classe");
        
        return Collections.unmodifiableList(res);
    }
    
    /**
     * metodo che associa all' attributo del database (nome attributo db) 
     * il rispettivo valore(nome attributo classe)
     * @return mappa <chiave,valore>
     */
    private static Map<String, String> creaMapping() {
        Map<String,String> res= new HashMap<String,String>();
        
        res.put("-eventoNome", "evento_nome");
        res.put("classe", "classe");
        res.put("-eventoData","evento_data");
        
        return Collections.unmodifiableMap(res);
    }
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    protected Map<String,String> getMappingFields(){return MAPPINGS;}
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    
    protected List<String> getKeyFields() {return CHIAVE;}
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */    
    protected Partecipa creaBean(ResultSet r) throws SQLException {
        Partecipa p=new Partecipa();
            Classe c = new Classe();
            c.setId(r.getInt("classe"));
            p.setEventoNome(r.getString("evento_nome"));
            p.setEventoData(r.getDate("evento_data"));
            p.setClasse(c);
        return p;
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
    protected Assegnazione[] creaAssegnazioni(Partecipa bean) {
        Assegnazione DBPartecipa_assegnazione = new Assegnazione("evento_nome",bean.getEventoNome());
        Assegnazione DBPartecipa_assegnazione1 = new Assegnazione("evento_data",bean.getEventoData());
        Assegnazione DBPartecipa_assegnazione2 = new Assegnazione("classe",bean.getClasse().getId());

        
        Assegnazione[] DBAssign = new Assegnazione[3];
        DBAssign[0] = DBPartecipa_assegnazione;
        DBAssign[1] = DBPartecipa_assegnazione1;
        DBAssign[2] = DBPartecipa_assegnazione2; 
        
        return DBAssign;
    }
    
/**
 * Dato il nome di un evento da in output la lista degli id
 * delle classi partecipanti all'evento
 * @param nome nome dell'evento 
 * @return lista di integer
 * @throws SQLException
 */
    public List<Integer> getClassiPerEvento (String nome) throws SQLException{
        List<Integer> l = new ArrayList<Integer>();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE evento_nome = ?");
        tabella.setParam(stmt, 1, "evento_nome", nome);
        ResultSet res = stmt.executeQuery();
        while(res.next())
            l.add(res.getInt("classe"));
        if(l.size()==0){
            res.close();
            return null;
        }else{
            res.close();
            return l;    
        }
      
    }
    
    
    
    
}
