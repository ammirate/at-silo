/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: NomeFile
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

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Tabella.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

/**
 * 
 * Classe che permette di eseguire operazioni su una tabella del database
 * implements ManagerDB
 */
public class Tabella /* implements ManagerDB */{
    private static final String SELECT_STAR = "SELECT * FROM ";
    private static final Logger LOG = Logger.getLogger(Tabella.class.getName());
    
    private final Database db; // connessione al database
    private final String nomeTabella;
    private Map<String, Integer> colonne = null;
    
    
    /**
     * Costruttore
     * 
     * @param nameTable
     *            nome della tabella del database su cui si effettueranno le
     *            operazioni
     * @param database
     *            Riferimento all'oggetto Database da usare
     */
    public Tabella(String nameTable, Database database) {
        nomeTabella = nameTable;
        db = database;
    }
    
    private Map<String, Integer> inizializzaMetadati() {
        Map<String, Integer> meta = null;
        
        try {
            ResultSet result;
            ResultSetMetaData resMetaData;
            
            // uso limit 1 in modo da selezionare al massimo una tupla
            result = db
                    .directQuery(SELECT_STAR + nomeTabella + " limit 1");
            resMetaData = result.getMetaData();
            
            int colCount = resMetaData.getColumnCount();
            meta = new HashMap<String, Integer>(2 * colCount);
            for (int i = 1; i <= colCount; ++i) {
                meta.put(resMetaData.getColumnName(i),
                        resMetaData.getColumnType(i));
            }
        } catch (SQLException e) {
            Database.logSQLException(LOG, Level.SEVERE, e);
            return null;
        }
        
        return meta;
    }
    
    /**
     * Restituisce una mappa dai nomi delle colonne della tabella
     * al loro tipo SQL (costante definita in {@link java.sql.Types}).
     * @return Mappa delle colonne. La mappa restituita e' immutabile.
     */
    public Map<String, Integer> getMetadati() {
        if (colonne == null) {
            Map<String, Integer> base = inizializzaMetadati();
            if (base != null && base.size() > 0) {
                colonne = Collections.unmodifiableMap(base);
            }
        }
        return colonne;
    }
    
    /**
     * Imposta un parametro all'interno di una query precompilata
     * @param stmt      Query precompilata
     * @param par       Indice del parametro (1-based)
     * @param type      Tipo della colonna cui il parametro corrisponde.
     *                  Questo parametro viene utilizzato per effettuare
     *                  un cast del valore al tipo corretto.
     *                  Se il parametro corrisponde a una colonna,
     *                  e' possibile usare il metodo
     *                  {@link #setParam(PreparedStatement, int, String, Object)},
     *                  che determina automaticamente il tipo di dato,
     *                  a partire dai metadati del database.
     * @param val       Valore da utilizzare. Puo' essere null, fermo restando
     *                  che la base di dati potrebbe rigettare valori nulli.
     * @throws SQLException Se si verifica un errore in fase di impostazione.
     */
    public void setParam(PreparedStatement stmt, int par, int type,
            Object val) throws SQLException {
        String err = "sconosciuto";
        try {
            if (val == null) {
                err = "nullo";
                stmt.setNull(par, type);
            } else {
                switch (type) {
                case Types.BOOLEAN:
                    err = "booleano";
                    stmt.setBoolean(par, (Boolean) val);
                case Types.SMALLINT:
                case Types.INTEGER:
                case Types.BIGINT:
                    err = "numerico intero";
                    stmt.setLong(par, ((Number) val).longValue());
                    break;
                case Types.DECIMAL:
                case Types.DOUBLE:
                case Types.FLOAT:
                    err = "numerico reale";
                    stmt.setDouble(par, ((Number) val).doubleValue());
                    break;
                default:
                    err = "stringa";
                    stmt.setString(par, val.toString());
                }
            }
        } catch (ClassCastException ex) {            
            err = String.format("Il valore (%3$s) fornito e' di tipo %1$s,"
                    + " mentre la colonna e' di tipo %2$s."
                    + " Probabilmente, questo e' causato da un errore di mapping."
                    , val.getClass().getName(), err, val.toString());
            throw new IllegalArgumentException(err, ex);
        }
    }
    
    /**
     * Imposta un parametro all'interno di una query precompilata
     * @param stmt      Query precompilata
     * @param par       Indice del parametro (1-based)
     * @param col       Nome della colonna cui il parametro corrisponde.
     *                  Questo parametro viene utilizzato per effettuare
     *                  un cast del valore al tipo corretto.
     *                  Se il parametro non corrisponde a una colonna,
     *                  utilizzare il metodo
     *                  {@link #setParam(PreparedStatement, int, int, Object)}
     * @param val       Valore da utilizzare. Puo' essere null, fermo restando
     *                  che la base di dati potrebbe rigettare valori nulli.
     * @throws SQLException Se si verifica un errore in fase di impostazione.
     */
    public void setParam(PreparedStatement stmt, int par, String col,
            Object val) throws SQLException {
        Integer typeID = getMetadati().get(col);
        if (typeID == null) {
            throw new IllegalArgumentException("No such column: " + col);
        }
        
        setParam(stmt, par, typeID, val);
    }
    
    /**
     * Restituisce il database usato con la relativa connessione
     * @return database usato
     */
    public Database getDatabase() {
        return db;
    }
    
    /**
     * Restituisce il nome della tabella associata
     * @return Nome della tabella
     */
    public String getNomeTabella() {
        return nomeTabella;
    }
    
    
    
    /**
     * Restituisce un {@link PreparedStatement}, inizializzato
     * con la query fornita in input.
     * @param sql       Stringa di query
     * @return          Query precompilata
     * @throws SQLException Se si verifica un errore nella creazione.
     * @see atsilo.storage.Database#prepareStatement(java.lang.String)
     */
    public PreparedStatement prepareStatement(String sql) throws SQLException {
        return db.prepareStatement(sql);
    }
}
