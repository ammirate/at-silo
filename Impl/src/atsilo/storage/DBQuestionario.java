package atsilo.storage;

import atsilo.entity.Attivita;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.ProgrammaEducativoSettimanale;
import atsilo.entity.Questionario;
import atsilo.entity.Registro;

import atsilo.entity.RispostaQuestionario;

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
public class DBQuestionario extends DBBeans
{
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    Tabella tabella;
    
    public DBQuestionario(Database db){super("Questionario",db);}
    
   
    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() {return MAPPINGS;}

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {return CHIAVE;}

    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    
    @Override
    protected Questionario creaBean(ResultSet r) throws SQLException {
        Questionario q=null;
        if (r.next()){
            q.setDescrizione(r.getString("descrizione"));
            q.setFlag_rinuncia(r.getString("flag_rinuncia"));
            q.setId(r.getInt("id"));
            q.setNome(r.getString("nome"));
            q.setPathname(r.getString("pathname"));
            q.setPeriodo_fine(r.getDate("periodo_fine"));
            q.setPeriodo_inizio(r.getDate("periodo_inizio"));   
            q.setListaGenitori((List<Genitore>)r.getObject("lista_genitori"));
        }
        return q;
    }
   
    /**
     * @return
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
        res.put("listagenitori", "lista_genitori");
        return Collections.unmodifiableMap(res);
    }
    
    /**
     * Metodo che crea una chiave
     * @return 
     */
    private static List<String> creaChiave()
    {
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }
    
    
    
    
   
    
    public List<Questionario> ricercaQuestionariPerNome (String n) throws SQLException{
        List <Questionario> l=null;
        Questionario q=null;
        
        ResultSet res=tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella()+ "WHERE nome =" + n);
        while(res.next()){
            
            q.setDescrizione(res.getString("descrizione"));
            q.setFlag_rinuncia(res.getString("flag_rinuncia"));
            q.setId(res.getInt("id"));
            q.setNome(res.getString("nome"));
            q.setPathname(res.getString("pathname"));
            q.setPeriodo_fine(res.getDate("periodo_fine"));
            q.setPeriodo_inizio(res.getDate("periodo_inizio")); 
            q.setListaGenitori((List<Genitore>)res.getObject("lista_genitori"));
           
            l.add(q);
            res.close();
        }   
         return l;
    }
    
    public List<Questionario> visualizzaQuestionariCompilabili() throws SQLException{
       
        List<Questionario> l=null;
        Questionario q=null; 
        
        ResultSet res=tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella()+ "WHERE NOW() BETWEEN periodo_inizio AND periodo_fine");
        
            while(res.next()){
            
            q.setDescrizione(res.getString("descrizione"));
            q.setFlag_rinuncia(res.getString("flag_rinuncia"));
            q.setId(res.getInt("id"));
            q.setNome(res.getString("nome"));
            q.setPathname(res.getString("pathname"));
            q.setPeriodo_fine(res.getDate("periodo_fine"));
            q.setPeriodo_inizio(res.getDate("periodo_inizio"));         
            q.setListaGenitori((List<Genitore>)res.getObject("lista_genitori"));
            l.add(q);
            }
                                              

        return l;
    }
    
    
   
    
}