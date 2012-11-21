package atsilo.storage;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;

/**
 * 
 * Classe che permette di eseguire operazioni su una tabella del database
 * implements ManagerDB
 * @author Angelo G. Scafuro
 * @version 1.0
 *
 */
public class Tabella implements ManagerDB {
    private Database  db ;//connessione al database instanziata ad ogni query per evitare variabili statiche
    private String nomeTabella;
    private ResultSet result;
    private ResultSetMetaData resMetaData;
    private static Logger logger = Logger.getLogger("global");

    /**
     * Costruttore
     * @param nameTable nome della tabella del database su cui 
     *        si effettueranno le operazioni
     * @param database Riferimento al database da usare
     */
    public Tabella(String nameTable, Database database){
        setNomeTabella(nameTable);
        db=database;
    }
    
    public ArrayList<String> getTipoColonne(ArrayList<String> nomeAttributi){
                    ArrayList<String> tipo = null;
                    String query = "select ";
                    if(nomeAttributi!=null){
                            for(String s: nomeAttributi){
                                    query = query+s+",";
                            }
                            query = query.substring(0, query.length()-1);
                    }else{
                            query = query+"*";
                    }
                    query = query+" from "+nomeTabella+" limit 1;";
                    try{
                            tipo =  new ArrayList<String>();
                            result= db.selectDB(query);
                        
                                                              
                            resMetaData= result.getMetaData();
                            String tipoSpecifico = "OBJECT";

                            for(int i=1;i<=resMetaData.getColumnCount();i++){
                                    if(resMetaData.getColumnTypeName(i).equals("SMALLINT")||resMetaData.getColumnTypeName(i).equals("INT")||resMetaData.getColumnTypeName(i).equals("BIGINT"))
                                            tipoSpecifico = "INTEGER";
                                    else if(resMetaData.getColumnTypeName(i).equals("DECIMAL")||resMetaData.getColumnTypeName(i).equals("DOUBLE")||resMetaData.getColumnTypeName(i).equals("FLOAT"))
                                            tipoSpecifico = "DOUBLE";
                                    else if(resMetaData.getColumnTypeName(i).equals("VARCHAR")||resMetaData.getColumnTypeName(i).equals("CHARACTER")||resMetaData.getColumnTypeName(i).equals("DATE"))
                                            tipoSpecifico = "STRING";

                                    tipo.add(tipoSpecifico);
                            }
                    }catch(SQLException e){
                            logger.warning("Impossibile prelevare i tipi degli attributi");
                            while (e!=null){
                                    logger.severe("SQL EXCEPTION");
                                    logger.info("State: "+e.getSQLState());
                                    logger.info("Message: "+e.getMessage());
                                    logger.info("Error: "+e.getErrorCode());
                                    e = e.getNextException();
                            }
                    }
                    return tipo;
            }

    /**
     * Restituisce il database usato
     * @return database usato
     */
    public Database getDatabase(){
        return db;
    }
    
    /**
     * Restituisce il nome della tabella
     * @return nome tabella
     */
    public String getNomeTabella() {
        return nomeTabella;
    }
    
    /**
     * Setta la tabella su cui eseguire le operazioni
     * @param newNome nuovo nome della tabella su cui eseguire le operazioni
     */
    public void setNomeTabella(String newNome) {
        nomeTabella=newNome;
    }
    
    /**
     *
     * @return
     */
    public ArrayList<String> getNomiAttributi(){
        ArrayList<String> lista= new ArrayList<String>();
        try{
                result= db.selectDB("select * from "+nomeTabella+" LIMIT 1");
                resMetaData= result.getMetaData();
                for(int i=1;i<=resMetaData.getColumnCount();i++){
                        String nome=resMetaData.getColumnName(i);
                        lista.add(nome);
                }
        }catch (SQLException e) {
                logger.warning("Impossibile prelevare i nome degli attributi");
                while (e!=null){
                        logger.severe("SQL EXCEPTION");
                        logger.info("State: "+e.getSQLState());
                        logger.info("Message: "+e.getMessage());
                        logger.info("Error: "+e.getErrorCode());
                        e = e.getNextException();
                }
        }
        return lista;
}
    
