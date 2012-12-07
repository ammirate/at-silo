package atsilo.storage;

import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.ProgrammaEducativoSettimanale;
import atsilo.entity.Questionario;
import atsilo.entity.Registro;

import atsilo.entity.RispostaQuestionario;
import atsilo.storage.DBBeans.Assegnazione;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBAQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Fabio Napoli, Luigi Lomasto, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBQuestionario extends DBBeans<Questionario>{
    /**
     * Crea un gestore per il bean Questionario
     */
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    
    /**
     * Costruttore con parametri
     * @param db database con relativa connessione
     */ 
    public DBQuestionario(Database db){super("Questionario",db);}
    
    
    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map<String, String>  getMappingFields() {return MAPPINGS;}
    
    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List<String> getKeyFields() {return CHIAVE;}
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Questionario creaBean(ResultSet r) throws SQLException {
        Questionario q=new Questionario();
            q.setDescrizione(r.getString("descrizione"));
            q.setFlag_rinuncia(r.getString("flag_rinuncia"));
            q.setId(r.getInt("id"));
            q.setNome(r.getString("nome"));
            q.setPeriodo_fine(r.getDate("periodo_fine"));
            q.setPeriodo_inizio(r.getDate("periodo_inizio"));   
        return q;
    }
    
    /**
     * metodo che associa all' attributo del database (nome attributo db) 
     * il rispettivo valore(nome attributo classe)
     * @return mappa <chiave,valore>
     */
    private static Map<String, String> creaMapping() {
        
        Map<String,String> res= new HashMap<String,String>();
        res.put("descrizione", "descrizione");
        res.put("id", "id");
        res.put("flag_rinuncia", "flag_rinuncia");
        res.put("pathname", "pathname");
        res.put("nome", "nome");
        res.put("periodo_inizio", "periodo_inizio");
        res.put("periodo_fine", "periodo_fine");
        
        return Collections.unmodifiableMap(res);
    }
    
    /**
     * Metodo che crea una chiave
     * @return 
     */
    private static List<String> creaChiave() {
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }
    
    
   
    /**
     * Ricerca nel database un questionario a 
     * seconda del nome fornito in input.
     * Il metodo provvede a caricare un istanza di una lista di Questionari 
     * @param n      Nome del questionario da ricercare
     * @return lista di questionario oppure Null
     * @throws SQLException
     */
    public List<Questionario> ricercaQuestionariPerNome (String n) throws SQLException{
        List <Questionario> l= new ArrayList<Questionario>();
      
        
        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM "
                + tabella.getNomeTabella() + " WHERE nome= ?");
        tabella.setParam(stmt, 1, "nome", n);
        ResultSet res = stmt.executeQuery();
        
        while(res.next()){
            Questionario q=new Questionario();
            q.setDescrizione(res.getString("descrizione"));
            q.setFlag_rinuncia(res.getString("flag_rinuncia"));
            q.setId(res.getInt("id"));
            q.setNome(res.getString("nome"));
            q.setPeriodo_fine(res.getDate("periodo_fine"));
            q.setPeriodo_inizio(res.getDate("periodo_inizio")); 
            
            l.add(q);
            
        }  
        res.close();
        return l;
    }
    
    /**
     * Ricerca nel database la lista dei questionari
     * che possono essere compilati.
     * Il metodo provvede a caricare un istanza di una lista di Questionario
     * @return lista di questionario oppure Null
     * @throws SQLException
     */
    
    public List<Questionario> visualizzaQuestionariCompilabili() throws SQLException{
        
        List<Questionario> lista_q_compilabili=new ArrayList<Questionario> ();
        Questionario q=new Questionario();
       
        
        Iterable<Questionario> i;
        
        i = this.getAll();
        Iterator<Questionario> it = i.iterator();
        
        while(it.hasNext())
        {
            q=it.next();
           // System.out.println("comp-all"+q.getDescrizione());
          /*  ResultSet res=tabella.getDatabase().directQuery("SELECT * FROM "
             + tabella.getNomeTabella()+ "WHERE  id="+q.getId()+ " AND NOW() "
             +" BETWEEN "+ q.getPeriodo_inizioString()+" AND "+q.getPeriodo_fineString());
            */
            PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM " + tabella.getNomeTabella() + 
                    " WHERE id = ? AND NOW() BETWEEN ? AND ? " );
            tabella.setParam(stmt, 1,"id", q.getId());
            tabella.setParam(stmt, 2, "periodo_inizio", q.getPeriodo_inizioString());
            tabella.setParam(stmt, 3, "periodo_fine", q.getPeriodo_fineString());
            ResultSet res = stmt.executeQuery();
           
              while(res.next())  
              {  
                Questionario questionario_compilabile=new Questionario();
                questionario_compilabile.setDescrizione(res.getString("descrizione"));
                questionario_compilabile.setFlag_rinuncia(res.getString("flag_rinuncia"));
                questionario_compilabile.setId(res.getInt("id"));
                questionario_compilabile.setNome(res.getString("nome"));
                questionario_compilabile.setPeriodo_fine(res.getDate("periodo_fine"));
                questionario_compilabile.setPeriodo_inizio(res.getDate("periodo_inizio"));         
                lista_q_compilabili.add(questionario_compilabile);
              
              }
             res.close();
        }
        
       
         
        return lista_q_compilabili;
    }
    
    /**
     * Ricerca nel database un questionario a secondo dell'
     *  id fornito in input.
     * Il metodo provvede a caricare un istanza di un Questionario
     * @param idQuestionario Id del questionario da ricercare
     * @return questionario oppure Null
     * @throws SQLException
     */
    public Questionario getQuestionario(int idQuestionario) throws SQLException{
        
        Questionario q=new Questionario();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE id = ?");
        tabella.setParam(stmt, 1, "id", idQuestionario);
        
        ResultSet res = stmt.executeQuery();
        
        
        if(res.next()){
            q.setDescrizione(res.getString("descrizione"));
            q.setFlag_rinuncia(res.getString("flag_rinuncia"));
            q.setId(res.getInt("id"));
            q.setNome(res.getString("nome"));
            q.setPeriodo_fine(res.getDate("periodo_fine"));
            q.setPeriodo_inizio(res.getDate("periodo_inizio"));   
        }
        res.close();
        return q;
        
    }
    
    
    
}