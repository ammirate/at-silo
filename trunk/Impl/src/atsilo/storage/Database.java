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
			statement.close();
			resultSet = null;
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
	
	/**
     * Esegue una query di inserimento nel db
     *
     * @param query Stringa che rappresenta la query che deve essere eseguita
     * @return  true se la query è stata eseguita con successo
     *          false altrimenti
     */
	public boolean insertDB(String query){
		try{
			statement = connection.createStatement();
			statement.execute(query);
		}catch(SQLException e){
			logger.warning("SQL Error. Inserimento non riuscito");
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
     * Aggiorna una tupla presente nel database
     *
     * @param query Stringa che rappresenta la query che deve essere eseguita
     * @return true se la query è stata eseguita con successo
     *         false altrimenti
     */
	public boolean updateDB(String query){
		try{
			statement = connection.createStatement();
			statement.executeUpdate(query);
		}catch(SQLException e){
			logger.warning("SQL Error. Aggiornamento non riuscito");
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
     * Effettua l'eliminazione di una tupla di valori dal database
     *
     * @param query Stringa che viene eseguita sul database
     * @return  true se la cancellazione è avvenuta con successo
     *          false altrimenti
     */
	public Boolean deleteDB(String query){
		Boolean state = false;
		try{
			statement = connection.createStatement();
			statement.executeUpdate(query);
			return true;
		}catch(SQLException e){
			logger.warning("SQL Error. Cancellazione non riuscita");
			while (e!=null){
				logger.severe("SQL EXCEPTION");
				logger.info("State: "+e.getSQLState());
				logger.info("Message: "+e.getMessage());
				logger.info("Error: "+e.getErrorCode());
				if(e.getErrorCode()==1451)
					state = null;
				e = e.getNextException();
			}
			return state;
		}
	}
	
	/**
	 * Effettua una selezione dati dal database tramite query
	 * 
	 * @param  query Stringa che deve essere eseguita
	 * @return ResultSet contenente l'insieme dei valori della select
	 */
	public ResultSet selectDB(String query){
		try{
			statement = connection.createStatement();
			resultSet=statement.executeQuery(query);
		}catch(SQLException e){
			logger.warning("SQL Error. Visualizzazione non riuscito");
			while (e!=null){
				logger.severe("SQL EXCEPTION");
				logger.info("State: "+e.getSQLState());
				logger.info("Message: "+e.getMessage());
				logger.info("Error: "+e.getErrorCode());
				e = e.getNextException();
			}
			return null;
		}
		return resultSet;
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
	private Statement statement;
	private ResultSet resultSet;
	private static Logger logger = Logger.getLogger("global");
}