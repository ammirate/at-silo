package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;
import atsilo.storage.DBBeans.Assegnazione;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Collections;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBBambino.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, Luigi Lomasto, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBBambino extends DBBeans<Bambino> {    
   
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 

    /**
     * Costruttore 
     * @param db 
     */
    public DBBambino(Database db){super("bambino",db);}

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() { return MAPPINGS; }


    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {return CHIAVE;}
    
    
    /**
     * metodo che asocia alla chiave(nome campo db)
     *  il rispettivo valore(nome attributo classe)
     * @return
     */
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        
        res.put("nome","nome");
        res.put("data_di_nascita","dataNascita");
        res.put("categoria_appartenenza","categoriaAppartenenza");
        res.put("classe","classe");
        res.put("cognome","cognome");
        res.put("genitore","genitore");
        res.put("codice_fiscale","codiceFiscale");
        res.put("comune_nascita", "comuneNascita");
        res.put("cittadinanza", "cittadinanza");
        res.put("indirizzo_residenza", "indirizzoResidenza");
        res.put("numero_civico_residenza", "numeroCivicoResidenza");
        res.put("provincia_residenza", "provinciaResidenza");
        res.put("indirizzo_domicilio", "indirizzoDomicilio");
        res.put("numero_civico_domicilio", "numeroCivicoDomicilio");
        res.put("cap_domicilio", "capDomicilio");
        res.put("cap_residenza", "capResidenza");
        res.put("comune_domicilio", "comuneDomicilio");
        res.put("provincia_domicilio", "provinciaDomicilio");
        res.put("cf_genitore_non_richiedente", "genitoreNonRichiedente");
        
        
        return Collections.unmodifiableMap(res);
    }
    
    
    /**
     * Metodo che crea la chiave
     * @return
     */
    private static List<String> creaChiave(){
        List<String> res=  Arrays.asList("codice_fiscale");
        
        return Collections.unmodifiableList(res);
    }

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Bambino creaBean(ResultSet r) throws SQLException {
        Bambino b=new Bambino();
        
            b.setNome(r.getString("nome"));
            b.setCognome(r.getString("cognome"));
            b.setCodiceFiscale(r.getString("codice_fiscale"));
            b.setDataNascita(r.getDate("data_di_nascita"));
            b.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            b.setClasse(r.getInt("classe"));
            Genitore gen=new Genitore();
           String g=r.getString("genitore");
           gen.setCodiceFiscale(g);
            b.setGenitore(gen);
            Genitore gg=new Genitore();
            String s=r.getString("cf_genitore_non_richiedente");
            gg.setCodiceFiscale(s);
            b.setGenitoreNonRichiedente(gg);
            b.setComuneNascita(r.getString("comune_nascita"));
            b.setCittadinanza(r.getString("cittadinanza"));
            b.setIndirizzoResidenza(r.getString("indirizzo_residenza"));
            b.setIndirizzoDomicilio(r.getString("indirizzo_domicilio"));
            b.setNumeroCivicoResidenza(r.getString("numero_civico_residenza"));
            b.setNumeroCivicoDomicilio(r.getString("numero_civico_domicilio"));
            b.setProvinciaDomicilio(r.getString("provincia_domicilio"));
            b.setProvinciaResidenza(r.getString("provincia_residenza"));
            b.setComuneDomicilio(r.getString("comune_domicilio"));
            b.setCapResidenza(r.getString("cap_residenza"));
            b.setCapDomicilio(r.getString("cap_domicilio"));
            
            
             
        return b;
    }

    
    /**
     * ricerca un bambino per codicefiscale
     * @param codicefiscale da ricercare per trovare il bambino
     * @return restituisce un bambino se è presente il codice fiscale nel database o un oggetto vuoto
     * @throws SQLException nel caso in cui si verificano errori di connessione
     */
    public Bambino ricercaBambinoPerCodFiscale(String codicefiscale) throws SQLException
    {
        Bambino b=new Bambino();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE codice_fiscale = ?");
            tabella.setParam(stmt, 1, "codice_fiscale", codicefiscale);
            ResultSet r = stmt.executeQuery();
        if(r.next())
        {
            
            b.setNome(r.getString("nome"));
            b.setCognome(r.getString("cognome"));
            b.setCodiceFiscale(r.getString("codice_fiscale"));
            b.setDataNascita(r.getDate("data_di_nascita"));
            b.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            b.setClasse(r.getInt("classe"));
            Genitore gen=new Genitore();
           String g=r.getString("genitore");
           gen.setCodiceFiscale(g);
            b.setGenitore(gen);
            Genitore gg=new Genitore();
            String s=r.getString("cf_genitore_non_richiedente");
            gg.setCodiceFiscale(s);
            b.setGenitoreNonRichiedente(gg);
            b.setComuneNascita(r.getString("comune_nascita"));
            b.setCittadinanza(r.getString("cittadinanza"));
            b.setIndirizzoResidenza(r.getString("indirizzo_residenza"));
            b.setIndirizzoDomicilio(r.getString("indirizzo_domicilio"));
            b.setNumeroCivicoResidenza(r.getString("numero_civico_residenza"));
            b.setNumeroCivicoDomicilio(r.getString("numero_civico_domicilio"));
            b.setProvinciaDomicilio(r.getString("provincia_domicilio"));
            b.setProvinciaResidenza(r.getString("provincia_residenza"));
            b.setComuneDomicilio(r.getString("comune_domicilio"));
            b.setCapResidenza(r.getString("cap_residenza"));
            b.setCapDomicilio(r.getString("cap_domicilio"));
            
        }
        else
        {
            b=null;
        }
        r.close();
        return b;
    } 
    
    
    /**
     * ricerca un bambino per data di nascita
     * @param d è la data di nascita da ricercare
     * @return lista di bambini nati il giorno d. La lista può contenere anche un solo bambino o può essere vuota se nel database non ci sono bambinin nati in quel giorno
     *
     * @throws SQLException
     */
    public List<Bambino> ricercaBambinoPerDataNascita(Date d) throws SQLException{
        Bambino b=new Bambino();
        List<Bambino> lb=new ArrayList<Bambino>();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE data = ?");
            tabella.setParam(stmt, 1, "data", d);
            ResultSet r = stmt.executeQuery();
        
        while(r.next())
        {
            b.setNome(r.getString("nome"));
            b.setCognome(r.getString("cognome"));
            b.setCodiceFiscale(r.getString("codice_fiscale"));
            b.setDataNascita(r.getDate("data_nascita"));
            b.setIndirizzoDomicilio(r.getString("indirizzo"));
            b.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            b.setClasse(r.getInt("classe"));
            Genitore gen=new Genitore();
            String g=r.getString("genitore");
            gen.setCodiceFiscale(g);
            b.setGenitore(gen);
            
            lb.add(b);
            
        }
        r.close();
        return lb;
    } 
    
    
    /**
     * ricerca per nome
     * @param nome
     * @return lista di bambini
     * @throws SQLException
     */
    public List<Bambino> ricercaBambinoPerNome(String nome) throws SQLException{
        Bambino b=new Bambino();
        List<Bambino> lb=new ArrayList<Bambino>();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE nome = ?");
            tabella.setParam(stmt, 1, "nome", nome);
            ResultSet r = stmt.executeQuery();        
        while(r.next())
        {
            b.setNome(r.getString("nome"));
            b.setCognome(r.getString("cognome"));
            b.setCodiceFiscale(r.getString("codice_fiscale"));
            b.setDataNascita(r.getDate("data_nascita"));
            b.setIndirizzoDomicilio(r.getString("indirizzo"));
            b.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            b.setClasse(r.getInt("classe"));
            Genitore gen=new Genitore();
            String g=r.getString("genitore");
            gen.setCodiceFiscale(g);
            b.setGenitore(gen);
            
            lb.add(b);
           
        }
        r.close();
        return lb;
    }
    
    
    /**
     * ricerca per cognome
     * @param cognome
     * @return lista di bambini
     * @throws SQLException
     */
    public List<Bambino> ricercaBambinoPerCognome(String cognome) throws SQLException{
        Bambino b=new Bambino();
        List<Bambino> lb=new ArrayList<Bambino>();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE cognome = ?");
            tabella.setParam(stmt, 1, "cognome", cognome);
            ResultSet r = stmt.executeQuery();       
        while(r.next())
        {
            b.setNome(r.getString("nome"));
            b.setCognome(r.getString("cognome"));
            b.setCodiceFiscale(r.getString("codice_fiscale"));
            b.setDataNascita(r.getDate("data_nascita"));
            b.setIndirizzoDomicilio(r.getString("indirizzo"));
            b.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            b.setClasse(r.getInt("classe"));
            Genitore gen=new Genitore();
            String g=r.getString("genitore");
            gen.setCodiceFiscale(g);
            b.setGenitore(gen);
            
            lb.add(b);
            
        }
        r.close();
        return lb;
    }
    
    /**
     * ricerca l'indirizzo di un bambino
     * @param b
     * @return l'indirizzo di un bambino
     * @throws SQLException
     */
    public String ricercaIndirizzoBambino(Bambino b) throws SQLException{
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE codice_fiscale = ?");
            tabella.setParam(stmt, 1, "codice_fiscale", b.getCodiceFiscale());
            ResultSet r = stmt.executeQuery();
        String ind="";
        if(r.next())
            ind=r.getString("indirizzo");
        
        r.close();
        return ind;
    }
    
    /**
     * ricerca classe di un bambino
     * @param b
     * @return una classe
     * @throws SQLException
     */
    public int ricercaClasseBambino(Bambino b) throws SQLException{
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE codice_fiscale = ?");
            tabella.setParam(stmt, 1, "codice_fiscale", b.getCodiceFiscale());
            ResultSet r = stmt.executeQuery();
        int c = 0;
        if(r.next())
            c=r.getInt("classe");
        
        r.close();
        return c;
    }
    /**
     * 
     * @param CFGenitore codice fiscale del genitore di cui ricercare
     * i bambini figli
     * @return lista dei bambini figli del genitore con codice fiscale=CFGenitore
     * @throws SQLException
     */
    public List<Bambino> ricercaFigliGenitore(String CFGenitore) throws SQLException {
        
        List<Bambino>l=new ArrayList<Bambino>();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE genitore = ?");
            tabella.setParam(stmt, 1, "genitore", CFGenitore);
            ResultSet r = stmt.executeQuery();
            
            
            while (r.next()){
            
            Bambino b=new Bambino();
            
            b.setNome(r.getString("nome"));
            b.setCognome(r.getString("cognome"));
            b.setCodiceFiscale(r.getString("codice_fiscale"));
            b.setDataNascita(r.getDate("data_di_nascita"));
            b.setCategoriaAppartenenza(r.getString("categoria_appartenenza"));
            b.setClasse(r.getInt("classe"));
            Genitore gen=new Genitore();
           String g=r.getString("genitore");
           gen.setCodiceFiscale(g);
            b.setGenitore(gen);
            Genitore gg=new Genitore();
            String s=r.getString("genitore_non_richiedente");
            gg.setCodiceFiscale(s);
            b.setGenitoreNonRichiedente(gg);
            b.setComuneNascita(r.getString("comune_nascuta"));
            b.setCittadinanza(r.getString("cittadinanza"));
            b.setIndirizzoResidenza(r.getString("indirizzo_residenza"));
            b.setIndirizzoDomicilio(r.getString("indirizzo_domicilio"));
            b.setNumeroCivicoResidenza(r.getString("numero_civico_residenza"));
            b.setNumeroCivicoDomicilio(r.getString("numero_civico_domicilio"));
            b.setProvinciaDomicilio(r.getString("provincia_domicilio"));
            b.setProvinciaResidenza(r.getString("provincia_residenza"));
            b.setComuneDomicilio(r.getString("comune_domicilio"));
            b.setCapResidenza(r.getString("cap_residenza"));
            b.setCapDomicilio(r.getString("cap_domicilio"));
            
            l.add(b);
            } 
            r.close();
        return l;
        
    }
    
    
    protected Assegnazione[] creaAssegnazioni(Bambino bean) {
       
        Assegnazione DBBambino_assegnazione = new Assegnazione("cf_genitore_non_richiedente",bean.getGenitoreNonRichiedente().getCodiceFiscale());
        Assegnazione DBBambino_assegnazione1 = new Assegnazione("genitore",bean.getGenitore().getCodiceFiscale());
        Assegnazione DBBambino_assegnazione2 = new Assegnazione("classe",bean.getClasse());

        Assegnazione[] DBAssign = new Assegnazione[3];
       
        DBAssign[0]=DBBambino_assegnazione;
        DBAssign[1]=DBBambino_assegnazione1;
        DBAssign[2]=DBBambino_assegnazione2;

        return DBAssign;
    }






    
}
