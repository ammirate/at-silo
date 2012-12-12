package atsilo.application;


import java.util.List;

import atsilo.entity.*;
import atsilo.exception.*;
import atsilo.storage.*;
import atsilo.stub.application.StubClasse;

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
 * Elisa D'Eugenio, 04/12/2012
 *-----------------------------------------------------------------
 */
public class ControlClassi {
    private static final ControlClassi INSTANCE = new ControlClassi();

    /**
     * Contructor
     */
    private ControlClassi() {
    }
    

    
    /**
     * inserisce una nuova classe 
     * @param id della nuova classe e lista di insegnanti
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws ClasseException
     */
    public boolean inserisciClasse(int id, String statoClasse, List<EducatoreDidattico> insegnanti) throws ClasseException, DBConnectionException{
        Database db = new Database();
        DBClasse stub = new DBClasse(db); 
        Classe classe = new Classe(id, statoClasse, insegnanti);
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!stub.inserisci(classe))
                throw new ClasseException("Inserimento fallito");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
        
    }
    
    
    /**
     * cancella una classe 
     * @param id della classe da cancellare
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws ClasseException
     */
    public boolean cancellaClasse(int id) throws ClasseException, DBConnectionException{
        Database db = new Database();
        StubClasse stub = new StubClasse(db); 
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Classe classe = stub.ricercaClassePerId(id);
            if(classe == null)
                throw new ClasseException("Classe non trovata");
            if(!stub.cancellaClasse(classe))
                throw new ClasseException("eliminazione fallita");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
    }
    
    
    /**
     * Inserisce un bambino alla classe
     * @param id della classe e bambino da aggiungere
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws ClasseException
     */
    public boolean inserisciBambinoNellaClasse(int id, Bambino bambino) throws ClasseException, DBConnectionException{
        Database db = new Database();
        StubClasse stub = new StubClasse(db); 
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Classe classe = stub.ricercaClassePerId(id);
            if(classe == null)
                throw new ClasseException("Classe non trovata");
            //TODO si dovrebbe modificare la chiave esterna di Bambino su Classe tramite DBBambino 
            //(classe è attributo di bambino)
            Classe nuovaClasse = stub.ricercaClassePerId(id);
            nuovaClasse.aggiungiBambino(bambino);
            if(!stub.replace(classe, nuovaClasse))
                throw new ClasseException("operazione fallita");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
    }
    
    
    /**
     * Inserisce una lista di bambini nella classe
     * @param id della classe e bambini da aggiungere
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws ClasseException
     */
    public boolean inserisciBambiniNellaClasse(int id, List<Bambino> bambini) throws ClasseException, DBConnectionException{
        Database db = new Database();
        StubClasse stub = new StubClasse(db); 
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Classe classe = stub.ricercaClassePerId(id);
            if(classe == null)
                throw new ClasseException("Classe non trovata");
            Classe nuovaClasse = stub.ricercaClassePerId(id);
            
            for (int i = 0;i<bambini.size();i++){
                nuovaClasse.aggiungiBambino(bambini.get(i));
            }
                
            if(!stub.replace(classe, nuovaClasse))
                throw new ClasseException("operazione fallita");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
    }
    
    
    /**
     * Conferma l'assegnazione di una lista di bambini ad una classe
     * @param id della classe 
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws ClasseException
     */
    public boolean ConfermaClasse(int id) throws ClasseException, DBConnectionException{
        //dovrebbe esserci un campo nella classe: conferma
        Database db = new Database();
        StubClasse stub = new StubClasse(db); 
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Classe classe = stub.ricercaClassePerId(id);
            if(classe == null)
                throw new ClasseException("Classe non trovata");
                
            if(!stub.confermaClasse(classe))
                throw new ClasseException("operazione fallita");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
    }
    
    
    /**
     * Rifiuta l'assegnazione di una lista di bambini ad una classe
     * @param id della classe 
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws ClasseException
     */
    public boolean RifiutaClasse(int id) throws ClasseException, DBConnectionException{
        //dovrebbe esserci un campo nella classe: conferma
        Database db = new Database();
        StubClasse stub = new StubClasse(db); 
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Classe classe = stub.ricercaClassePerId(id);
            if(classe == null)
                throw new ClasseException("Classe non trovata");
                
            if(!stub.rifiutaClasse(classe))
                throw new ClasseException("operazione fallita");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
    }
      
    
    /**
     * Gets the single istance of this class
     * @return a new ControlDatiPersonali
     */
    public static ControlClassi getIstance(){
        return INSTANCE;
    }
    
  
}