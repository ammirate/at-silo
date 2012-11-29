package atsilo.storage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import atsilo.entity.ResponsabileQuestionario;

public class DBResponsabileQuestionario extends DBBeans {
    
    public DBResponsabileQuestionario(Database db){
        super("ResponsabileQuestionario",db);
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