package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;

import java.sql.ResultSet;
import java.sql.SQLException;
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
        // TODO Scheletro generato automaticamente
        return null;
    }

        /**
     * @return
     */
    private static Map<String, String> creaMapping() {
        // TODO Scheletro generato automaticamente
        return null;
    }

        public RispostaQuestionario ricercaRispostaQuestionarioPerId(String Id){
            RispostaQuestionario c = null;
            return c;
            }
        
    public RispostaQuestionario ricercaRispostaQuestionarioPerValore(String valore){
        RispostaQuestionario c = null;
        return c;
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
           ris.setQuestionario((Questionario) r.getObject("questionario"));
           
        }
        return ris;
    }
}

    
    
    