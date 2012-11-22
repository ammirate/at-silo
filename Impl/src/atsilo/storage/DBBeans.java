package atsilo.storage;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import atsilo.entity.Beans;

/**
 * 
 * Classe DBBeans contente i metodi delle operazioni più comuni su una tabella
 * 
 * @author Angelo G. Scafuro
 *
 */
public abstract class DBBeans<B extends Beans> {
    protected Tabella tabella;
    private Database db;
    
    /**
     * Metodo costruttore
     * @param nomeTabella nome reale della relativa tabella del database
     * @param database connessione al database
     */
    public DBBeans(String nomeTabella,Database database ){
        tabella=new Tabella(nomeTabella,database);
        db=tabella.getDatabase();
    }
 
    /**
     * Cambia il la tabella su cui si eseguono le operazioni 
     * @param realTable nuova tabella
     * @param database  connessione al database
     */
    public void setTabella(Tabella realTable,Database database){
       tabella=realTable;
       db=database;
    }
    /**
     * Restituisce tutti gli elementi di una tabella
     * @return lista di tutti i record relativi alla tabella del beans
     */
    public ArrayList<ArrayList<String>> getAll() {
       ArrayList<ArrayList<String>> risultato = new ArrayList<ArrayList<String>>();
       String query=" SELECT * FROM "+tabella.getNomeTabella();
       risultato=tabella.eseguiQuerySpecifica(query);                  
       return risultato;
    }
    
    /**
     * Inserisce un beans nella relativa tabella del database
     * @param RealBeans beans da inserire nel database
     * @return true in caso di inserimento riuscito
     *         false altrimenti
     */
    public abstract boolean inserisci(B realBeans) throws SQLException;
    
    /**
     * Sostituisce un beans con un nuovo beans.
     * @param RealBeans beans presente nel databse
     * @param NewRealBeans nuovo beans che sostituirà il suo corrispondente  nel database
     * @return
     */
    public abstract boolean replace(B realBeans,B newRealBeans) throws SQLException;
    
    /**
     * Cancella una beans dal database
     * @param RealBeans
     * @return
     */
    public abstract boolean delete(B realBeans) throws SQLException ;
    
    /**
     * Controlla se un bean è presente nella tabella del database
     * @param realBeans bean di cui si vuole conoscere se è presente nella tabella
     * @return true in caso di bean presente
     *         false altrimenti
     */
    public abstract boolean ifInTable(B realBeans);
        
    /**
     * Restituisce il database con la relativa connessione
     * @return oggetto database con relativa connessione
     */
    public Database getDatabase(){
        return db;
    }

}
