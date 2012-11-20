package atsilo.storage;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import java.sql.SQLException;

import java.util.ArrayList;
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
                            result= db.executeQuery(query):
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

    @Override
    public String getNomeTabella() {
        
        return null;
    }

    @Override
    public void setNomeTabella(String newNome) {
       
    }

    @Override
    public boolean insert(ArrayList<String> valori) {
        
        return false;
    }

    @Override
    public ArrayList<String> select() {
       
        return null;
    }

    @Override
    public boolean update(ArrayList<String> valori, ArrayList<String> campi) {
      
        return false;
    }
    public Database getDatabase(){
        return db;
    }
}
