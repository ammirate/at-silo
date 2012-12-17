/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBCompilaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Fabio Napoli, 01/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

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

import atsilo.entity.Classe;
import atsilo.entity.CompilaQuestionario;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Insegna;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;
import atsilo.storage.DBBeans.Assegnazione;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBCompilaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Fabio Napoli, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBInsegna extends DBBeans<Insegna> {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    /**
     * Costruttore
     * @param db connessione al database
     */
    public DBInsegna(Database db){super("insegna",db); }
    
    /**
     * Metodo che crea la chiave
     * @return lista string
     */
    private static List<String> creaChiave() {
        List<String> res=  Arrays.asList("-educatore_didattico","-classe");
        
        return Collections.unmodifiableList(res);
    }
    
    /**
     * metodo che associa all' attributo del database (nome attributo db) 
     * il rispettivo valore(nome attributo classe)
     * @return mappa <chiave,valore>
     */
    private static Map<String, String> creaMapping() {
        Map<String,String> res= new HashMap<String,String>();
        
        res.put("-educatoreDidattico", "educatore_didattico");
        res.put("-classe", "classe");
        
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
    protected Insegna creaBean(ResultSet r) throws SQLException {
        Insegna i=new Insegna();
            EducatoreDidattico ed = new EducatoreDidattico();
            ed.setCodiceFiscale(r.getString("educatore_didattico"));
            Classe c = new Classe();
            c.setId(r.getInt("classe"));
            i.setEducatoreDidattico(ed);
            i.setClasse(c);
        
        return i;
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
    protected Assegnazione[] creaAssegnazioni(Insegna bean) {
        Assegnazione DBDomandaQuestionario_assegnazione = new Assegnazione("educatore_didattico",bean.getEducatoreDidattico().getCodiceFiscale());
        Assegnazione DBGenitore_assegnazione = new Assegnazione("classe",bean.getClasse().getId());
        
        Assegnazione[] DBAssign = new Assegnazione[2];
        DBAssign[0] = DBDomandaQuestionario_assegnazione;
        DBAssign[1] = DBGenitore_assegnazione;
        
        return DBAssign;
    }
    
public List<EducatoreDidattico> getEducatoriPerClasse (int idClasse) throws SQLException{
        
        List <EducatoreDidattico> l=new ArrayList<EducatoreDidattico> ();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE classe = ?");
        tabella.setParam(stmt, 1, "classe", idClasse);
        ResultSet res = stmt.executeQuery();
        while(res.next()){
            EducatoreDidattico toAdd = new EducatoreDidattico();
            toAdd.setCodiceFiscale(res.getString("educatore_didattico"));
            l.add(toAdd);//add idQuestionario del questionario alla lista
        }
        res.close();
        return l;
    }

public List<Classe> getClassiPerEducatore (String cf) throws SQLException{
    
    List <Classe> l=new ArrayList<Classe> ();
    PreparedStatement stmt = tabella.prepareStatement(
            "SELECT * FROM " + tabella.getNomeTabella() + " WHERE educatore_didattico = ?");
    tabella.setParam(stmt, 1, "educatore_didattico", cf);
    ResultSet res = stmt.executeQuery();
    while(res.next()){
        Classe toAdd = new Classe();
        toAdd.setId(res.getInt("classe"));
        l.add(toAdd);//add idQuestionario del questionario alla lista
    }
    res.close();
    return l;
}
    
    
    
    
}
