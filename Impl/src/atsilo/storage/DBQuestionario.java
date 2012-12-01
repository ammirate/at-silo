package atsilo.storage;

import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.ProgrammaEducativoSettimanale;
import atsilo.entity.Questionario;
import atsilo.entity.Registro;

import atsilo.entity.RispostaQuestionario;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class DBQuestionario extends DBBeans{
    /**
     * Crea un gestore per il bean Questionario
     * @param nomeTabella nome reale della tabella nel database
     * @param db database con relativa connessione
     */
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    Tabella tabella;
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
        if (r.next()){
            q.setDescrizione(r.getString("descrizione"));
            q.setFlag_rinuncia(r.getString("flag_rinuncia"));
            q.setId(r.getInt("id"));
            q.setNome(r.getString("nome"));
            q.setPathname(r.getString("pathname"));
            q.setPeriodo_fine(r.getDate("periodo_fine"));
            q.setPeriodo_inizio(r.getDate("periodo_inizio"));   
        }
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
        List <Questionario> l=null;
        Questionario q=new Questionario();
        
        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM "
        + tabella.getNomeTabella() + "WHERE id = ?");
         tabella.setParam(stmt, 1, "nome", n);
         ResultSet res = stmt.executeQuery();
            
        while(res.next()){
            
            q.setDescrizione(res.getString("descrizione"));
            q.setFlag_rinuncia(res.getString("flag_rinuncia"));
            q.setId(res.getInt("id"));
            q.setNome(res.getString("nome"));
            q.setPathname(res.getString("pathname"));
            q.setPeriodo_fine(res.getDate("periodo_fine"));
            q.setPeriodo_inizio(res.getDate("periodo_inizio")); 
           
            l.add(q);
            res.close();
        }   
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
       
        List<Questionario> l=null;
        Questionario q=new Questionario();; 
        
        ResultSet res=tabella.getDatabase().directQuery("SELECT * FROM "
        + tabella.getNomeTabella()+ "WHERE NOW()"
        +" BETWEEN periodo_inizio AND periodo_fine");
        
            while(res.next()){
            
            q.setDescrizione(res.getString("descrizione"));
            q.setFlag_rinuncia(res.getString("flag_rinuncia"));
            q.setId(res.getInt("id"));
            q.setNome(res.getString("nome"));
            q.setPathname(res.getString("pathname"));
            q.setPeriodo_fine(res.getDate("periodo_fine"));
            q.setPeriodo_inizio(res.getDate("periodo_inizio"));         
            l.add(q);
            
            }    
         res.close();   
        return l;
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
                 "SELECT * FROM " + tabella.getNomeTabella() + "WHERE id = ?");
             tabella.setParam(stmt, 1, "id", idQuestionario);
             ResultSet res = stmt.executeQuery();
             
             if(res.next()){
                 q.setDescrizione(res.getString("descrizione"));
                 q.setFlag_rinuncia(res.getString("flag_rinuncia"));
                 q.setId(res.getInt("id"));
                 q.setNome(res.getString("nome"));
                 q.setPathname(res.getString("pathname"));
                 q.setPeriodo_fine(res.getDate("periodo_fine"));
                 q.setPeriodo_inizio(res.getDate("periodo_inizio"));   
             }
         res.close();
             return q;

     }
    
   
    
}