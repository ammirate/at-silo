package atsilo.application;

import atsilo.entity.Utente;
import atsilo.storage.DBAccount;
import atsilo.storage.DBEducatoreDidattico;
import atsilo.storage.DBEventPlanner;
import atsilo.storage.DBGenitore;
import atsilo.storage.DBPersonaleAsilo;
import atsilo.storage.DBPsicopedagogo;
import atsilo.storage.DBResponsabileQuestionario;
import atsilo.storage.DBTirocinante;
import atsilo.storage.Database;

public class ControlLogin {
    private static final ControlLogin INSTANCE;
    private DBAccount dbAccount;
    private DBGenitore dbGenitore;
    private DBEducatoreDidattico dbEducatoreDidattico;
    private DBEventPlanner dbEventPlanner;
    private DBPersonaleAsilo dbPersonaleAsilo;
    private DBPsicopedagogo  dbPsicopedagogo;
    private DBResponsabileQuestionario  dbResponsabileQuestionario;
    private DBTirocinante dbTirocinante;
    
    ControlLogin() {
        //Come prima cosa, bisogna creare un'istanza di database e aprire una connessione
        Database db = new Database();
        if (!db.apriConnessione()) 
        {
            /*
             * Connessione fallita
             * Bisogna restituire un errore all'utente
             */
        }

        //Quindi, si possono creare tutti i gestori di tabelle necessari
        try {
            dbAccount = new DBAccount(db);
            dbGenitore = new DBGenitore(db);
            dbEducatoreDidattico = new DBEducatoreDidattico(db);
            dbEventPlanner = new DBEventPlanner(db);
            dbPersonaleAsilo = new DBPersonaleAsilo(db);
            dbPsicopedagogo = new DBPsicopedagogo(db);
            dbResponsabileQuestionario = new DBResponsabileQuestionario(db);
            dbTirocinante = new DBTirocinante(db);
            
        } finally {
            /*
             * Alla fine dell'interazione, prima di uscire dal metodo,
             * bisogna chiudere la connessione.
             */
            db.chiudiConnessione();
        }
    }

    Boolean getValoreLogin(String username, String password) {
        
        
        return false;
    }

    public static ControlLogin getInstance() {
        return null;
        
    }
}
