/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBEvento.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Fabio Napoli, 01/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.storage;

import atsilo.entity.EducatoreDidattico;
import atsilo.entity.EventPlanner;
import atsilo.entity.Evento;
import atsilo.entity.Genitore;
import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.ResponsabileQuestionario;
import atsilo.entity.Tirocinante;
import atsilo.entity.Utente;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class DBEvento extends DBBeans <Evento> {
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    /**
     * Costruttore
     * @param db db associato
     */
    public DBEvento(Database db){
        super("evento",db);
    }
    
    
    /**
     * Metodo che crea la chiave
     * @return lista string
     */
    private static List<String> creaChiave() {
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    protected Map<String,String> getMappingFields(){return MAPPINGS;}
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    
    protected List<String> getKeyFields() {return CHIAVE;}
    
    /*(non-Javadoc)
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */    
    
    private static Map<String,String> creaMapping(){
        Map<String,String> res= new HashMap<String,String>();
        res.put("descrizione","descrizione");
        res.put("nome","nome");
        res.put("data","data");
        res.put("path","path");
        res.put("tipo","tipo");
        res.put("CC","cc");
        res.put("id","id");

        return Collections.unmodifiableMap(res);
    }
    
    
    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Evento creaBean(ResultSet r) throws SQLException {
        Evento a = new Evento();
        a.setCC(r.getString("cc"));
        a.setData(r.getDate("data"));
        a.setDescrizione(r.getString("descrizione"));
        a.setNome(r.getString("nome"));
        a.setPath(r.getString("path"));
        a.setTipo(r.getString("tipo"));
        a.setId(r.getInt("id"));
        
        //controlla da qua

        EventPlanner u=null;
        
        
        if(r.getString("psico_pedagogo")!=null){
            u=new Psicopedagogo();
            ((Psicopedagogo) u).setCodiceFiscale(r.getString("psico_pedagogo"));
        }
        
        if(r.getString("personale_asilo")!=null){
            u=new PersonaleAsilo();
            ((PersonaleAsilo) u).setCodiceFiscale(r.getString("personale_asilo"));
        }
        if(r.getString("educatore_didattico")!=null){
            u=new EducatoreDidattico();
            ((EducatoreDidattico) u).setCodiceFiscale(r.getString("educatore_didattico"));
        }
        a.setOrganizzatore(u);
        //a qua

        return a;
        
    }
  //nomi serve questo metodo ma mi serve il metodo che  {GIANFRANCO}
    /**
     * Dato un evento restituisce il suo organizzatore
     * @param e id dell'evento di cui ricercare l eventPlanner
     * @return Utente o null
     * @throws SQLException Potrebbe lanciarla nell'esecuzione della query
     */
    public Utente ricercaEventPlannerEvento(int e) throws SQLException{
        Utente u = new Utente();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE id = ? ");
        tabella.setParam(stmt, 1, "id", e);
        
        ResultSet r = stmt.executeQuery();
        
        if(r.next()){
            if(r.getString("psico_pedagogo")!=null){
                u=new Psicopedagogo();
                u.setCodiceFiscale(r.getString("psico_pedagogo"));
            }
            
            if(r.getString("personale_asilo")!=null){
                u=new PersonaleAsilo();
                u.setCodiceFiscale(r.getString("personale_asilo"));
            }
            if(r.getString("educatore_didattico")!=null){
                u=new EducatoreDidattico();
                u.setCodiceFiscale(r.getString("educatore_didattico"));
            }   
        }else{
            r.close();
            return null;
        }
        r.close();
        return u;
    }
    /**
     * Dato l'id di un evento restituisce un evento
     * @param id id dell'evento
     * @return Evento o null
     * @throws SQLException Potrebbe verificarsi nell'esecuzione della query
     */
    public Evento ricercaEventoPerChiave(int id) throws SQLException{
        Evento a = new Evento();
        
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE id = ? ");
        tabella.setParam(stmt, 1, "id", id);
        
        
        ResultSet r = stmt.executeQuery();
        
        if(r.next()){
            a.setCC(r.getString("cc"));
            a.setData(r.getDate("data"));
            a.setDescrizione(r.getString("descrizione"));
            a.setNome(r.getString("nome"));
            a.setPath(r.getString("path"));
            a.setTipo(r.getString("tipo"));
            a.setId(r.getInt("id"));
            
            //controlla da qua
            EventPlanner u=null;
            
            
            if(r.getString("psico_pedagogo")!=null){
                u=new Psicopedagogo();
                ((Psicopedagogo) u).setCodiceFiscale(r.getString("psico_pedagogo"));
            }
            
            if(r.getString("personale_asilo")!=null){
                u=new PersonaleAsilo();
                ((PersonaleAsilo) u).setCodiceFiscale(r.getString("personale_asilo"));
            }
            if(r.getString("educatore_didattico")!=null){
                u=new EducatoreDidattico();
                ((EducatoreDidattico) u).setCodiceFiscale(r.getString("educatore_didattico"));
            }
            a.setOrganizzatore(u);          
            //a qua
            
        }else{
            r.close();
            return null;
        }
        r.close();
        return a;
    }
    
    /**
     * Restituisce tutti gli eventi presenti nel Database
     * @return lista di eventi o null
     * @throws SQLException Potrebbe essere lanciata durante l'esecuzione
     * della query
     */
    public List<Evento> ricercaAllEventi() throws SQLException{
        
        List<Evento> l = new ArrayList<Evento>();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella());
        
        
        ResultSet r = stmt.executeQuery();
        
        while(r.next()){
            Evento a = new Evento();
            
            a.setCC(r.getString("cc"));
            a.setData(r.getDate("data"));
            a.setDescrizione(r.getString("descrizione"));
            a.setNome(r.getString("nome"));
            a.setPath(r.getString("path"));
            a.setTipo(r.getString("tipo"));
            a.setId(r.getInt("id"));
            
            
            //controlla da qua
            EventPlanner u=null;
                        
            
            if(r.getString("psico_pedagogo")!=null){
                u=new Psicopedagogo();
                ((Psicopedagogo) u).setCodiceFiscale(r.getString("psico_pedagogo"));
            }
            
            if(r.getString("personale_asilo")!=null){
                u=new PersonaleAsilo();
                ((PersonaleAsilo) u).setCodiceFiscale(r.getString("personale_asilo"));
            }
            if(r.getString("educatore_didattico")!=null){
                u=new EducatoreDidattico();
                ((EducatoreDidattico) u).setCodiceFiscale(r.getString("educatore_didattico"));
            }
            a.setOrganizzatore(u);          
            l.add(a);
            // a qua
        }
        if(l.size()==0){
            r.close();
            return l;
        }else{
            
            r.close();
            return l;
        }
        
        
    }


    //TODO gianfranco fammi sto metodo
    public List<Evento> getEventiPerOrganizzatore(String organizzatore) throws SQLException {
        List<Evento> l = new ArrayList<Evento>();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE psico_pedagogo = ? OR personale_asilo = ? " +
                		"OR educatore_didattico = ?  ");
        
        tabella.setParam(stmt, 1, "psico_pedagogo",organizzatore);
        tabella.setParam(stmt, 2, "personale_asilo", organizzatore);
        tabella.setParam(stmt, 3, "educatore_didattico", organizzatore);

        
        ResultSet r = stmt.executeQuery();
        
        while(r.next()){
            Evento a = new Evento();
            
            a.setCC(r.getString("cc"));
            a.setData(r.getDate("data"));
            a.setDescrizione(r.getString("descrizione"));
            a.setNome(r.getString("nome"));
            a.setPath(r.getString("path"));
            a.setTipo(r.getString("tipo"));
            a.setId(r.getInt("id"));
            
            
            //controlla da qua
            EventPlanner u=null;
            
            
            if(r.getString("psico_pedagogo")!=null){
                u=new Psicopedagogo();
                ((Psicopedagogo) u).setCodiceFiscale(r.getString("psico_pedagogo"));
            }
            
            if(r.getString("personale_asilo")!=null){
                u=new PersonaleAsilo();
                ((PersonaleAsilo) u).setCodiceFiscale(r.getString("personale_asilo"));
            }
            if(r.getString("educatore_didattico")!=null){
                u=new EducatoreDidattico();
                ((EducatoreDidattico) u).setCodiceFiscale(r.getString("educatore_didattico"));
            }
            a.setOrganizzatore(u);          
            l.add(a);
            // a qua
        }
        if(l.size()==0){
            r.close();
            return l;
        }else{
            
            r.close();
            return l;
        }
    }
    
    
    //TODO gianfranco fammi sto metodo
    public List<Evento> getEventiPerData(Date data) throws SQLException {
List<Evento> l = new ArrayList<Evento>();
        
data.setYear(data.getYear()-1900);
data.setMonth(data.getMonth()-1);
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE data  =  ? ");
        
        tabella.setParam(stmt, 1, "data",data);
     
        
        ResultSet r = stmt.executeQuery();
        
        while(r.next()){
            Evento a = new Evento();
            
            a.setCC(r.getString("cc"));
            a.setData(r.getDate("data"));
            a.setDescrizione(r.getString("descrizione"));
            a.setNome(r.getString("nome"));
            a.setPath(r.getString("path"));
            a.setTipo(r.getString("tipo"));
            a.setId(r.getInt("id"));
            
            
            //controlla da qua
            EventPlanner u=null;
            
            
            if(r.getString("psico_pedagogo")!=null){
                u=new Psicopedagogo();
                ((Psicopedagogo) u).setCodiceFiscale(r.getString("psico_pedagogo"));
            }
            
            if(r.getString("personale_asilo")!=null){
                u=new PersonaleAsilo();
                ((PersonaleAsilo) u).setCodiceFiscale(r.getString("personale_asilo"));
            }
            if(r.getString("educatore_didattico")!=null){
                u=new EducatoreDidattico();
                ((EducatoreDidattico) u).setCodiceFiscale(r.getString("educatore_didattico"));
            }
            a.setOrganizzatore(u);          
            l.add(a);
            // a qua
        }
        if(l.size()==0){
            r.close();
            return l;
        }else{
            
            r.close();
            return l;
        }
    }
    
    
    //TODO gianfranco fammi sto metodo
    public List<Evento> getEventiPerNome(String nome) throws SQLException {
List<Evento> l = new ArrayList<Evento>();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE nome = ? ");
        
        tabella.setParam(stmt, 1, "nome",nome);
     
        
        ResultSet r = stmt.executeQuery();
        
        while(r.next()){
            Evento a = new Evento();
            
            a.setCC(r.getString("cc"));
            a.setData(r.getDate("data"));
            a.setDescrizione(r.getString("descrizione"));
            a.setNome(r.getString("nome"));
            a.setPath(r.getString("path"));
            a.setTipo(r.getString("tipo"));
            a.setId(r.getInt("id"));
            
            
            //controlla da qua
            EventPlanner u=null;
            
            
            if(r.getString("psico_pedagogo")!=null){
                u=new Psicopedagogo();
                ((Psicopedagogo) u).setCodiceFiscale(r.getString("psico_pedagogo"));
            }
            
            if(r.getString("personale_asilo")!=null){
                u=new PersonaleAsilo();
                ((PersonaleAsilo) u).setCodiceFiscale(r.getString("personale_asilo"));
            }
            if(r.getString("educatore_didattico")!=null){
                u=new EducatoreDidattico();
                ((EducatoreDidattico) u).setCodiceFiscale(r.getString("educatore_didattico"));
            }
            a.setOrganizzatore(u);          
            l.add(a);
            // a qua
        }
        if(l.size()==0){
            r.close();
            return l;
        }else{
            
            r.close();
            return l;
        }
    }
    
    
    
    
}
