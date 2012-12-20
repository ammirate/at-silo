package atsilo.storage;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import atsilo.entity.Attivita;
import atsilo.entity.Bambino;
import atsilo.entity.Classe;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.Questionario;
import atsilo.entity.Registro;
/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBRegistro.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, Ferdinando Di Palma17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */
//TODO da implementare priorità bassa
public class DBRegistro extends DBBeans 
{
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    public DBRegistro(Database db){
        
        super("registro",db);
    }
    
    
    
    /**
     * @return
     */
    private static List<String> creaChiave() {
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }
    
    
    
    /**
     * @return
     */
    private static Map<String, String> creaMapping() {
        Map<String,String> res= new HashMap<String,String>();
        res.put("id","id");
        res.put("anno","anno");
        res.put("classe","classe");
        res.put("educatoreDidattico","educatore_didattico");
        res.put("listaAttivita","lista_attività");
        
        
        return Collections.unmodifiableMap(res);
    }
    
    
    
    public boolean assegnaRegistroAClasse(int idRegistro, String IdClasse){
        //chiedere come implementare
        return false;
    }
    
    
    
    
    public Registro ricercaRegistroPerClasse(Classe c) throws SQLException{
        Registro rg=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE classe =" + c.getId());
        if(r.next())
        {
            rg.setId(r.getInt("id"));
            rg.setAnno(r.getDate("anno"));
            rg.setClasse(r.getInt("classe"));
            rg.setEducatoreDidattico((EducatoreDidattico) r.getObject("educatore_didattico"));
            
        }
        r.close();
        return rg;
    }
    
    
    
    
    
    public Registro ricercaRegistroPerAnno(Date d) throws SQLException{
        Registro rg=null;
        ResultSet r = tabella.getDatabase().directQuery("SELECT * FROM " + tabella.getNomeTabella() + "WHERE anno =" + d);
        if(r.next())
        {
            rg.setId(r.getInt("id"));
            rg.setAnno(r.getDate("anno"));
            rg.setClasse(r.getInt("classe"));
            rg.setEducatoreDidattico((EducatoreDidattico) r.getObject("educatore_didattico"));
            
        }
        r.close();
        return rg;
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
    protected Registro creaBean(ResultSet r) throws SQLException {
        Registro rg = null;
        if(r.next()){
            rg.setId(r.getInt("id"));
            rg.setAnno(r.getDate("anno"));
            rg.setClasse(r.getInt("classe"));
            rg.setEducatoreDidattico((EducatoreDidattico) r.getObject("educatore_didattico"));
            //settare lista attività
        }
        return null;
    }   
    
}