package atsilo.storage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import atsilo.entity.OrarioUtente;
import atsilo.entity.Servizio;
/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBOrarioUtente.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 *///TODO da implementare priorità bassa
public class DBOrarioUtente extends DBBeans {
    
    public DBOrarioUtente(Database db){
        super("orario_utente",db);
    }

    public OrarioUtente ricercaOrarioUtenteDaId(int ID) {
        return null;
    }

    /**
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() {
        // TODO Scheletro generato automaticamente
        return null;
    }

    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {
        // TODO Scheletro generato automaticamente
        return null;
    }

    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Object creaBean(ResultSet r) throws SQLException {
        // TODO Scheletro generato automaticamente
        return null;
    }

}
