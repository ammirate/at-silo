package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBRispostaQuestionario extends DBBeans {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    public DBRispostaQuestionario(Database db){ super("RispostaQuestionario",db);}
    
        /**
     * @return
     */
    private static List<String> creaChiave() {
           
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }

        /**
     * @return
     */
    private static Map<String, String> creaMapping() {
        Map<String,String> res= new HashMap<String,String>();
        res.put("id", "id");
        res.put("valore", "valore");
        res.put("domanda", "domanda");
        res.put("genitore", "genitore");
      
        return Collections.unmodifiableMap(res);
    }

  
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
    protected RispostaQuestionario creaBean(ResultSet r) throws SQLException {
        RispostaQuestionario ris = null;
        if(r.next())
        {
           ris.setId(r.getString("id"));
           ris.setValore(r.getString("valore"));
           ris.setGenitore((Genitore) r.getObject("genitore"));
           ris.setDomanda((DomandaQuestionario) r.getObject("domanda"));
           
        }
        return ris;
    }
    
    public List <RispostaQuestionario> getRisposteQuestionarioPerGenitore(Genitore g,String idDomanda) throws SQLException{
        List<RispostaQuestionario> l =null;
        RispostaQuestionario r=null;
        
        ResultSet res=tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella()+ "WHERE genitore =" + g.getCodiceFiscale() +"AND domanda=" +idDomanda);
       
        while (res.next()){
           
            r.setGenitore((Genitore)res.getObject("genitore"));
            r.setId(res.getString("id"));
            r.setValore(res.getString("valore"));
            r.setDomanda((DomandaQuestionario) res.getObject("domanda"));

            l.add(r);
        }
        res.close();
        return l;
    }
    
    public void setRisposteQuestionario(List <RispostaQuestionario> l) {
        int i=l.size();
        while(i>=0)
        inserisci(l.get(i));
    }
}
    

    
    
    