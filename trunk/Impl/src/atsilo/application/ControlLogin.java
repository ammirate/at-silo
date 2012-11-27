package atsilo.application;

import atsilo.entity.Utente;

public class ControlLogin {
    private static final ControlLogin INSTANCE;

    ControlLogin() {
        //Come prima cosa, bisogna creare un'istanza di database e aprire una connessione
        Database db = new Database();
        if (!db.apriConnessione()) {
            /*
             * Connessione fallita
             * Bisogna restituire un errore all'utente
             */
        }

        //Quindi, si possono creare tutti i gestori di tabelle necessari
        try {
            DBAccount dbAccount = new DBAccount(db);
            DBGenitore dbGenitore = new DBGenitore(db);

            /*
             * Qui si possono fare tutte le operazioni necessarie
             * sui gestori di tabelle.
             */
            return xxx;

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
