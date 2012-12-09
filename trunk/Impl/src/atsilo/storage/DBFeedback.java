package atsilo.storage;

import atsilo.entity.Feedback;
import atsilo.entity.Genitore;

import atsilo.entity.PersonaleAsilo;

import atsilo.entity.Tirocinante;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class DBFeedback extends DBBeans {
    
    public DBFeedback(Database db){
        super("feedback",db);
    }
    
        public List<Feedback> ricercaFeedbackperImpiegato(PersonaleAsilo impiegato){
            List<Feedback> feedback;
            return feedback;
        }
        public List<Feedback> ricercaFeedbackperTirocinante(Tirocinante tirocinante){
            List<Feedback> feedback;
            return feedback;
        }
        public List<Feedback> ricercaFeedbackPerId(Integer Id){
            List<Feedback> feedback;
            return feedback;
        
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