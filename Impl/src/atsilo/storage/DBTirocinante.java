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
import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Tirocinante;
/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBTirocinante.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Fabio Napoli, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBTirocinante extends DBBeans {
    /**
     * Classe che crea un gestore al bean Tirocinante
     */
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    /**
     * Costruttore con parametri
     * @param db database con relativa connessione
     */
    public DBTirocinante(Database db){
        super("tirocinante",db);
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
        res.put("oreLavoro","ore_lavoro");
        res.put("oreTotali","ore_totali");
        res.put("personaleAsilo","personale_asilo");
        res.put("nome","nome");
        res.put("dataNascita","data_di_nascita");
        res.put("cognome","cognome");
        res.put("codiceFiscale","codice_fiscale");
        res.put("email", "email");
        res.put( "comuneNascita","comune_di_nascita");
        res.put("telefono", "telefono");
        res.put("cittadinanza", "cittadinanza");
        res.put("indirizzoResidenza","indirizzo_residenza" );
        res.put( "numeroCivicoResidenza","numero_civico_residenza");
        res.put("capResidenza","cap_residenza" );
        res.put("comuneResidenza","comune_residenza" );
        res.put("provinciaResidenza","provincia_residenza" );
        res.put( "indirizzoDomicilio","indirizzo_domicilio");
        res.put("numCivicoDomicilio","numero_civico_domicilio");
        res.put( "capDomicilio","cap_domicilio");
        res.put( "comuneDomicilio","comune_domicilio");
        res.put( "provinciaDomicilio","provincia_domicilio");
        res.put("stato", "stato");
        res.put("matricola","matricola");
        res.put("giudizioFinale","giudizio_finale");
        res.put("disponibilita", "disponibilita");
        res.put( "titoloDiStudio","titolo_di_studi");
        res.put( "tutorEsterno","tutor_esterno");


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
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Tirocinante creaBean(ResultSet r) throws SQLException {
        Tirocinante p=new Tirocinante();
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
            p.setOreTotali(r.getInt("ore_totali"));
            p.setOreLavoro(r.getInt("ore_lavoro"));
            p.setPersonaleAsilo(r.getString("personale_asilo"));
            p.setStato(r.getString("stato"));
            p.setMatricola(r.getString("matricola"));
            p.setGiudizioFinale(r.getString("giudizio_finale"));
            p.setDisponibilita(r.getString("disponibilita"));
            p.setTitoloDiStudi(r.getString("titolo_di_studi"));
            p.setTutorEsterno(r.getString("tutor_esterno"));
            
        return p;
    }

    /**
     * Dato un codice fiscale restituisce il Tirocinante corrispondente
     * @param codiceFiscale codice fiscale del Tirocinante ricercato
     * @return Tirocinante o null
     * @throws SQLException 
     */
    public Tirocinante getTirocinantePerCF(String codiceFiscale) 
            throws SQLException {
        
        Tirocinante p = new Tirocinante();
        
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
            p.setOreTotali(r.getInt("ore_totali"));
            p.setOreLavoro(r.getInt("ore_lavoro"));
            p.setPersonaleAsilo(r.getString("personale_asilo"));
            p.setStato(r.getString("stato"));
            p.setMatricola(r.getString("matricola"));
            p.setGiudizioFinale(r.getString("giudizio_finale"));
            p.setDisponibilita(r.getString("disponibilita"));
            p.setTitoloDiStudi(r.getString("titolo_di_studi"));
            p.setTutorEsterno(r.getString("tutor_esterno"));
            
        }
        else
        {
            p=null;
        }
        r.close();
        return p;
    }
    
    
}
