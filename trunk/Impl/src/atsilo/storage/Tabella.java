package atsilo.storage;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;


public class Tabella implements ManagerDB {
    private Database  db ;//connessione al database instanziata ad ogni query per evitare variabili statiche
    private String nomeTabella;
    private ResultSet result;
    private ResultSetMetaData resMetaData;
    private static Logger logger = Logger.getLogger("global");

    public Tabella(String nameTable, Database database){
        nomeTabella=nameTable;
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
     *
     * @return
     */
    public Database getDatabase(){
        return db;
    }
    /**
     *
     * @return
     */
    
    public String getNomeTabella() {
        return null;
    }
    /**
     *
     * @param newNome
     */
    
    public void setNomeTabella(String newNome) {
    }
    /**
     *
     * @return
     */
    public List<String> getNomiAttributi() {
        return Collections.emptyList();
    }
    
    /**
     *
     * @param nomeAttributi
     * @return
     */
    public List<String> getTipoColonne(List<String> nomeAttributi) {
        return Collections.emptyList();
    }

    /**
     *
     * @return
     */
    public List<String> getChiavi() {
        return Collections.emptyList();
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