    /**
     * Restituisce i tipi degli attributi relativi ad una tabella
     * 
     * @param  lista di attributi di cui richiedere il tipo
     * @return lista dei tipi degli attributi
     */
    public ArrayList<String> getTipoColonne(List<String> nomiAttributo){
            ArrayList<String> tipo = null;
            String query = "select ";
            if(nomiAttributo!=null){
                    for(String s: nomiAttributo){
                            query = query+s+",";
                    }
                    query = query.substring(0, query.length()-1);
            }else{
                    query = query+"*";
            }
            query = query+" from "+nomeTabella+" limit 1;";
            try{
                    tipo =  new ArrayList<String>();
                    result= db.selectDB(query);
                    resMetaData= result.getMetaData();
                    String tipoSpecifico = "OBJECT";

                    for(int i=1;i<=resMetaData.getColumnCount();i++){
                            if(resMetaData.getColumnTypeName(i).equals("SMALLINT")||resMetaData.getColumnTypeName(i).equals("INT")||resMetaData.getColumnTypeName(i).equals("BIGINT"))
                                    tipoSpecifico = "INTEGER";
                            else if(resMetaData.getColumnTypeName(i).equals("DECIMAL")||resMetaData.getColumnTypeName(i).equals("DOUBLE")||resMetaData.getColumnTypeName(i).equals("FLOAT"))
                                    tipoSpecifico = "DOUBLE";
                            else if(resMetaData.getColumnTypeName(i).equals("VARCHAR")||resMetaData.getColumnTypeName(i).equals("CHARACTER")||resMetaData.getColumnTypeName(i).equals("DATE"))
                                    tipoSpecifico = "STRING";

                            tipo.add(tipoSpecifico);
                    }
            }catch(SQLException e){
                    logger.warning("Impossibile prelevare i tipi degli attributi");
                    while (e!=null){
                            logger.severe("SQL EXCEPTION");
                            logger.info("State: "+e.getSQLState());
                            logger.info("Message: "+e.getMessage());
                            logger.info("Error: "+e.getErrorCode());
                            e = e.getNextException();
                    }
            }
            return tipo;
    }

    /**
     * Restituisce la lista delle chiavi primarie della tabella
     * 
     * @return Lista delle chiavi primarie
     */
    public ArrayList<String> getChiavi() {
            ArrayList<String> lista= null;
            try{
                    lista= new ArrayList<String>();
                    result = db.getChiavi(nomeTabella);
                    while (result.next()){
                            lista.add(result.getString("COLUMN_NAME"));
                    }
            }catch (SQLException e) {
                    logger.warning("Impossibile prelevare le chiavi della tabella");
                    while (e!=null){
                            logger.severe("SQL EXCEPTION");
                            logger.info("State: "+e.getSQLState());
                            logger.info("Message: "+e.getMessage());
                            logger.info("Error: "+e.getErrorCode());
                            e = e.getNextException();
                    }
            }
            return lista;
    }

    /**
     *
     * @param valori
     * @return
     */
    public boolean insert(List<String> valori) {
        return false;
    }

    /**
     *
     * @param nomeAttributo
     * @param nomiAttributo
     * @param valoriAttributi
     * @return
     */
    public List<ArrayList<String>> selezione(List<String> nomeAttributo,List<String> nomiAttributo,List<String> valoriAttributi) {
        return Collections.emptyList();
    }
    
    /**
     *
     * @param valori
     * @param campi
     * @return
     */
    public boolean update(List<String> valori, List<String> campi) {
        return false;
    }

    /**
     *
     * @param chiavi
     * @param valChiavi
     * @return
     */
    public Boolean rimuovi(List<String> chiavi, List<String> valChiavi) {
        return null;
    }
}
