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
import java.sql.Types;
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
    
    /**
     * Costruttore con parametri
     * @param db database con relativa connessione
     */
    public DBRispostaQuestionario(Database db){ super("RispostaQuestionario",db);}
    
    /**
     * Metodo che crea la chiave
     * @return lista string
     */
    private static List<String> creaChiave() {
           
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }

    /**
     * metodo che associa all' attributo del database (nome attributo db) 
     * il rispettivo valore(nome attributo classe)
     * @return mappa <chiave,valore>
     */
    private static Map<String, String> creaMapping() {
        Map<String,String> res= new HashMap<String,String>();
        res.put("id", "id");
        res.put("valore", "valore");
        res.put("domanda", "domanda");
        res.put("genitore", "genitore");
      
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

    /*(-nonJavadoc)
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
    

    /**
     * Restituisce la lista delle risposte data da un
     * determinato genitore ad una determinata domanda di un questionario
     * @param g genitore di cui vogliamo le risposte
     * @param idDomanda id della domanda di cui vogliamo verificare le risposte
     * @return lista di RisposteQuestionario o null
     * @throws SQLException
     */
    public List <RispostaQuestionario> getRisposteQuestionarioPerGenitore(Genitore g,String idDomanda) throws SQLException{
        List<RispostaQuestionario> l =null;
        RispostaQuestionario r=new RispostaQuestionario();
        

        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM " + tabella.getNomeTabella() + 
                " WHERE genitore = ? AND domanda = ?");
        tabella.setParam(stmt, 1,"genitore", g.getCodiceFiscale());
        tabella.setParam(stmt, 2, "domanda", idDomanda);
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
    
    
    /**
     * Restituisce la lista delle risposte date da tutti i genitori
     * ad una specifica domanda di un questionario
     * @param d domandaQuestionario di cui vogliamo le risposte
     * @return lista di RisposteQuestionario o null
     * @throws SQLException
     */    
public List<RispostaQuestionario> getRisposteDomandaSpecifica(DomandaQuestionario d) throws SQLException{        
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
    

    
    
    