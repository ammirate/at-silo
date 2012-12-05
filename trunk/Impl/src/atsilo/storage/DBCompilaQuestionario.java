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

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.CompilaQuestionario;
import atsilo.entity.Questionario;

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

public class DBCompilaQuestionario extends DBBeans<CompilaQuestionario> {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    /**
     * Costruttore
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
    /**
     * Ricerca nel database la lista delle chiavi dei genitori che hanno
     * compilato il questionario con id=idQuestionario
     * Il metodo provvede a caricare un istanza di una lista di Stringhe 
     * che rappresentano le chiavi di tutti i genitori che hanno compilato
     * il questionario con id=idQuestionario
     * @param idQuestionario      id del questionario di cui ricercare i genitori 
     * che l'hanno compilato.
     * @return lista di stringhe oppure Null
     * @throws SQLException
     */
    public List<String> getGenitoriPerQuestionarioCompilato(int idQuestionario) throws SQLException{
        
        List <String> l=new ArrayList<String> ();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE questionario = ? ");
        tabella.setParam(stmt, 1, "questionario", idQuestionario);
        ResultSet res = stmt.executeQuery();
        while(res.next()){
            l.add(res.getString("genitore"));//add codiceFiscale del genitore alla lista
        }
        res.close();
        return l;
    }
    /**
     * Ricerca nel database la lista delle chiavi dei questionari 
     * compilate dal genitore con codiceFiscale=codiceFiscale
     * Il metodo provvede a caricare un istanza di una lista di Integer 
     * che rappresentano le chiavi di tutti i questionari compilati dal
     * genitore con codiceFiscale=codiceFiscale
     * @param codiceFiscale     codice fiscale genitore di cui trovare i 
     * questionari compilati
     * @return lista di Integer oppure Null
     * @throws SQLException
     */
    public List<Integer> getQuestionariCompilatiPerGenitore (String codiceFiscale) throws SQLException{
        
        List <Integer> l=new ArrayList<Integer> ();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE genitore = ?");
        tabella.setParam(stmt, 1, "genitore", codiceFiscale);
        ResultSet res = stmt.executeQuery();
        while(res.next()){
            l.add(res.getInt("questionario"));//add idQuestionario del questionario alla lista
        }
        res.close();
        return l;
    }
    
    
    /**
     * Controlla nel database se uno specifico genitore
     * con codiceFiscale=codiceFiscale ha compilato un determinato questionario
     * con id=idQuestionario
     * @param codiceFiscale     codice fiscale genitore 
     * @param idQuestionario    id del questionario
     * @return boolean
     * @throws SQLException
     */
    public boolean isCompilatoDa(int idQuestionario,String codiceFiscale) throws SQLException{
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE genitore = ? AND questionario = ?");
        tabella.setParam(stmt, 1, "genitore", codiceFiscale);
        tabella.setParam(stmt, 2, "questionario", idQuestionario);
        
        
        ResultSet res = stmt.executeQuery();
        
        if(res.next()){//se res conterrà qualcosa vuol dire che la query ha prodotto risultato e quindi
            res.close();//e quindi ritorno true cio' vuole dire che il genitore con codiceFiscale=codiceFIscale
            return true;//ha compilato il questionario con id=idQuestionario altrimenti se res è vuoto ritorno false
        } 
        else {
            res.close();
            return false; 
        }
    }
    
    /**
     * dato l'id di un questionario restituisce il numero di genitori che lo hanno compilato
     * @param idQuestionario
     * @return
     * @throws SQLException
     */
    public int getNumeroCompilazioniQuestionario (int idQuestionario) throws SQLException
    {
        int i=0;
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT COUNT(*) FROM " + tabella.getNomeTabella() + " WHERE questionario = ?");
        tabella.setParam(stmt, 1, "questionario", idQuestionario);
        ResultSet res = stmt.executeQuery();
        
        while (res.next()){
           i=res.getInt("COUNT(*)");
        }
        
        return i;
    }
    
    
}
