package atsilo.application;

import test.storage.StubBambino;
import test.storage.StubGenitore;
import atsilo.entity.*;
import atsilo.exception.BambinoException;
import atsilo.exception.DBConnectionException;
import atsilo.exception.GenitoreException;
import atsilo.exception.RegistroException;
import atsilo.storage.Database;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlDatiPersonali.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Elisa D'Eugenio, 28/11/2012
 *-----------------------------------------------------------------
 */
public class ControlDatiPersonali {
    private static final ControlDatiPersonali INSTANCE = new ControlDatiPersonali();

    /**
     * Contructor
     */
    ControlDatiPersonali() {
    }

    /**
     * TODO
     */
    String getValoreStatoIscrizione(Bambino bambino) {
        /**
         * Non è ancora possibile implementare questo metodo in quanto mancano alcuni attributi nell'entità bando
         */
        return null;
    }

    /**
     * Gets a class genitore
     * @param genitore da visualizzare
     * @return genitore
     * @throws DBConnectionException 
     * @throws GenitoreException
     */
    Genitore getDatiGenitore(Genitore genitore) throws GenitoreException, DBConnectionException{
        Database db = new Database();
        StubGenitore stub = new StubGenitore(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            Genitore g = stub.ricercaGenitore(genitore);
            if(g == null)
                throw new GenitoreException("Genitore non trovato");
            return g;
        }
        finally{
            db.chiudiConnessione();
        }
    }

    /**
     * Gets a class bambino
     * @param bambino da visualizzare
     * @return bambino
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    Bambino getDatiBambino(Bambino bambino) throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            Bambino b = stub.ricercaBambino(bambino);
            if(b == null)
                throw new BambinoException("Bambino non trovato");
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }

    //Da fare
    Utente getUtente(Utente utente) {
        return null;
    }

    //Da fare
    public static ControlDatiPersonali getIstance() {
        return null;
    }
}
