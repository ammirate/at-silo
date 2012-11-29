package atsilo.storage;

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
import atsilo.entity.Bambino;

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
 * Ricerca per data
 * @param d
 * @return  lista di assenze di una determinata data: Risultato della query
 * @throws SQLException
 */
    public List<Assenza> ricercaAssenzaPerData(Date d) throws SQLException
    {
        List<Assenza> a=null;
        Assenza temp=null;
        int i=0; //indice per scorrere in list
        ResultSet res = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE data =" + d);
        while(res.next())
        {
            temp.setData(res.getDate("data"));
            
            a.set(i, temp);//assegna l'assenza temporanea alla lista di Assenze
            i++;
        }
        res.close();
        return a;
    }
    
    
    /**
     * Ricerca per cod fiscale del bambino
     * @param codicefiscale
     * @return lista delle assenze di un bambino:risultato query
     * @throws SQLException
     */
    public List<Assenza> ricercaAssenzaPerBambino(String codicefiscale) throws SQLException {
        Assenza temp=null;
        List<Assenza> a=null;
        int i=0;//indice per scorere in list
        ResultSet res = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE codice_fiscale =" + codicefiscale);
        while(res.next())
        {
            temp.setData(res.getDate("data"));
            
            a.add(i, temp);
            i++;
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
        Assenza a=null;
        if(r.next())
        {
            a.setData(r.getDate("data"));
            
        }
        return a;
    } 
    
    
}