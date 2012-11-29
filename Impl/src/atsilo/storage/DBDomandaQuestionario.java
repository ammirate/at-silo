package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Psicopedagogo;

import atsilo.entity.Questionario;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class DBDomandaQuestionario extends DBBeans {
    Tabella tabella;
    /**
     * 
     * @param db
     */
    public DBDomandaQuestionario(Database db){super("DomandaQuestionario",db);}
    

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