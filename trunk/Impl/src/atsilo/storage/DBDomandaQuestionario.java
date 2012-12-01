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
     * Costruttore
     * @param db connessione al db
     */
    public DBDomandaQuestionario(Database db){super("DomandaQuestionario",db);}
   
    /**
     * Metodo che crea la chiave
     * @return lista string
     */
    private static List<String> creaChiave(){
        List<String> res=  Arrays.asList("id");// da chiarire
        
        return Collections.unmodifiableList(res);
    }
   
    /**
     * metodo che associa all' attributo del database (nome attributo db) 
     * il rispettivo valore(nome attributo classe)
     * @return mappa <chiave,valore>
     */
    private static Map<String,String> creaMapping(){
        Map<String,String> res= new HashMap<String,String>();
        res.put("id","id");
        res.put("descrizione","descrizione");
        res.put("questionario","questionario");
       
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

        /*
         * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
         */
        @Override
        
        /*(non-Javadoc)
         * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
         */    
        protected DomandaQuestionario creaBean(ResultSet r) throws SQLException {
           DomandaQuestionario temp = new DomandaQuestionario();
            temp.setId(r.getString("id"));
            temp.setDescrizione(r.getString("descrizione"));
            temp.getQuestionario().setId(r.getInt("questionario"));          
            return temp;
        }
        
        

        /**
         * Data l'id di una domanda viene restituita
         * l' oggetto bean corrispondente
         * @param idDomanda id della domanda da restituire
         * @return domanda questionario con id=idDomanda oppure null
         * @throws SQLException
         */
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

        /**
         * Dato l'id di un questionario vengono restituite le
         * domande che compongono il questionario con id=idQuestionario
         * @param idQuestionario id del questionario di cui restituire le domande
         * @return lista di domandeQuestionario  oppure null
         * @throws SQLException
         */
        public List<DomandaQuestionario> getDomandeQuestionario(int idQuestionario)
                throws SQLException{
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