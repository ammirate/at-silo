package atsilo.storage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Assenza;
import atsilo.entity.CampoDomandaQuestionario;

public class DBCampoDomandaQuestionario extends DBBeans {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    
    /**
     * Costruttore
     * @param db
     */
    public DBCampoDomandaQuestionario(Database db){ super("CampoDomandaQuestionario",db);}
    
    /**
     * Ricerca campodomandaquestionario per tipo
     * @param tipo
     * @return restituisce una lista di campodomandauestionario
     */
    public List<CampoDomandaQuestionario> ricercaPerTipo(String tipo)
    {
        CampoDomandaQuestionario temp=null;
        List<CampoDomandaQuestionario> a=null;
        int i=0;//indice per scorrere in list
        ResultSet res = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "tipo =" + tipo);
        while(res.next())
        {
            temp.setDomandaQuestionario(res.getString("domanda_questionario"));
            temp.setRispostaQuestionario(res.getString("Risposta_questionario"));
            temp.setTipo(res.getString("tipo"));
            temp.setDescrizione(res.getString("descrizione"));
            temp.setValore(res.getString("valore"));
            
            a.add(i, temp);
            i++;
        }
        res.close();
        return a;
    } 
    
    /**
     * cerca le domande questionario alle quali il campo appartiene
     * @param c
     * @return lista di stringhe
     */
    public List<String> ricercaDomandaQuestionarioAppartenenza(CampoDomandaQuestionario c)
    {
        String temp=null;
        List<String> a=null;
        int i=0;//indice per scorrere in list
        ResultSet res = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "domanda_questionario =" + c.getDomandaQuestionario());
        while(res.next())
        {
           temp=c.getDomandaQuestionario();
            a.add(i, temp);
            i++;
        }
        res.close();
        return a;
    }
    /**
     * cerca le risposte questionario alle quali il campo appartiene
     * @param c
     * @returnlista di stringhe
     */
    public List<String> ricercaRispostaQuestionarioAppartenenza(CampoDomandaQuestionario c){
        String temp=null;
        List<String> a=null;
        int i=0;//indice per scorrere in list
        ResultSet res = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "risposta_questionario =" + c.getRispostaQuestionario());
        while(res.next())
        {
           temp=c.getRispostaQuestionario();
            a.add(i, temp);
            i++;
        }
        res.close();
        return a;
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

    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        res.put("domanda_questionario","domandaQuestionario");
        res.put("tipo","tipo");
        res.put("descrizione","descrizione");
        res.put("valore","valore");
        res.put("risposta_questionario","rispodstaQuestionario");
        
        return Collections.unmodifiableMap(res);
    }

    
    private static List<String> creaChiave()
    {
        List<String> res=  Arrays.asList("domanda_questionario","risposta_questionario");
        
        return Collections.unmodifiableList(res);
    }
    
    
    
    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Object creaBean(ResultSet r) throws SQLException {
        // TODO Scheletro generato automaticamente
        return null;
    }

}