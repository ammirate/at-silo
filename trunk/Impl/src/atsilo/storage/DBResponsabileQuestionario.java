package atsilo.storage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.PersonaleAsilo;
import atsilo.entity.ResponsabileQuestionario;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBResponsabileQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBResponsabileQuestionario extends DBBeans {
    
    
    /**
     * Crea un gestore per il bean ResponsabileQuestionario
     */
   
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    /**
     * Costruttore con parametri
     * @param db database con relativa connessione
     */ 
    public DBResponsabileQuestionario(Database db){
        super("responsabile_questionario",db);
    }
    

    /**
     * Metodo che crea la chiave della tabella
     * @return Collection.unmodiableList
     */
    private static List<String> creaChiave() {
        List<String> res=  Arrays.asList("codice_fiscale");
        return Collections.unmodifiableList(res);
    }

    /**
     * metodo che associa all' attributo del database (nome attributo db) 
     * il rispettivo valore(nome attributo classe)
     * @return mappa <chiave,valore>
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
        res.put("cittadinanza", "cittadinanza");
        res.put("indirizzo_residenza", "indirizzoResidenza");
        res.put("numero_civico_residenza", "numeroCivicoResidenza");
        res.put("cap_residenza", "capResidenza");
        res.put("comune_residenza", "comuneResidenza");
        res.put("provincia_residenza", "provinciaResidenza");
        res.put("indirizzo_domicilio", "indirizzoDomicilio");
        res.put("numero_civico_domicilio", "numCivicoDomicilio");
        res.put("cap_domicilio", "capDomicilio");
        res.put("comune_domicilio", "comuneDomicilio");
        res.put("provincia_domicilio", "provinciaDomicilio");
        
        return res;
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
     *@see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     *@throws SQLException
     *@return ResponsabileQuestionario
     */
    protected ResponsabileQuestionario creaBean(ResultSet r) throws SQLException {
        ResponsabileQuestionario p=new ResponsabileQuestionario();
        {
            p.setDataNascita(r.getDate("data_di_nascita"));
            p.setNome(r.getString("nome"));
            p.setCognome(r.getString("cognome"));
            p.setCodiceFiscale(r.getString("codice_fiscale"));
            p.setEmail(r.getString("email"));
            p.setComuneNascita(r.getString("comune_di_nascita"));
            p.setTelefono(r.getString("telefono"));
            p.setCittadinanza(r.getString("cittadinanza"));
            p.setIndirizzoResidenza(r.getString("indirizzo_residenza"));
            p.setNumeroCivicoResidenza(r.getString("numero_civico_residenza"));
            p.setCapResidenza(r.getString("cap_residenza"));
            p.setComuneResidenza(r.getString("comune_residenza"));
            p.setProvinciaResidenza(r.getString("provincia_residenza"));
            p.setIndirizzoDomicilio(r.getString("indirizzo_domicilio"));
            p.setNumeroCivicoDomicilio(r.getString("numero_civico_domicilio"));
            p.setCapDomicilio(r.getString("cap_domicilio"));
            p.setComuneDomicilio(r.getString("comune_domicilio"));
            p.setProvinciaDomicilio(r.getString("provincia_domicilio"));
            
        }
        return p;
    }
    


    /**
     * Dato un codice fiscale restituisce il ResponsabileQuestionario corrispondente
     * @param codiceFiscale codice fiscale del ResponsabileQuestionario
     * @return ResponsabileQuestionario o null
     * @throws SQLException 
     */
    public ResponsabileQuestionario getResponsabileQuestionarioPerCF(String codiceFiscale) 
            throws SQLException {
        ResponsabileQuestionario p = new ResponsabileQuestionario();
        PreparedStatement stmt = tabella.prepareStatement("SELECT * FROM "
                + tabella.getNomeTabella() + " WHERE codice_fiscale= ?");
        tabella.setParam(stmt, 1, "codice_fiscale", codiceFiscale);
        ResultSet r = stmt.executeQuery();
        
        if(r.next()){
            p.setDataNascita(r.getDate("data_di_nascita"));
            p.setNome(r.getString("nome"));
            p.setCognome(r.getString("cognome"));
            p.setCodiceFiscale(r.getString("codice_fiscale"));
            p.setEmail(r.getString("email"));
            p.setComuneNascita(r.getString("comune_di_nascita"));
            p.setTelefono(r.getString("telefono"));
            p.setCittadinanza(r.getString("cittadinanza"));
            p.setIndirizzoResidenza(r.getString("indirizzo_residenza"));
            p.setNumeroCivicoResidenza(r.getString("numero_civico_residenza"));
            p.setCapResidenza(r.getString("cap_residenza"));
            p.setComuneResidenza(r.getString("comune_residenza"));
            p.setProvinciaResidenza(r.getString("provincia_residenza"));
            p.setIndirizzoDomicilio(r.getString("indirizzo_domicilio"));
            p.setNumeroCivicoDomicilio(r.getString("numero_civico_domicilio"));
            p.setCapDomicilio(r.getString("cap_domicilio"));
            p.setComuneDomicilio(r.getString("comune_domicilio"));
            p.setProvinciaDomicilio(r.getString("provincia_domicilio"));   
        }
        else
        {
            p=null;
        }
        r.close();
        return p;
    }
    
}