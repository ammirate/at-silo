/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBUtil.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * giulio, 01/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package test.storage;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;
import java.util.regex.Pattern;

import atsilo.storage.Database;

/**
 * Classe DBUtil Utilita' per il testing del layer storage
 * 
 * @author Giulio Franco <g.franco9@studenti.unisa.it>
 */
public final class DBUtil {
    private DBUtil() {
    }
    
    /**
     * Esegue uno script .sql sul database specificato
     * 
     * @param db
     *            Database
     * @param rebaseScript
     *            Path dello script da eseguire. Lo script dev'essere un file
     *            locale.
     * @throws FileNotFoundException
     *             se il file non esiste
     * @throws SQLException
     *             in caso di eccezioni durante l'esecuzione
     */
    public static void execScript(Database db, String rebaseScript)
            throws FileNotFoundException, SQLException {
        // Fetch query
        Scanner s = new Scanner(new File(rebaseScript));
        /*Pattern stmtExpr = Pattern.compile(
                "^([^\"'`;]*(\"[^\"]*\")?('[^']*')?(`[^`]*`)?)+;", Pattern.MULTILINE);*/
        s.useDelimiter(";\\r?\\n");
        String stmt;
        //while ((stmt = s.findWithinHorizon(stmtExpr, 0)) != null) {
        while (s.hasNext()) {
            stmt = s.next();
            db.prepareStatement(stmt).executeUpdate();
        }
        s.close();   
    }
    
    /**
     * Crea un set di proprieta' da usare per la connessione al database
     * 
     * @param dbDriver
     *            Driver da usare
     * @param dbUrl
     *            URL del database
     * @param dbUser
     *            Nome utente
     * @param dbPassword
     *            Password
     */
    public static void creaProprieta(String dbDriver, String dbUrl,
            String dbUser, String dbPassword) {
        Properties res = new Properties();
        res.setProperty("atsilo.db.driver", dbDriver);
        res.setProperty("atsilo.db.url", dbUrl);
        res.setProperty("atsilo.db.user", dbUser);
        res.setProperty("atsilo.db.password", dbPassword);
    }
}
