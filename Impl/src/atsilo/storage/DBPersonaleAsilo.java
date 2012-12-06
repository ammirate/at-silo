package atsilo.storage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Bambino;
import atsilo.entity.Genitore;
import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Utente;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBPersonaleAsilo.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Antonio Cesarano, Ferdinando Di Palma, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBPersonaleAsilo extends DBBeans {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    public DBPersonaleAsilo(Database db)
    {
        super("PersonaleAsilo",db);
    }

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
        res.put("categoria_appartenenza", "categoriaAppartenenza");
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

    public PersonaleAsilo CercaPerCategoria(String categoria) throws SQLException 
        {
        PersonaleAsilo p=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE categoria_appartenenza =" + categoria);
        if(r.next())
        {
            p.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            p.setNome(r.getString("nome"));
            p.setCognome(r.getString("cognome"));
            p.setCodiceFiscale(r.getString("codice_fiscale"));
            p.setDataNascita(r.getDate("data_nascita"));
            p.setResidenza(r.getString("residenza"));
            p.setEmail(r.getString("email"));
            p.setComuneNascita(r.getString("comune_nascita"));
            p.setTelefono(r.getString("telefono")); 
        }
        r.close();
        return p;
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
    protected PersonaleAsilo creaBean(ResultSet r) throws SQLException {
        PersonaleAsilo p=null;
        if(r.next())
        {
            p.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            p.setNome(r.getString("nome"));
            p.setCognome(r.getString("cognome"));
            p.setCodiceFiscale(r.getString("codice_fiscale"));
            p.setDataNascita(r.getDate("data_nascita"));
            p.setResidenza(r.getString("residenza"));
            p.setEmail(r.getString("email"));
            p.setComuneNascita(r.getString("comune_nascita"));
            p.setTelefono(r.getString("telefono"));   
        }
        return p;
    }

    /**
     * Mi serve questo metodo per il controlLogin by Parisi
     * @param codiceFiscale
     * @return
     */
    public Object ricercaPersonaleAsiloPerCF(String codiceFiscale) {
        // TODO Scheletro generato automaticamente
        return null;
    }

   
}