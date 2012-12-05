package atsilo.storage;

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

import atsilo.entity.Assenza;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBAssenza.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, Luigi Lomasto, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBAssenza extends DBBeans<Assenza> {
    Tabella tabella;
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    
    /**
     * Costruttore
     * @param db
     */
    public DBAssenza(Database db){super("Assenza",db);}
    
    
    /**
     * metodo che asocia alla chiave(nome campo db) il rispettivo valore(nome attributo classe)
     * @return
     */
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        res.put("bambino","bambino");// la classe Assenza del package entity ha come attributi (data e bambino)????
        res.put("data","data");
        res.put("bambino","-bambino");
        res.put("data","-data");
        return Collections.unmodifiableMap(res);
    }
    
    
    /**
     * Metodo che crea la chiave
     * @return
     */
    private static List<String> creaChiave()
    {
        List<String> res=  Arrays.asList("-bambino","-data");
        
        return Collections.unmodifiableList(res);
    }
    
    

/**
 * Ricerca un assenza per data
 * @param d è la data da ricercare
 * @return  lista di assenze di una determinata data : Risultato della query. La lista può contenere anche 0 asenze nel caso in cui non siano state fatte assenze in quella data
 * @throws SQLException se si verifica un errore nella connessione con il database
 */
    public List<Assenza> ricercaAssenzaPerData(Date d) throws SQLException
    {
        List<Assenza> a= new ArrayList<Assenza>();
        Assenza temp=new Assenza();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE data = ?");
            tabella.setParam(stmt, 1, "data", d);
            ResultSet res = stmt.executeQuery();  
        while(res.next())
        {
            temp.setData(res.getDate("data"));
            
            a.add(temp);//assegna l'assenza temporanea alla lista di Assenze
           
        }
        res.close();
        return a;
    }
    
    
    /**
     * Ricerca per cod fiscale del bambino
     * @param codicefiscale da ricercare nel database
     * @return lista delle assenze di un bambino, se il bambino ha fatto assenze altrimenti una lista vuota
     * @throws SQLException se si verifica un errore di connessione con il database
     */
    public List<Assenza> ricercaAssenzaPerBambino(String codicefiscale) throws SQLException {
        Assenza temp=new Assenza();
        List<Assenza> a=new ArrayList<Assenza>();
       
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE codice_fiscale = ?");
            tabella.setParam(stmt, 1, "codice_fiscale", codicefiscale);
            ResultSet res = stmt.executeQuery();  
        while(res.next())
        {
            temp.setData(res.getDate("data"));
            
            a.add(temp);
           
        }
        res.close();
        return a;
    }


    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() {return MAPPINGS;}


    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected List getKeyFields() {return CHIAVE;}


    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Assenza creaBean(ResultSet r) throws SQLException {
        Assenza a=new Assenza();
        if(r.next())
          a.setData(r.getDate("data"));
            
        
        return a;
    } 
    
    
}