package atsilo.storage;

import atsilo.entity.Bambino;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Assenza;
import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.RispostaQuestionario;

public class DBDomandaIscrizione extends DBBeans<DomandaIscrizione> {
    
    public DBDomandaIscrizione(Database db){
        super("DomandaIscrizione",db);
    }

    
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
        res.put("punteggio","punteggio");
        res.put("posizione","posizione");
        res.put("data_presentazione","dataPresentazione");
        res.put("genitore","genitore");
        res.put("bambino","bambino");
        
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
        protected DomandaIscrizione creaBean(ResultSet r) throws SQLException {
           DomandaIscrizione temp = new DomandaIscrizione();
            temp.setId(r.getInt("id"));
            temp.setPosizione(r.getString("posizione"));
            temp.setPunteggio(r.getInt("punteggio"));
            temp.setDataPresentazione(r.getString("dataPresentazione"));
            temp.setBambino((Bambino)r.getObject("bambino"));
            temp.setGenitore((Genitore)r.getObject("genitore"));
            return temp;
        }
        
       /**
        * ricerca le iscrizioni di un bambino 
        * @param b
        * @return una lista di iscrizioni
        * @throws SQLException
        */
    public List<DomandaIscrizione> ricercaDomandaDaBambino(Bambino b) throws SQLException {
        List<DomandaIscrizione> lista=new ArrayList<DomandaIscrizione>();
        DomandaIscrizione d=new DomandaIscrizione();
        ResultSet res = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella());
        for(DomandaIscrizione t : iteraResultSet(res))
        {
            
            Bambino ba=t.getBambino();
            if(ba.getCodice_Fiscale().equals(b.getCodice_Fiscale()))
            {
                lista.add(t);
            }
            
        }
        res.close();
        return lista;
    }

    /** 
     * Ricerca le iscrizioni di un genitore
     * @param g
     * @return una lista di iscrizioni
     * @throws SQLException 
     */
    public List<DomandaIscrizione> ricercaDomandaDaGenitore(Genitore g) throws SQLException {
        List<DomandaIscrizione> lista=new ArrayList<DomandaIscrizione>();
        DomandaIscrizione d=new DomandaIscrizione();
        ResultSet res = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella());
        for(DomandaIscrizione t : iteraResultSet(res))
        {
            
            Genitore ge=t.getGenitore();
            if(ge.getCodiceFiscale().equals(g.getCodiceFiscale()))
            {
                lista.add(t);
            }
            
        }
        res.close();
        return lista;
    }

/**
 * ricerca per id
 * @param Id
 * @return una domandaIscrizione
 * @throws SQLException
 */
    public DomandaIscrizione ricercaDomandaDaId(int Id) throws SQLException {
        DomandaIscrizione d=new DomandaIscrizione();
        ResultSet res = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella()+"WHERE id=" + Id);
        if(res.next())
        {
            d.setBambino((Bambino)res.getObject("bambino"));
            d.setGenitore((Genitore)res.getObject("genitore"));
            d.setDataPresentazione(res.getString("data_presentazione"));
            d.setId(res.getInt("id"));
            d.setPosizione(res.getString("posizione"));
            d.setPunteggio(res.getInt("punteggio"));
        }
        res.close();
        return d;
    }
    
    /**
     * ricerca una domanda iscrizione per data
     * @param da
     * @return una lista di domande
     * @throws SQLException
     */
    public List<DomandaIscrizione> ricercaDomandaPerData(Date da) throws SQLException{
    List<DomandaIscrizione> lista=new ArrayList<DomandaIscrizione>();
    DomandaIscrizione d=new DomandaIscrizione();
    ResultSet res = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE data=" + da);
    for(DomandaIscrizione t : iteraResultSet(res))
       lista.add(t);
  
    res.close();
    return lista;
    }
    
    /**
     * ricerca una domanda per punteggio
     * @param p
     * @return una lista di domande
     * @throws SQLException 
     */
    public List<DomandaIscrizione> ricercaDomandaPerPunteggio(int p) throws SQLException{
        List<DomandaIscrizione> lista=new ArrayList<DomandaIscrizione>();
        DomandaIscrizione d=new DomandaIscrizione();
        ResultSet res = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE punteggio=" + p);
        for(DomandaIscrizione t : iteraResultSet(res))
           lista.add(t);
      
        res.close();
        return lista;
        }
    
    
    
}
