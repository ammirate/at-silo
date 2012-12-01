/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Database.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, data creazione
 * REVISION
 * nome revisore, data revisione
 *-----------------------------------------------------------------
 */

package atsilo.storage;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Classe che serve ad interfacciarsi con il database
 * 
 * @author Angelo G. Scafuro
 * @version 1.0
 */
public final class Database {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    
    // Log helpers
    private static final Logger LOG = Logger
            .getLogger(Database.class.getName());
    private static final String SQL_ERR_LOG
            = "SQL ERRORS:\n\tState: {0}\n\tMessage{1}\n\tError:{2}";
    private static final String SQL_WARN_LOG
            = "SQL WARNINGS:\n\tState: {0}\n\tMessage{1}\n\tError:{2}";
    
    private DatabaseMetaData dbMetaData;
    private Connection connection;
    
    
    /**
     * Costruttore della classe
     */
    public Database() {
        connection = null;
    }
    
    /**
     * Apre la connessione con il database
     * 
     * @return true in caso di connessione riuscita, false altrimenti.
     */
    public boolean apriConnessione() {
        // Carica le proprieta'
        Properties p = new Properties();
        try {
            p.load(Database.class.getResourceAsStream("db.properties"));
        } catch (IOException e) {
            LOG.log(Level.SEVERE,
                    "Impossibile leggere le proprieta' del database", e);
            return false;
        }
        return apriConnessione(p);
    }
    
    /**
     * Apre la connessione con il database
     * @param prop proprieta' da usare per la connessione
     * @return true in caso di connessione riuscita, false altrimenti.
     */
    public boolean apriConnessione(Properties prop) {
        try {
            Class.forName(DRIVER);
                        
            connection = DriverManager.getConnection(
                    prop.getProperty("atsilo.db.url"),
                    prop.getProperty("atsilo.db.user"),
                    prop.getProperty("atsilo.db.password"));
        } catch (SQLException e) {
            logSQLException(LOG, Level.SEVERE, e);
            return false;
        } catch (ClassNotFoundException e) {
            LOG.log(Level.SEVERE, null, e);
            return false;
        }
        
        try {
            logSQLWarning(LOG, Level.WARNING, connection.getWarnings());
        } catch (SQLException e) {
            // Vivremo anche senza conoscere i warning...
            logSQLException(LOG, Level.WARNING, e);
        }
        return true;        
    }
    
    /**
     * Chiude la connesione con il database
     * 
     * @return true in caso di successo di chiusura connessione, false
     *         altrimenti
     */
    public boolean chiudiConnessione() {
        try {
            connection.close();
        } catch (SQLException e) {
            LOG.log(Level.WARNING, "Errore durante la disconnessione", e);
            while (e != null) {
                LOG.log(Level.WARNING, null, e);
                e = e.getNextException();
            }
            return false;
        }
        return true;
    }
    
    /**
     * Controlla se la connessione al database e' stata stabilita ed attiva
     * 
     * @return true se la connessione al DataBase e' attiva, false altrimenti
     */
    public boolean isOpen() {
        try {
            return (connection != null) && (!connection.isClosed());
        } catch (SQLException e) {
            // Connessione aperta, ma stato inconsistente
            LOG.log(Level.WARNING, null, e);
            return true;
        }
    }
    
    /**
     * Wrapper per Connection.prepareStatement
     * 
     * @param sql
     *            Query SQL
     * @return PreparedStatement
     * @throws SQLException
     *             Se si verifica un'eccezione nella creazione
     * @see java.sql.Connection#prepareStatement(java.lang.String)
     */
    public PreparedStatement prepareStatement(String sql) throws SQLException {
        return connection.prepareStatement(sql);
    }
    
    /**
     * Esegue una query diretta al database.
     * <p>
     * <em>Utilizzare con molta cautela,
     * solo quando i metodi forniti da {@link Tabella} e {@link DBBeans}
     * sono insufficienti, e non e' possibile aggiungervi funzionalita'</em>
     * </p>
     * 
     * @param query
     *            Query SQL da eseguire
     * @return Risultato della query
     * @throws SQLException
     *             se si verifica un'eccezione nell'esecuzione.
     */
    public ResultSet directQuery(String query) throws SQLException {
        Statement stmt = connection.createStatement();
        return stmt.executeQuery(query);
    }
    
    /**
     * Ottiene le chiavi primarie di una tabella presente nel database
     * 
     * @param table
     *            nome della tabella
     * 
     * @return ResultSet contenente le chiavi primarie della tabella
     * @throws SQLException
     *             se si verifica un'eccezione nell'esecuzione della query.
     */
    public ResultSet getChiavi(String table) throws SQLException {
        ResultSet result = null;
        
        dbMetaData = connection.getMetaData();
        result = dbMetaData.getPrimaryKeys(null, "atsilodb", table);
        
        return result;
    }
    
    /**
     * Funzione di utilita' che permette di effettuare il logging di una
     * eccezione SQL.
     * 
     * @param log
     *            Logger su cui emettere il messaggio
     * @param lv
     *            Livello di logging
     * @param e
     *            Eccezione da loggare
     */
    public static void logSQLException(Logger log, Level lv, SQLException e) {
        if (e != null) {
            log.log(lv, null, e);
            do {
                log.log(lv,
                        SQL_ERR_LOG,
                        new Object[] { e.getSQLState(), e.getMessage(),
                                e.getErrorCode() });
                e = e.getNextException();
            } while (e != null);
        }
    }
    
    /**
     * Funzione di utilita' che permette di effettuare il logging di un warning
     * SQL.
     * 
     * @param log
     *            Logger su cui emettere il messaggio
     * @param lv
     *            Livello di logging
     * @param e
     *            Warning da loggare
     */
    public static void logSQLWarning(Logger log, Level lv, SQLWarning e) {
        if (e != null) {
            log.log(lv, null, e);
            do {
                log.log(lv,
                        SQL_WARN_LOG,
                        new Object[] { e.getSQLState(), e.getMessage(),
                                e.getErrorCode() });
                e = e.getNextWarning();
            } while (e != null);
        }
    }
}