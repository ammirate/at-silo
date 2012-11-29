package atsilo.storage;

import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.Classe;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.RispostaQuestionario;

import atsilo.entity.Questionario;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBDomandaQuestionario extends DBBeans<DomandaQuestionario> {
    Tabella tabella;
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    
    /**
     * 
     * @return
     */
    private static List<String> creaChiave()
    {
        List<String> res=  Arrays.asList("id");// da chiarire
        
        return Collections.unmodifiableList(res);
    }
    /**
     * 
     * @return
     */
    private static Map<String,String> creaMapping()
    {
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
            temp.setQuestionario((Questionario)r.getObject("questionario"));
            
            return temp;
        }
        
        public List<DomandaQuestionario> getDomandeQuestionario(String idQuestionario) throws SQLException{
            List<DomandaQuestionario> l=null;
            DomandaQuestionario temp = new DomandaQuestionario();
           
            ResultSet res=tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella()+ "WHERE questionario =" + idQuestionario );
            
            while (res.next()){
               
                temp.setId(res.getString("id"));
                temp.setDescrizione(res.getString("descrizione"));
                temp.setQuestionario((Questionario)res.getObject("questionario"));
                
                l.add(temp);
            }
            res.close();
         return l;
        }
        
        public void setDomandeQuestionario(List <DomandaQuestionario> l) {
            int i=l.size();
            while(i>=0)
            inserisci(l.get(i));
        }
}       