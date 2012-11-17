package atsilo.storage;


import java.sql.*;
import java.util.logging.Logger;

/**
 * classe che si interfaccia connection il database ed esegue le query associate
 *
 * @author
 * @version 1.0
 */
public class Database {
	
	/**
	 * Costruttore della classe
	 */
	public Database(){
		connection = null;
		apriConnessione();
	}
	
	/**
	 * metodo che apre la connessione al database
	 * @return ritorna true se la connessione al DataBase
	 * avvenuta correttamente false altrimenti
	 */
	private boolean apriConnessione(){
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
	 * metodo che chiude la connesione al database
	 * @return ritorna true se la chiusura della connessione al DataBase
	 * avvenuta correttamente false altrimenti
	 */
	private boolean chiudiConnessione(){
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
	 * metodo che controlla se la connessione al database è attiva
	 * @return ritorna true se la connessione al DataBase è attiva false altrimenti
	 */
	public boolean isOpen() throws SQLException{
		return !connection.isClosed();
	}
	
	/**
     * metodo che esegue una query di inserimento nel db
     *
     * @param query Stringa che rappresenta la query che verra eseguita
     * @return ritorna true se la query è stata eseguita connection successo
     * false altrimenti
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
     * Aggiorna una tupla del database
     *
     * @param query Stringa che rappresenta la query che verra eseguita
     * @return Restituisce true se l'aggiornamento avviene connection successo, false altrimenti
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
     * @param query Query che viene eseguita sul database
     * @return Restituisce true se la cancellazione avviene connection successo, false altrimenti
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
	 * Effettua una select sul database seleziona dei dati dal 
	 * database tramite una query
	 * 
	 * @param  query Query che verra eseguita
	 * @return Restituisce il ResultSet contenente l'insieme dei valori della select
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
	 * Restituisce le chiavi primarie di una tabella presente nel database
	 * 
	 * @param table Nome della tabella
	 * 
	 * @return ResultSet contenente le chiavi primarie della tabella
	 */
	public ResultSet getChiavi(String table){
		ResultSet result = null;
		try {
			dbMetaData = connection.getMetaData();
			result =  dbMetaData.getPrimaryKeys(null,"erpsoftdb", table);
			
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
	private final String url="jdbc:mysql://localhost/erpsoftdb?user=root&password=pass";
	static final String driver = "com.mysql.jdbc.Driver";
	private Statement statement;
	private ResultSet resultSet;
	private static Logger logger = Logger.getLogger("global");
}