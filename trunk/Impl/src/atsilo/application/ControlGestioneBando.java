/**
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlGestioneBando.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Bottiglieri Gianfranco, 25/11/2012 
 * REVISION
 * nome revisore, data revisione
 *-----------------------------------------------------------------
 **/
package atsilo.application;

import atsilo.entity.Bando;
import atsilo.entity.DomandaIscrizione;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBBando;
import atsilo.storage.DBDomandaIscrizione;

import java.sql.Date;
import java.sql.SQLException;

public class ControlGestioneBando {
    private static ControlGestioneBando INSTANCE;
    private DBBando dbBando;
    private DBDomandaIscrizione dbDomandaIscrizione;
    
    ControlGestioneBando() {
        INSTANCE=new ControlGestioneBando();
        
        //Come prima cosa, bisogna creare un'istanza di database e aprire una connessione
        Database db = new Database();
        if (!db.apriConnessione()) 
        {
            throw new DBConnectionException("Connessione Fallita");
        }
        
        //Quindi, si possono creare tutti i gestori di tabelle necessari
        try {
            dbBando = new DBBando(db);
            dbDomandaIscrizione = new DBDomandaIscrizione(db);
            
        } finally {
            /*
             * Alla fine dell'interazione, prima di uscire dal metodo,
             * bisogna chiudere la connessione.
             */
            db.chiudiConnessione();
        }
        
    }
    
    boolean insrisciPunteggio(DomandaIscrizione iscrizione,int punteggio)
    {
        DomandaIscrizione domadandaDaModificare=new DomandaIscrizione();
        domadandaDaModificare=dbDomandaIscrizione.ricercaDomandaDaId(iscrizione.getiD());
        if(domadandaDaModificare==null)
            throw new DBConnectionException("connessione fallita");
        domadandaDaModificare.setPunteggio(punteggio);
        return true;
    }
    
    boolean inserisciIntervalloBando(String inizio, String fine) 
    {
        Bando bando=new Bando();
        bando.setDataFine(fine);
        bando.setDataInizio(inizio);
        if(dbBando.inserisci(bando))
            return true;
        else 
            return false;
    }
    
    boolean modificaBando(Bando bando,String inizio, String fine) 
    {

        Bando bandoDaModificare=new Bando();
        try {
            bandoDaModificare=dbBando.cercaBandoPerId(bando.getiD());
        } catch (SQLException e) 
        {
            throw new DBConnectionException("connessione fallita");
        }
        if(bandoDaModificare==null)
            throw new DBConnectionException("connessione fallita");
        
        return false;
    }
    
    public static ControlGestioneBando getIstance() {
        return INSTANCE;
    }
}
