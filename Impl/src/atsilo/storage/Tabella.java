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
    private Database  db ;//connessione al database 
    private String nomeTabella;
    private ResultSet result;
    private ResultSetMetaData resMetaData;
    private static Logger logger = Logger.getLogger("global");

    /**
     * Costruttore
     * @param nameTable nome della tabella del database su cui 
     *        si effettueranno le operazioni
     * @param database Riferimento all'oggetto Database da usare
     */
    public Tabella(String nameTable, Database database){
        setNomeTabella(nameTable);
        db=database;
        result = null;
        resMetaData = null;
    }
    
    /**
     * @see atsilo.storage.ManagerDB#getTipoColonne(List)
     * @param nomeAttributi nome degli attributi(se null verranno selezionati tutti gli attributi della tabella)
     */
    public ArrayList<String> getTipoColonne(List<String> nomeAttributi){
                    ArrayList<String> tipo = null;
                    String query = "select ";
                    if(nomeAttributi!=null){
                            for(String s: nomeAttributi){
                                    query = query+s+",";
                            }
                            query = query.substring(0, query.length()-1);//toglie la virgola dopo l'ultimo attributo
                    }else{
                            query = query+"*";
                    }
                    query = query+" from "+nomeTabella+" limit 1;"; //uso limit1 in modo da selezionare al massimo una tupla
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
     * Restituisce il database usato con la relativa connessione
     * @return database usato
     */
    public Database getDatabase(){
        return db;
    }
    
    /**
     * @see atsilo.storage.ManagerDB#getNomeTabella()
     */
    public String getNomeTabella() {
        return nomeTabella;
    }
    
    /**
     *  @see atsilo.storage.ManagerDB#setNomeTabella(String)
     */
    public void setNomeTabella(String newNome) {
        nomeTabella=newNome;
    }
    
   /**
    * @see atsilo.storage.ManagerDB#getNomiAttributi()
    */
    public ArrayList<String> getNomiAttributi(){
        ArrayList<String> lista= new ArrayList<String>();
        try{
                result= db.selectDB("select * from "+nomeTabella+" limit 1");//uso limit 1 in modo da selezionare al massimo una tupla
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
     * @see atsilo.storage.ManagerDB#getChiaviPrimarie()
     */
    public ArrayList<String> getChiaviPrimarie() {
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
     *@see atsilo.storage.ManagerDB#insert(List)
     */
    public boolean insert(List<String> valori) {
        try
        {
                if(db.isOpen()){

                        String query="insert into "+nomeTabella+ " values(";
                        ArrayList<String> temp=getTipoColonne(null);
                        int i;
                        if(temp==null){
                                if(nomeTabella!=null)
                                        logger.warning("ERRORE Tabella.insert: il NomeTabella non è presente nel database");
                                return false;
                        }

                        if(valori==null){
                                logger.warning("ERRORE Tabella.insert: hai passato null come Valori");
                                return false;
                        }
                        if(valori.size()!=temp.size()){
                                logger.warning("ERRORE Tabella.insert: il numero di elementi in valori non è giusto il giusto valore è "+temp.size());
                                return false;
                        }

                        for(i=0;i<temp.size()-1;i++){
                                if(usoApici(temp.get(i)))
                                        query=query+"'"+valori.get(i)+"',";
                                else
                                        query=query+valori.get(i)+",";
                        }
                        if(usoApici(temp.get(i)))
                                query=query+"'"+valori.get(i)+"'";
                        else
                                query=query+valori.get(i);
                        query=query+")";

                        return db.insertDB(query);
                }else{
                logger.warning("ERRORE Database non aperto");
                return false;
                }
        }catch(SQLException e){
                logger.warning("ERRORE Tabella.insert:  Operazione non riuscita");
        }
        return true;
}

    /**
     * @see atsilo.storage.ManagerDB#selezione(List, List, List)
     */
    public ArrayList<ArrayList<String>> selezione(List<String> nomeAttributo,List<String> nomiAttributo, List<String> valoriAttributi) {
            ArrayList<ArrayList<String>> risultato = null;
            String query = "select ";
           
            try {
                if(db.isOpen()){
                    risultato= new ArrayList<ArrayList<String>>();
                    if(db.isOpen()){
                            if(nomeAttributo==null)
                                    query=query+" * from "+nomeTabella+" ";
                            else{
                                    for(String s: nomeAttributo){
                                            query = query+s+",";
                                    }
                                    query = query.substring(0, query.length()-1);//elimino virgola dopo ultimo attributo
                                    query = query + " from "+nomeTabella+" ";
                            }
                            if(nomiAttributo!=null){
                                    ArrayList<String> tipo=getTipoColonne(nomiAttributo);
                                    if(valoriAttributi!=null&&valoriAttributi.size()==nomiAttributo.size()){
                                            int i;
                                            query = query +"where ";
                                            for(i=0;i<nomiAttributo.size()-1;i++){
                                                    query=query+nomiAttributo.get(i)+" = ";
                                                    if(usoApici(tipo.get(i)))
                                                            query=query+"'"+valoriAttributi.get(i)+"' && ";
                                                    else
                                                            query=query+valoriAttributi.get(i)+" && ";
                                            }
                                            query=query+nomiAttributo.get(i)+" = ";
                                            if(usoApici(tipo.get(i)))
                                                    query=query+"'"+valoriAttributi.get(i)+"'";
                                            else
                                                    query=query+valoriAttributi.get(i);

                                    }
                            }

                    }
                    result= db.selectDB(query);

                    resMetaData = result.getMetaData();
                    while(result.next()){
                            ArrayList<String> row = new ArrayList<String>();
                            for(int j = 1;j<=resMetaData.getColumnCount();j++){
                                    row.add(result.getString(j));
                            }

                            risultato.add(row);
                    }
                }else{
                    logger.warning("ERRORE Database non aperto");
                return null;
                }
            } catch (SQLException e) {
                    logger.warning("SQL error in Tabella.selezione. Operazione non riuscita");
            }
            return risultato;
    }
    
    /**
     * @see atsilo.storage.ManagerDB#update(List, List, List, List)
     */
    public boolean update(List<String> nomeAttributi,List<String> valoreAttributi, List<String> chiavi, List<String> valoriChiavi) {

            ArrayList<String> tipo=getTipoColonne(null);
            if(tipo==null){
                    logger.warning("ERRORE Tabella.update: il nome della tabella non è presente nel database");
                    return false;
            }
            if(nomeAttributi==null||valoreAttributi==null){
                    logger.warning("ERRORE Tabella.update: hai passato tabella come valore null");
                    return false;
            }
            if(nomeAttributi.size()!=valoreAttributi.size()){
                    logger.warning("ERRORE Tabella.update: parametri non corretti");
                    return false;
            }
            if(chiavi==null){
                    logger.warning("ERRORE Tabella.update: non hai indicato le chiavi della tupla da modificare");
                    return false;
            }


            String query = "Update "+nomeTabella+" set ";

            for(int i=0;i<nomeAttributi.size()-1;i++){
                    query=query+nomeAttributi.get(i)+" = ";
                    if(usoApici(tipo.get(i)))
                            query=query+"'"+valoreAttributi.get(i)+"', ";
                    else
                            query=query+valoreAttributi.get(i)+", ";
            }
            query=query+nomeAttributi.get(nomeAttributi.size()-1)+" = ";
            if(usoApici(tipo.get(nomeAttributi.size()-1)))
                    query=query+"'"+valoreAttributi.get(nomeAttributi.size()-1)+"'";
            else
                    query=query+valoreAttributi.get(nomeAttributi.size()-1);

            query = query+" where ";

            for(int i=0;i<chiavi.size()-1;i++){
                    query=query+chiavi.get(i)+" = ";
                    if(usoApici(tipo.get(i)))
                            query=query+"'"+valoriChiavi.get(i)+"'&& ";
                    else
                            query=query+valoriChiavi.get(i)+"&& ";
            }

            query=query+chiavi.get(chiavi.size()-1)+" = ";

            if(usoApici(tipo.get(chiavi.size()-1)))
                    query=query+"'"+valoriChiavi.get(chiavi.size()-1)+"'";
            else
                    query=query+valoriChiavi.get(chiavi.size()-1);

            return db.updateDB(query);
    }
 

    /**
     *@see atsilo.storage.ManagerDB#rimuovi(List, List)
     * 
     */
    public boolean rimuovi(List<String> chiavi, List<String> valChiavi) {
            try {
                    if(db.isOpen()){
                            String query="delete from "+nomeTabella+" where ";
                            ArrayList<String> tipo=getTipoColonne(chiavi);
                            if(tipo==null){
                                    logger.warning("ERRORE Tabella.Rimuovi: attributi chiave non corretti");
                                    return false;

                            }       
                            if(chiavi==null){
                                    logger.warning("ERRORE Tabella.Rimuovi: hai passato null come parametro chiavi");
                                    return false;
                            }
                            if(valChiavi==null){
                                    logger.warning("ERRORE Tabella.Rimuovi: valChiavi è null");
                                    return false;
                            }
                            if(chiavi.size()!=valChiavi.size()){
                                    logger.warning("ERRORE Tabella.Rimuovi: l'arraylist chiavi e valChiavi non hanno la stessa dimensione");
                                    return false;   
                            }
                            int i;
                            for(i=0;i<chiavi.size()-1;i++){
                                    query=query+chiavi.get(i)+" = ";
                                    if(usoApici(tipo.get(i)))
                                            query=query+"'"+valChiavi.get(i)+"' && ";
                                    else
                                            query=query+valChiavi.get(i)+" && ";
                            }
                            query=query+chiavi.get(i)+" = ";
                            if(usoApici(tipo.get(i)))
                                    query=query+"'"+valChiavi.get(i)+"'";
                            else
                                    query=query+valChiavi.get(i);

                            return db.deleteDB(query);

                    }else{
                            logger.warning("ERRORE Database non aperto");
                            return false;
                    }

            }catch(SQLException e){
                    logger.warning("ERRORE Tabella.Rimuovi: impossibile eliminare la tupla dal database");
                    return false;
            }
    }
    
    /**
     * @see atsilo.storage.ManagerDB#eseguiQuerySpecifica(String)
     */
    public ArrayList<ArrayList<String>> eseguiQuerySpecifica(String query) {
            ArrayList<ArrayList<String>> risultato = null;
            try{
                    
                            risultato = new ArrayList<ArrayList<String>>();
                            result= db.eseguiQuerySpecifica(query);
                            resMetaData = result.getMetaData();
                            while(result.next()){
                                    ArrayList<String> row = new ArrayList<String>();
                                    for(int j = 1;j<=resMetaData.getColumnCount();j++){
                                            row.add(result.getString(j));
                                    }
                                    risultato.add(row);
                            }
            } catch (SQLException e) {
                    logger.warning("ERRORE Tabella.eseguiQuerySpecifica(String query(): Operazione non riuscita");
            }
            return risultato;
    }
    
    /**
     * Verifica se è necessario usare apici per le query
     * @param tipo tipo dell'attriubuto
     * @return true in caso sia necessario usare apici per le query
     *         false altrimenti
     */
    private boolean usoApici(String tipo){
        if(tipo=="STRING"){
                return true;
        }
        else{
                if(tipo==null)
                        logger.info("ERRORE: Passato null come parametro a usoApici()"); 
                return false;
        }
    }

}
