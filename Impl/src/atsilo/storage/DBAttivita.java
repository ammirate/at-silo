package atsilo.storage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Attivita;
import atsilo.entity.ProgrammaEducativoSettimanale;
import atsilo.entity.Registro;

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
        Attivita a=null;
        if(r.next())
        {
            a.setCategoria(r.getString("categoria"));
            a.setDescrizione(r.getString("descrizione"));
            a.setProgramma_educativo_settimanale((ProgrammaEducativoSettimanale)r.getObject("Programma_educativo_settimanale"));
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
     * Ricerca per titolo
     * @param titolo
     * @return restituisce un attivita
     * @throws SQLException
     */
    public Attivita ricercaAttivitaPerTitolo(String titolo) throws SQLException
    {
        Attivita a=null;
        
        ResultSet res= tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE titolo =" + titolo);//restituisce un solo valore perchè titolo è chiave primaria
        if(res.next())
        {
            a.setCategoria(res.getString("categoria"));
            a.setDescrizione(res.getString("descrizione"));
            a.setProgramma_educativo_settimanale((ProgrammaEducativoSettimanale)res.getObject("Programma_educativo_settimanale"));
            a.setRegistro((Registro)res.getObject("registro"));
            a.setTitolo(res.getString("titolo"));
        }
        res.close();
        return a;
    }
    
    
    
    /**
     * ricerca per categoria
     * @param cat
     * @returnrestituisce una lista di attivita della stessa categoria
     * @throws SQLException
     */
    public List<Attivita> ricercaAttivitaPerCategoria(String cat) throws SQLException{
         List<Attivita> a=null;
         Attivita temp=null;
         int i=0;
        ResultSet res= tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE categoria =" + cat);//restituisce un solo valore perchè titolo è chiave primaria
        if(res.next())
        {
            temp.setCategoria(res.getString("categoria"));
            temp.setDescrizione(res.getString("descrizione"));
            temp.setProgramma_educativo_settimanale((ProgrammaEducativoSettimanale)res.getObject("Programma_educativo_settimanale"));
            temp.setRegistro((Registro)res.getObject("registro"));
            temp.setTitolo(res.getString("titolo"));
            a.add(i,temp);
            i++;
        }
        res.close();
        return a;
       
    }
    
    
    
  
   
    
    
    
    
    
 




    

}