package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBRispostaQuestionario extends DBBeans {
    
    /**
     * Crea un gestore per il bean RispostaQuestionario
     * @param nomeTabella nome reale della tabella nel database
     * @param db database con relativa connessione
     */
    
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

    
    protected RispostaQuestionario creaBean(ResultSet r) throws SQLException {
        RispostaQuestionario ris = new RispostaQuestionario();
        if(r.next())
        {
           ris.setId(r.getString("id"));
           ris.setValore(r.getString("valore"));
           ris.getGenitore().setCodiceFiscale(r.getString("genitore"));
           ris.getDomanda().setId(r.getString("domanda"));           
        }
        return ris;
    }
    
    public List <RispostaQuestionario> getRisposteQuestionarioPerGenitore(Genitore g,String idDomanda) throws SQLException{
        List<RispostaQuestionario> l =null;
        RispostaQuestionario r=new RispostaQuestionario();
        

       /* PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE genitore = ?");
            tabella.setParam(stmt, 1, "genitore", g.getCodiceFiscale());
            
            
            ResultSet res = stmt.executeQuery(); inserire anche la condizione sulla domanda...
            poi sostituire questo codice alla riga di codice di sotto
            */
        
        ResultSet res=tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella()+ 
                "WHERE genitore =" + g.getCodiceFiscale() +"AND domanda=" +idDomanda);
       
        while (res.next()){
           
            r.setId(res.getString("id"));
            r.setValore(res.getString("valore"));
            r.getGenitore().setCodiceFiscale(res.getString("genitore"));
            r.getDomanda().setId(res.getString("domanda"));

            l.add(r);
        }
        res.close();
        return l;
    }
    
    
    
public List<RispostaQuestionario> getRisposteDomandaSpecifica(DomandaQuestionario d) throws SQLException{//per una specifica domanda restituisce tutte le risposte date a quella specifica domanda
        
    List<RispostaQuestionario> l=null;
    RispostaQuestionario r=new RispostaQuestionario();
    

    PreparedStatement stmt = tabella.prepareStatement(
            "SELECT * FROM " + tabella.getNomeTabella() + "WHERE domanda = ?");
        tabella.setParam(stmt, 1, "domanda", d.getId());
        ResultSet res = stmt.executeQuery();

    while (res.next()){
        
        r.setId(res.getString("id"));
        r.setValore(res.getString("valore"));
        r.getGenitore().setCodiceFiscale(res.getString("genitore"));
        r.getDomanda().setId(res.getString("domanda"));

        l.add(r);
    }
    res.close();
    return l;
        
    }
}
    

    
    
    