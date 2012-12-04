package atsilo.storage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.Classe;
import atsilo.entity.Bambino;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.RispostaQuestionario;

public class DBClasse extends DBBeans<Classe> 
{
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave();
    
    
    /**
     * Mapping
     * @return
     */
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        res.put("id","id");
        res.put("educatori","educatori");
        res.put("eventi","eventi");
      
        
        return Collections.unmodifiableMap(res);
    }

    /**
     * crea la chiave
     * @return
     */
    private static List<String> creaChiave()
    {
        List<String> res=  Arrays.asList("id");// da chiarire
        
        return Collections.unmodifiableList(res);
    }
    
    /**
     * Costruttore
     * @param db
     */
    public DBClasse(Database db){super("Classe",db);}
    
    
/**
 * Ricerca una classe per il valore dell' id(precisamente indica se la classe esiste o meno perch� la classe � composta solo dall'id
 * @param id � il valore dell'identificatore della classe da ricercare nel database
 * @return una classe contenente l'id ricercato
 * @throws SQLException se si verifica un errore di connessione con il database
 */
    public Classe RicercaClassePerId (String id) throws SQLException{
        
        Classe cla=new Classe();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE id = ?");
            tabella.setParam(stmt, 1, "id", id);
            ResultSet res = stmt.executeQuery();
        if(res.next()){
           cla.setId(res.getString("id"));
           
           // si dovrebbero inserire anche le due liste(educatori ed eventi)
        }
            
        res.close();
        return cla;
    }

    
    
    /**
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map<String, String> getMappingFields() {return MAPPINGS;}

    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List<String> getKeyFields() {return CHIAVE;}

    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Classe creaBean(ResultSet r) throws SQLException {
        Classe c = new Classe();
        
        c.setId(r.getString("domanda_questionario"));
        
        return c;
        
    }
    
    
    
    
}