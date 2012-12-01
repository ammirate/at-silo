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
 * fabio, 01/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.storage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.CompilaQuestionario;

/**
     * Crea un gestore per il bean CompilaQuestionario 
     * @param nomeTabella nome reale della tabella nel database
     * @param db database con relativa connessione
     * @author fabio
     */
public class DBCompilaQuestionario extends DBBeans<CompilaQuestionario> {

    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
   
    /**
     * Costruttore
     * @param nomeTabella nome  tabella nel database
     * @param db connessione al database
     */
    public DBCompilaQuestionario(Database db){super("Compila",db); }

    /**
     * Metodo che crea la chiave
     * @return lista string
     */
    private static List<String> creaChiave() {
List<String> res=  Arrays.asList("genitore","questionario");
        
        return Collections.unmodifiableList(res);
    }

    /**
     * metodo che associa all' attributo del database (nome attributo db) 
     * il rispettivo valore(nome attributo classe)
     * @return mappa <chiave,valore>
     */
    private static Map<String, String> creaMapping() {
        Map<String,String> res= new HashMap<String,String>();
      
        res.put("genitore", "genitore");
        res.put("questionario", "questionario");

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
    protected CompilaQuestionario creaBean(ResultSet r) throws SQLException {
        CompilaQuestionario c=new CompilaQuestionario();
        if (r.next()){
            c.setGenitore(r.getString("genitore"));
            c.setQuestionario(r.getInt("questionario"));
        }
        return c;
    }
    public List<String> getGenitoriPerQuestionarioCompilato(int idQuestionario){return null;}
    public List<Integer> getQuestionariCompilatiPerGenitore (String codiceFiscale){return null;}
    public boolean isCompilatoDa(int idQuestionario,String codicefiscale){return false;}
    
   }
