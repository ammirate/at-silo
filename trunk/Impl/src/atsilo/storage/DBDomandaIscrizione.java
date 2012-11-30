package atsilo.storage;

import atsilo.entity.Bambino;

import java.sql.PreparedStatement;
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
            Bambino b=new Bambino();
            Genitore g=new Genitore();
            String ge=r.getString("genitore");
            String ba=r.getString("bambino");
           DomandaIscrizione temp = new DomandaIscrizione();
            temp.setId(r.getInt("id"));
            temp.setPosizione(r.getString("posizione"));
            temp.setPunteggio(r.getInt("punteggio"));
            temp.setDataPresentazione(r.getString("dataPresentazione"));
            temp.setBambino(b);
            temp.setGenitore(g);
            return temp;
        }
        
       /**
        * ricerca le iscrizioni di un bambino 
        * @param b è il bambino per il quale vengono cercate le domande d'iscrizione, se è null si verifica un NULLPOINTEREXCEPTION
        * @return una lista di iscrizioni appartenenti al bambino richiesto oppure una lista di iscrizioni vuota se il bambino non ha fatto domanda d'iscrizione
        * @throws SQLException se si verifica un errore di connessione con il database
        */
        
    public List<DomandaIscrizione> ricercaDomandaDaBambino(Bambino b) throws SQLException {
        List<DomandaIscrizione> lista=new ArrayList<DomandaIscrizione>();
        DomandaIscrizione d=new DomandaIscrizione();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE codice_fiscale = ?");
            tabella.setParam(stmt, 1, "codice_fiscale", b.getCodice_Fiscale());
            ResultSet res = stmt.executeQuery();
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
     * ricerca le iscrizioni di un genitore
     * @param g è il genitore per il quale vengono cercate le domande d'iscrizione, se è null si verifica un NULLPOINTEREXCEPTION
     * @return una lista di iscrizioni appartenenti al genitore richiesto oppure una lista di iscrizioni vuota se il genitore non ha fatto domanda d'iscrizione
     * @throws SQLException se si verifica un errore di connessione con il database
     */
    public List<DomandaIscrizione> ricercaDomandaDaGenitore(Genitore g) throws SQLException {
        List<DomandaIscrizione> lista=new ArrayList<DomandaIscrizione>();
        DomandaIscrizione d=new DomandaIscrizione();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE codice_fiscale = ?");
            tabella.setParam(stmt, 1, "codice_fiscale", g.getCodiceFiscale());
            ResultSet res = stmt.executeQuery();
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
 * ricerca una domanda d'iscrizione per id 
 * @param id è il valore dell'identificativo da ricercare, può avere un qualsiasi valore appartenente all'intervallo degli interi int.
 * @return una domandaIscrizione che ha l'id ricercato oppure un oggetto vuoto se la domanda non esiste
 * @throws SQLException se si verifica un errore di connessione con il database.
 */
    public DomandaIscrizione ricercaDomandaDaId(int id) throws SQLException {
        DomandaIscrizione d=new DomandaIscrizione();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE id = ?");
            tabella.setParam(stmt, 1, "id", id);
            ResultSet res= stmt.executeQuery();
            Bambino b=new Bambino();
            Genitore g=new Genitore();
            
        if(res.next())
        {
            String ge=res.getString("genitore");
            String ba=res.getString("bambino");
            d.setBambino(b);
            d.setGenitore(g);
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
     * @param da la data da ricercare nel database per trovare le domande d'iscrizione. deve avere un valore definito e non successivo alla data nella quale si effettua la richiesta, altrimenti la ricerca non ha risultato
     * @return una lista di domande aventi la stessa data oppure una lista vuota se la ricerca non produce risultato
     * @throws SQLException se c'è errore di connessione con il database
     */
    public List<DomandaIscrizione> ricercaDomandaPerData(Date da) throws SQLException{
    List<DomandaIscrizione> lista=new ArrayList<DomandaIscrizione>();
    DomandaIscrizione d=new DomandaIscrizione();
    PreparedStatement stmt = tabella.prepareStatement(
            "SELECT * FROM " + tabella.getNomeTabella() + "WHERE data = ?");
        tabella.setParam(stmt, 1, "data", da);
        ResultSet res= stmt.executeQuery();
    for(DomandaIscrizione t : iteraResultSet(res))
       lista.add(t);
  
    res.close();
    return lista;
    }
    
    /**
     * ricerca una domanda iscrizione per punteggio
     * @param p il punteggio da ricercare nel database per trovare le domande d'iscrizione. deve avere un valore maggiore o uguale a 0 ovviamente perchè non esiste un punteggio negativo(la ricerca avviene ugualmente ma non produce risultati.)
     * @return una lista di domande aventi lo stesso punteggio  oppure una lista vuota se la ricerca non produce risultato
     * @throws SQLException se c'è errore di connessione con il database
     */
    public List<DomandaIscrizione> ricercaDomandaPerPunteggio(int p) throws SQLException{
        List<DomandaIscrizione> lista=new ArrayList<DomandaIscrizione>();
        DomandaIscrizione d=new DomandaIscrizione();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE punteggio = ?");
            tabella.setParam(stmt, 1, "punteggio", p);
            ResultSet res= stmt.executeQuery();
        for(DomandaIscrizione t : iteraResultSet(res))
           lista.add(t);
      
        res.close();
        return lista;
        }
    
    
    
}
