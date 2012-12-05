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

import atsilo.entity.Attivita;
import atsilo.entity.ProgrammaEducativoSettimanale;
import atsilo.entity.Registro;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBAttivita.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Fabio Napoli, 17/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class DBAttivita extends DBBeans<Attivita> {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    /**
     * COstruttore
     * @param db
     */
    public DBAttivita(Database db){ super("Attivita",db);}
    
    
     /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() {return MAPPINGS;}



    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {return CHIAVE;}
    



    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Attivita creaBean(ResultSet r) throws SQLException {
        Attivita a=new Attivita();
        if(r.next())
        {
            a.setCategoria(r.getString("categoria"));
            a.setDescrizione(r.getString("descrizione"));
            a.setProgrammaEducativoSettimanale((ProgrammaEducativoSettimanale)r.getObject("Programma_educativo_settimanale"));
            a.setRegistro((Registro)r.getObject("registro"));
            a.setTitolo(r.getString("titolo"));
        }
        
        return a;
    }
    /**
     * metodo creaMapping
     * @return 
     */
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        
        res.put("titolo","titolo");
        res.put("descrizione","descrizione");
        res.put("Programma_educativo_settimanale","progEdSettimanale");
        res.put("categoria","categoria");
        res.put("registro","registro");
        
        return Collections.unmodifiableMap(res);
    }
    
    
    /**
     * Metodo che crea una chiave
     * @return 
     */
    private static List<String> creaChiave()
    {
        List<String> res=  Arrays.asList("titolo");
        
        return Collections.unmodifiableList(res);
    }
    
    
    /**
     * Ricerca un attivita per titolo. 
     * @param titolo, rappresenta il titolo da ricercare
     * @return restituisce un attivita se viene trovata o un oggetto attività vuoto. Restituisce solo un attivita perchè il titolo è univoco.
     * @throws SQLException nel caso in cui si verifica un eccezione nella connesione con la connessione.
     */
    public Attivita ricercaAttivitaPerTitolo(String titolo) throws SQLException
    {
        Attivita temp=new Attivita();
        int reg;
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE titolo = ?");
            tabella.setParam(stmt, 1, "titolo", titolo);
            ResultSet res = stmt.executeQuery();  
        if(res.next())
        {
            
            temp.setCategoria(res.getString("categoria"));
            temp.setDescrizione(res.getString("descrizione"));
            ProgrammaEducativoSettimanale p=new ProgrammaEducativoSettimanale();
            p.setId((res.getInt("Programma_educativo_settimanale")));
            temp.setProgrammaEducativoSettimanale(p);
            reg=res.getInt("registro");
            Registro r= new Registro();
            r.setId(reg);
            temp.setRegistro(r);
        }
        res.close();
        return temp;
    }
    
    
    
    /**
     * ricerca un attività per categoria
     * @param cat è la categoria da ricercare
     * @return restituisce una lista di attivita se nel database esistono più attività con la categoria, o una singola attività situata sempre in una lista, se non esistono attività di quella categoria restituisce una lista vuota
     *  
     * @throws SQLException nel caso in cui si verificano eccezioni nella connessione con il database
     */
   
    public List<Attivita> ricercaAttivitaPerCategoria(String cat) throws SQLException{
         List<Attivita> a=new ArrayList<Attivita>();
         Attivita temp=new Attivita();
        int reg;
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE categoria = ?");
            tabella.setParam(stmt, 1, "categoria", cat);
            ResultSet res = stmt.executeQuery();  
        if(res.next())
        {
            temp.setCategoria(res.getString("categoria"));
            temp.setDescrizione(res.getString("descrizione"));
            ProgrammaEducativoSettimanale p=new ProgrammaEducativoSettimanale();
            p.setId((res.getInt("Programma_educativo_settimanale")));
            temp.setProgrammaEducativoSettimanale(p);
            reg=res.getInt("registro");
            Registro r= new Registro();
            r.setId(reg);
            temp.setRegistro(r);
            
            temp.setTitolo(res.getString("titolo"));
            a.add(temp);
        }
        res.close();
        return a;
       
    }
    
    
    
  
   
    
    
    
    
    
 




    

}