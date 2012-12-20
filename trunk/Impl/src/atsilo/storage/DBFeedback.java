package atsilo.storage;
/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBFeedback.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli,Ferdinando Di Palma 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */
//TODO da implementare priorità bassa
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
            List<Feedback> feedback = null;
            return feedback;
        }
        public List<Feedback> ricercaFeedbackperTirocinante(Tirocinante tirocinante){
            List<Feedback> feedback = null;
            return feedback;
        }
        public List<Feedback> ricercaFeedbackPerId(Integer Id){
            List<Feedback> feedback = null;
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