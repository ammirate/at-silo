package atsilo.storage;

import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.Classe;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.RispostaQuestionario;

import atsilo.entity.Questionario;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBDomandaQuestionario extends DBBeans<DomandaQuestionario> {

    /**
     * Crea un gestore per il bean DomandaQuestionario
     * @param nomeTabella nome reale della tabella nel database
     * @param db database con relativa connessione
     */
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    
    /**
     * 
     * @return
     */
    private static List<String> creaChiave(){
        List<String> res=  Arrays.asList("id");// da chiarire
        
        return Collections.unmodifiableList(res);
    }
    /**
     * 
     * @return
     */
    private static Map<String,String> creaMapping(){
        Map<String,String> res= new HashMap<String,String>();
        res.put("id","id");
        res.put("descrizione","descrizione");
        res.put("questionario","questionario");
       
        
        return Collections.unmodifiableMap(res);
    }
    
   
    
    /**
     * 
     * @param db
     */
    public DBDomandaQuestionario(Database db){super("DomandaQuestionario",db);}
    

        /**
         * @see atsilo.storage.DBBeans#getMappingFields()
         */
        @Override
        protected Map getMappingFields() {
           return MAPPINGS;
        }


        /**
         * @see atsilo.storage.DBBeans#getKeyFields()
         */
        @Override
        protected List getKeyFields() {
           return CHIAVE;
        }


        /**
         * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
         */
        @Override
        protected DomandaQuestionario creaBean(ResultSet r) throws SQLException {
           DomandaQuestionario temp = new DomandaQuestionario();
            temp.setId(r.getString("id"));
            temp.setDescrizione(r.getString("descrizione"));
            temp.getQuestionario().setId(r.getInt("questionario"));          
            return temp;
        }
        
        public DomandaQuestionario getDomanda(String idDomanda) throws SQLException{
            
            DomandaQuestionario q=new DomandaQuestionario();
            
            PreparedStatement stmt = tabella.prepareStatement(
                    "SELECT * FROM " + tabella.getNomeTabella() + "WHERE id = ?");
                tabella.setParam(stmt, 1, "id", idDomanda);
                ResultSet res = stmt.executeQuery();
                
                if(res.next()){
                    q.setId(res.getString("id"));
                    q.setDescrizione(res.getString("descrizione"));
                    q.getQuestionario().setId(res.getInt("questionario"));    
                    q.getRisposta().setId(res.getString("risposta"));
                }
            res.close();
                return q;

        }
        
        public List<DomandaQuestionario> getDomandeQuestionario(int idQuestionario) throws SQLException{
            List<DomandaQuestionario> l=new ArrayList<DomandaQuestionario>();
            DomandaQuestionario temp = new DomandaQuestionario();
           
            PreparedStatement stmt = tabella.prepareStatement(
                    "SELECT * FROM " + tabella.getNomeTabella() + "WHERE questionario = ?");
                tabella.setParam(stmt, 1, "questionario", idQuestionario);
                ResultSet res = stmt.executeQuery();
                        
            while (res.next()){
               
                temp.setId(res.getString("id"));
                temp.setDescrizione(res.getString("descrizione"));
                temp.getQuestionario().setId(res.getInt("questionario"));
                temp.getRisposta().setId(res.getString("risposta"));
                
                l.add(temp);
            }
            res.close();
         return l;
        }
        
       
}       