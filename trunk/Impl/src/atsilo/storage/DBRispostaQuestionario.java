package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;
import atsilo.storage.DBBeans.Assegnazione;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
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
 * FILE: DBRispostaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Fabio Napoli, 17/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class DBRispostaQuestionario extends DBBeans {
    
    /**
     * Crea un gestore per il bean RispostaQuestionario
     */
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    /**
     * Costruttore con parametri
     * @param db database con relativa connessione
     */
    public DBRispostaQuestionario(Database db){ super("risposta_questionario",db);}
    
    /**
     * Metodo che crea la chiave
     * @return lista string
     */
    private static List<String> creaChiave() {
        
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }
    
    /**
     * metodo che associa all' attributo del database (nome attributo db) 
     * il rispettivo valore(nome attributo classe)
     * @return mappa <chiave,valore>
     */
    private static Map<String, String> creaMapping() {
        Map<String,String> res= new HashMap<String,String>();
        res.put("id", "id");
        res.put("valore", "valore");
        res.put("domanda", "domanda");
        res.put("genitore", "genitore");
        
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
    
    /*(-nonJavadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    protected RispostaQuestionario creaBean(ResultSet r) throws SQLException {
        RispostaQuestionario ris = new RispostaQuestionario();
        if(r.next())
        {
            ris.setId(r.getInt("id"));
            ris.setValore(r.getString("valore"));
            ris.setCFgenitore(r.getString("genitore"));
            ris.setIdDomanda(r.getInt("domanda"));
        }
        return ris;
    }
    
    
    /**
     * Restituisce la lista delle risposte data da un
     * determinato genitore ad un questionario
     * @param g Codice fiscale genitore di cui vogliamo le risposte
     * @param idQuestionario id del questionario di cui vogliamo  le risposte
     * @return lista di RisposteQuestionario o null
     * @throws SQLException
     */
    public List <RispostaQuestionario> getRisposteQuestionarioPerGenitore(String g,int idQuestionario) throws SQLException{
        List<RispostaQuestionario> l =new ArrayList<RispostaQuestionario> ();
        
        
        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM " + tabella.getNomeTabella() + 
                " WHERE genitore = ? AND questionario = ?");
        tabella.setParam(stmt, 1,"genitore", g);
        tabella.setParam(stmt, 2, "questionario", idQuestionario);
        ResultSet res = stmt.executeQuery();
        
        while (res.next()){
            RispostaQuestionario ris=new RispostaQuestionario();

            ris.setId(res.getInt("id"));
            ris.setValore(res.getString("valore"));
            ris.setCFgenitore(res.getString("genitore"));
            ris.setIdDomanda(res.getInt("domanda"));
            
            l.add(ris);
        }
        res.close();
        return l;
    }
    
    
    /**
     * Restituisce la lista delle risposte date da tutti i genitori
     * ad una specifica domanda di un questionario
     * @param d id domanda di cui vogliamo le risposte
     * @return lista di RisposteQuestionario o null
     * @throws SQLException
     */    
    public List<RispostaQuestionario> getRisposteDomandaSpecifica(int  d) throws SQLException{        
        List<RispostaQuestionario> l=new ArrayList <RispostaQuestionario>();
        
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE domanda= ?");
        tabella.setParam(stmt, 1, "domanda", d);
        ResultSet res = stmt.executeQuery();
        
        while (res.next()){
            RispostaQuestionario r=new RispostaQuestionario();

            r.setId(res.getInt("id"));
            r.setValore(res.getString("valore"));
            r.setCFgenitore(res.getString("genitore"));
            r.setIdDomanda(res.getInt("domanda"));
            
            l.add(r);
        }
        res.close();
        return l;
        
    }
    
    /**
     * Restituisce la lista delle risposte date da un genitore
     * @param CFgenitore Codice fiscale del genitore di cui vogliamo le risposte
     * @return lista di RisposteQuestionario o null
     * @throws SQLException
     */    
    public List<RispostaQuestionario> getRisposteGenitore(String CFgenitore) throws SQLException{        
        List<RispostaQuestionario> l=new ArrayList <RispostaQuestionario>();
        
        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM " + tabella.getNomeTabella() + 
                " WHERE genitore = ?");
        tabella.setParam(stmt, 1,"genitore", CFgenitore);
        ResultSet res = stmt.executeQuery();
        
        while (res.next()){
            RispostaQuestionario r=new RispostaQuestionario();

            r.setId(res.getInt("id"));
            r.setValore(res.getString("valore"));
            r.setCFgenitore(res.getString("genitore"));
            r.setIdDomanda(res.getInt("domanda"));
            
            l.add(r);
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
    protected Assegnazione[] creaAssegnazioni(RispostaQuestionario bean, Genitore genitore) {
        Assegnazione DBDomandaQuestionario_assegnazione = new Assegnazione("domanda",bean.getIdDomanda());
        Assegnazione DBGenitore_assegnazione = new Assegnazione("genitore",genitore.getCodiceFiscale());
        
        Assegnazione[] DBAssign = new Assegnazione[2];
        DBAssign[0] = DBDomandaQuestionario_assegnazione;
        DBAssign[1] = DBGenitore_assegnazione;
        return DBAssign;
    }
    
}




    