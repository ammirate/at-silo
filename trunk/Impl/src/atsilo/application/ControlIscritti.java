package atsilo.application;



import java.util.List;


import atsilo.entity.*;
import atsilo.exception.*;
import atsilo.storage.*;
import atsilo.stub.application.StubBambino;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlIscritti.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Elisa D'Eugenio, 04/12/2012
 *-----------------------------------------------------------------
 */
public class ControlIscritti {
    private static final ControlIscritti INSTANCE = new ControlIscritti();

    /**
     * Contructor
     */
    ControlIscritti() {
    }
    
    

    
    /**
     * Visualizza una lista di bambini per idoneità (idoneo)
     * @return lista di bambini 
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    public List<Bambino> getListaBamabiniIdonei() throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniIdonei();
            if(b.isEmpty())
            {
                db.chiudiConnessione();
                throw new BambinoException("Lista vuota");
            }
            db.chiudiConnessione();
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Visualizza una lista di bambini per idoneità (non idoneo)
     * @return lista di bambini
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    public List<Bambino> getListaBamabiniNonIdonei() throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniNonIdonei();
            if(b.isEmpty())
            {
                db.chiudiConnessione();
                throw new BambinoException("Lista vuota");
            }
            db.chiudiConnessione();
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Visualizza una lista di bambini per categoria (richiesta per il primo anno)
     * @param categoria: "inAttesa" "iscrittiPrecedentemente" 
     * @return lista di bambini da visualizzare
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    public List<Bambino> getListaBamabiniRichiestaPrimoAnno() throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniRichiestaPrimoAnno();
            if(b.isEmpty())
            {
                db.chiudiConnessione();
                throw new BambinoException("Lista vuota");
            }
            db.chiudiConnessione();
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Visualizza una lista di bambini per categoria (iscritti da anni precedenti)
     * @param categoria: "inAttesa" "iscrittiPrecedentemente" 
     * @return lista di bambini da visualizzare
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    public List<Bambino> getListaBamabiniAnniPrecedenti() throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniAnniPrecedenti();
            if(b.isEmpty())
            {
                db.chiudiConnessione();
                throw new BambinoException("Lista vuota");
            }
            db.chiudiConnessione();
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Visualizza una lista di bambini per categoria (all'ultimo anno di asilo)
     * @param categoria: "inAttesa" "iscrittiPrecedentemente" 
     * @return lista di bambini da visualizzare
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    public List<Bambino> getListaBamabiniFineCicloScolastico() throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniFineCicloScolastico();
            if(b.isEmpty())
            {
                db.chiudiConnessione();
                throw new BambinoException("Lista vuota");
            }
            db.chiudiConnessione();
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Visualizza una lista di bambini per categoria (rinunciatari)
     * @param categoria: "inAttesa" "iscrittiPrecedentemente" 
     * @return lista di bambini da visualizzare
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    public List<Bambino> getListaBamabiniRinunciatari() throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniRinunciatari();
            if(b.isEmpty())
            {
                db.chiudiConnessione();
                throw new BambinoException("Lista vuota");
            }
            db.chiudiConnessione();
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Visualizza una lista di bambini per servizi erogati (pasto)
     * @return lista di bambini da visualizzare
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    public List<Bambino> getListaBamabiniServizioMensa() throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniServizioMensa();
            if(b.isEmpty())
            {
                db.chiudiConnessione();
                throw new BambinoException("Lista vuota");
            }
            db.chiudiConnessione();
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Visualizza una lista di bambini per servizi erogati (part time)
     * @param categoria: "inAttesa" "iscrittiPrecedentemente" 
     * @return lista di bambini da visualizzare
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    public List<Bambino> getListaBamabiniServizioPartTime() throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniServizioPartTime();
            if(b.isEmpty())
            {
                db.chiudiConnessione();
                throw new BambinoException("Lista vuota");
            }
            db.chiudiConnessione();
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Visualizza una lista di bambini per servizi erogati (full time)
     * @param categoria: "inAttesa" "iscrittiPrecedentemente" 
     * @return lista di bambini da visualizzare
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    public List<Bambino> getListaBamabiniServizioFullTime() throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniServizioFullTime();
            if(b.isEmpty())
            {
                db.chiudiConnessione();
                throw new BambinoException("Lista vuota");
            }
            db.chiudiConnessione();
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Visualizza una lista di bambini per servizi erogati (per disabili)
     * @param categoria: "inAttesa" "iscrittiPrecedentemente" 
     * @return lista di bambini da visualizzare
     * @throws DBConnectionException 
     * @throws BambinoException
     */
    public List<Bambino> getListaBamabiniServizioServizioDisabili() throws BambinoException, DBConnectionException{
        Database db = new Database();
        StubBambino stub = new StubBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniServizioDisabili();
            if(b.isEmpty())
            {
                db.chiudiConnessione();
                throw new BambinoException("Lista vuota");
            }
            db.chiudiConnessione();
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
      
    
    /**
     * Gets the single istance of this class
     * @return a new ControlDatiPersonali
     */
    public static ControlIscritti getIstance(){
        return INSTANCE;
    }
    
  
}