package atsilo.storage;


import java.sql.*;
import java.util.logging.Logger;

/**
 * Classe che serve ad interfacciarsi con il database
 *
 * @author Angelo G. Scafuro
 * @version 1.0
 */
public class Database {
	
	/**
	 * Costruttore della classe
	 */
	public Database(){
		connection = null;
		preparedStatement=null;
	}
	
	/**
	 * Apre la connessione con il database
	 * @return  true in caso di connessione riuscita
         *          false altrimenti
	 */
	public boolean apriConnessione(){
		try{
			Class.forName(driver);
			connection = DriverManager.getConnection(url);
			for(SQLWarning warn = connection.getWarnings();warn!=null;warn = warn.getNextWarning()){
				logger.warning("SQL WARNINGS:");
				logger.info("State: "+warn.getSQLState());
				logger.info("Message: "+ warn.getMessage());
				logger.info("Error: "+warn.getErrorCode());
			}
		}catch(SQLException e){
			while (e!=null){
				logger.severe("SQL EXCEPTION");
				logger.info("State: "+e.getSQLState());
				logger.info("Message: "+e.getMessage());
				logger.info("Error: "+e.getErrorCode());
				e = e.getNextException();
			}
		} catch (ClassNotFoundException e) {
			logger.severe("Errore durante la connessione. Driver non trovato");
			logger.info("Message: "+e.getMessage());
		}
		return true;
	}
	
	
	/**
	 * Chiude la connesione con il database
	 * @return  true in caso di successo di chiusura connessione
         *          false altrimenti
	 */
	public boolean chiudiConnessione(){
		try{
			connection.close();
		}catch(SQLException e){
			logger.severe("Errore durante la disconnessione");
			while (e!=null){
				logger.severe("SQL EXCEPTION");
				logger.info("State: "+e.getSQLState());
				logger.info("Message: "+e.getMessage());
				logger.info("Error: "+e.getErrorCode());
				e = e.getNextException();
			}
		}
		return true;
	}

	/**
	 * Controlla se la connessione al database è stata stabilita ed attiva
	 * @return  true se la connessione al DataBase è attiva
         *          false altrimenti
	 */
	public boolean isOpen() throws SQLException{
		return !connection.isClosed();
	}
	
	/** Esegue qualunqe tipo di query sul database restituendo un risultato ResulSet
	  * @param query da eseguire
	  * @return resultSet contenente il risulto della query in caso che la query lo preveda,
	  *                   null altrimenti
	  */
	    public ResultSet eseguiQueryRS(String query) {
	    	ResultSet result;
            try{
                preparedStatement=connection.prepareStatement(query);
                preparedStatement.execute();
                result= preparedStatement.getResultSet();
                preparedStatement.close(); 
            }catch(SQLException e){
                    logger.warning("SQL Error:Database.eseguiQuerySpecifica: Query non andata a buon fine");
                    while (e!=null){
                            logger.severe("SQL EXCEPTION");
                            logger.info("State: "+e.getSQLState());
                            logger.info("Message: "+e.getMessage());
                            logger.info("Error: "+e.getErrorCode());
                            e = e.getNextException();
                    }
                    return null;
            }
            return result;
	        
	    }
	    
	    /** Esegue qualunqe tipo di query sul database 
	          * @param query da eseguire
	          * @return true se la query è stata eseguite correttamente
	          *         false altrimenti
	          */
	            public boolean eseguiQueryB(String query) {
	                boolean result;
	                try{
	                    preparedStatement=connection.prepareStatement(query);
	                    preparedStatement.execute();
	                    preparedStatement.close();
	            }catch(SQLException e){
	                    logger.warning("SQL Error:Database.eseguiQuerySpecifica: Query non andata a buon fine");
	                    while (e!=null){
	                            logger.severe("SQL EXCEPTION");
	                            logger.info("State: "+e.getSQLState());
	                            logger.info("Message: "+e.getMessage());
	                            logger.info("Error: "+e.getErrorCode());
	                            e = e.getNextException();
	                    }
	                    return false;
	            }
	            return true;
	                
	            }
	
	/**
	 * Ottiene le chiavi primarie di una tabella presente nel database
	 * 
	 * @param table nome della tabella
	 * 
	 * @return ResultSet contenente le chiavi primarie della tabella
	 */
	public ResultSet getChiavi(String table){
		ResultSet result = null;
		try {
			dbMetaData = connection.getMetaData();
			result =  dbMetaData.getPrimaryKeys(null,"atsilodb", table);
			
		} catch (SQLException e) {
			logger.severe("SQL EXCEPTION");
			logger.info("State: "+e.getSQLState());
			logger.info("Message: "+e.getMessage());
			logger.info("Error: "+e.getErrorCode());
		}
		return result;
		
	}
	
	private DatabaseMetaData dbMetaData;
	private Connection connection;
	private final String url="jdbc:mysql://localhost/atsilodb?user=root&password=pass";
        static final String driver = "com.mysql.jdbc.Driver";
	private PreparedStatement preparedStatement;
	private static Logger logger = Logger.getLogger("global");
}