package atsilo.storage;

import atsilo.entity.Genitore;
import atsilo.entity.Richiesta;
import atsilo.entity.Servizio;

import java.util.List;

public class DBRichiesta extends DBBeans {
    
    public DBRichiesta(Database db){
        super("Richiesta",db);
    }

    public Richiesta ricercaRichiestaDaServizio(int ID) {
        return null;
    }

    public List ricerdaRichiestaPerGenitore(Genitore g) {
        return null;
    }

}
