package atsilo.storage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Bambino;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Genitore;
import atsilo.entity.Utente;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBEducatoreDidattico.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, Luigi Lomasto, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBEducatoreDidattico extends DBBeans<EducatoreDidattico> {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    
    /**
     * Costruttore
     * @param db
     */
    public DBEducatoreDidattico(Database db){ super("EducatoreDidattico",db);}


    /**
     * @return
     */
    private static List<String> creaChiave() {
        List<String> res=  Arrays.asList("codice_fiscale");
        return Collections.unmodifiableList(res);
    }


    /**
     * @return
     */
    private static Map<String, String> creaMapping() {
        Map<String,String> res= new HashMap<String,String>();
        //
        res.put("titolo_di_studio", "TitoloDiStudio");
        res.put("nome","nome");
        res.put("data_di_nascita","dataNascita");
        res.put("cognome","cognome");
        res.put("codice_fiscale","codiceFiscale");
        res.put("email", "email");
        res.put("comune_nascita", "comuneNascita");
        res.put("telefono", "telefono");
        res.put("residenza", "residenza");
        return res;
    }

/**
 * ricerca educatore didattico per titolo di studi
 * @param titoloS è il titolo di studi da ricercare, se è una stringa vuota la ricerca non porta nessun risultato, se è null si verifica un NULLPOINTEREXCEPTION
 * @return una lista di educatori didattici aventi un determinato titolo di studi oppure una lista vuota
 * @throws SQLException se ci sono errori di connessione con il database
 */
    public List<EducatoreDidattico> ricercaEducatoreDidatticoPerTitoloStudio(String titoloS) throws SQLException{
        List<EducatoreDidattico> e=new ArrayList<EducatoreDidattico>();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE titolo_di_studi = ?");
            tabella.setParam(stmt, 1, "titolo_di_studi", titoloS);
            ResultSet res= stmt.executeQuery();
        for(EducatoreDidattico ed:iteraResultSet(res))
           e.add(ed);
            
           res.close();
        return e;
    }
    
    
    
    /**
     * ricerca educatore didattico per codicefiscale 
     * @param cf è il codice fiscale da ricercare se è una stringa vuota la ricerca non porta nessun risultato, se è null si verifica un NULLPOINTEREXCEPTION
     * @return un educatore didattico se il cf è stato trovato nel database oppure un oggetto vuoto
     * @throws SQLException se si verifica un errore di connessione con il database
     */
    public EducatoreDidattico ricercaEducatoreDidatticoPerCf(String cf) throws SQLException{
        EducatoreDidattico e=new EducatoreDidattico();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE codice_fiscale = ?");
            tabella.setParam(stmt, 1, "codice_fiscale", cf);
            ResultSet r= stmt.executeQuery();
        if(r.next())
        {
            //settare lista classi
            e.setTitoloDiStudio(r.getString("titolo_di_studio"));
            e.setNome(r.getString("nome"));
            e.setCognome(r.getString("cognome"));
            e.setCodiceFiscale(r.getString("codice_fiscale"));
            e.setDataNascita(r.getDate("data_nascita"));
            e.setResidenza(r.getString("residenza"));
            e.setEmail(r.getString("email"));
            e.setComuneNascita(r.getString("comune_nascita"));
            e.setTelefono(r.getString("telefono")); 
        }
        r.close();
        return e;
     
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
    protected EducatoreDidattico creaBean(ResultSet r) throws SQLException {
        EducatoreDidattico e=new EducatoreDidattico();
        if(r.next())
        {
            //settare lista classi
            e.setTitoloDiStudio(r.getString("titolo_di_studio"));
            e.setNome(r.getString("nome"));
            e.setCognome(r.getString("cognome"));
            e.setCodiceFiscale(r.getString("codice_fiscale"));
            e.setDataNascita(r.getDate("data_nascita"));
            e.setResidenza(r.getString("residenza"));
            e.setEmail(r.getString("email"));
            e.setComuneNascita(r.getString("comune_nascita"));
            e.setTelefono(r.getString("telefono"));   
        }
        return e;
    }
    
   
    
}