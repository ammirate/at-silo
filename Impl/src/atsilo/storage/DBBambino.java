package atsilo.storage;

import atsilo.entity.Bambino;
import atsilo.entity.Genitore;

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
        res.put("nome","nome");// la classe Assenza del package entity ha come attributi (data e bambino)????
        res.put("data_di_nascita","dataNascita");
        res.put("Categoria_appartenenza","categoriaAppartenenza");
        res.put("indirizzo","indirizzo");
        res.put("classe","classe");
        res.put("cognome","cognome");
        res.put("genitore","genitore");
        res.put("codice_fiscale","codiceFiscale");
        
        
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
        if(r.next())
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
            
            
        }
        
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
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE codice_fiscale = ?");
            tabella.setParam(stmt, 1, "codiceFiscale", codicefiscale);
            ResultSet r = stmt.executeQuery();
        if(r.next())
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
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE data = ?");
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
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE nome = ?");
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
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE cognome = ?");
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
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE codice_fiscale = ?");
            tabella.setParam(stmt, 1, "codice_fiscale", b.getCodiceFiscale());
            ResultSet r = stmt.executeQuery();
        int c = 0;
        if(r.next())
            c=r.getInt("classe");
        
        r.close();
        return c;
    }
    
   






    
}
