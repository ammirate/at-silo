package atsilo.storage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Bambino;
import atsilo.entity.Genitore;
import atsilo.entity.OrarioUtente;
import atsilo.entity.Servizio;
/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBOrarioUtente.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 *///TODO da implementare priorità bassa
public class DBOrarioUtente extends DBBeans<OrarioUtente> {
    
    public DBOrarioUtente(Database db){
        super("orario_utente",db);
    }
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 

    public OrarioUtente ricercaOrarioUtenteDaId(int ID) throws SQLException {
        OrarioUtente b=new OrarioUtente();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE id = ?");
            tabella.setParam(stmt, 1, "id", ID);
            ResultSet r = stmt.executeQuery();
        if(r.next())
        {
            
            b.setId(r.getInt("id"));
            b.setOraInizio(r.getString("ora_inizio"));
            b.setOraFine(r.getString("ora_fine"));
            b.setPrezzo(r.getInt("prezzo"));
            b.setDataInizio(r.getString("data_inizio"));
            b.setDataFine(r.getString("data_fine"));
            b.setNome(r.getString("nome"));
            b.setDescrizione(r.getString("descrizione"));

        }
        else
        {
            b=null;
        }
        r.close();
        return b;
    }

    /**
     * metodo che asocia alla chiave(nome campo db)
     *  il rispettivo valore(nome attributo classe)
     * @return
     */
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        res.put("id","id");
        res.put("nome","nome");
        res.put("oraInizio","ora_inizio");
        res.put("oraFine","ora_fine");
        res.put("dataInizio","data_inizio");
        res.put("dataFine","data_fine");
        res.put("descrizione","descrizione");
        res.put("nome", "nome");
        res.put( "prezzo","prezzo"); 
        
        return Collections.unmodifiableMap(res);
    }
    
    
    /**
     * Metodo che crea la chiave
     * @return
     */
    private static List<String> creaChiave(){
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }

    /**
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() {
        // TODO Scheletro generato automaticamente
        return MAPPINGS;
    }

    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {
        // TODO Scheletro generato automaticamente
        return CHIAVE;
    }

    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected OrarioUtente creaBean(ResultSet r) throws SQLException {
        OrarioUtente b=new OrarioUtente();
        b.setId(r.getInt("id"));
        b.setOraInizio(r.getString("ora_inizio"));
        b.setOraFine(r.getString("ora_fine"));
        b.setPrezzo(r.getInt("prezzo"));
        b.setDataInizio(r.getString("data_inizio"));
        b.setDataFine(r.getString("data_fine"));
        b.setNome(r.getString("nome"));
        b.setDescrizione(r.getString("descrizione"));
        
        return b;
    }

}
