package atsilo.application;


import java.sql.SQLException;
import java.util.List;

import atsilo.entity.*;
import atsilo.exception.*;
import atsilo.storage.*;
import atsilo.stub.application.StubBambino;
import atsilo.stub.application.StubClasse;
import atsilo.stub.application.StubDomandaIscrizione;
import atsilo.util.AtsiloConstants;

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
     * Constructor
     */
    private ControlClassi() {
    }
    

    
    /**
     * Modifica una classe selezionata
     * @param c classe da modificare
     * @param numeroClasse nuova sezione
     * @return valore booleano di verifica
     * @throws DBConnectionException 
     * @throws ClasseException
     * @throws SQLException
     */
    public boolean modificaClasse(Classe c, String numeroClasse) throws DBConnectionException, SQLException, ClasseException{
        Database db = new Database();
        DBClasse stub = new DBClasse(db);
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            Classe classeModificata = stub.RicercaClassePerId(c.getId());
            if (classeModificata == null)
                throw new ClasseException("Classe non trovata");
            classeModificata.setSezione(numeroClasse);
            if (!stub.replace(c, classeModificata))
                throw new ClasseException("Modifica fallita");
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    
    
    /**
     * Seleziona una classe dato un id
     * @param id della classe da ricercare
     * @return c classe ricercata
     * @throws DBConnectionException 
     * @throws ClasseException
     * @throws SQLException
     */
    public Classe getClasseById(int id) throws DBConnectionException, ClasseException, SQLException{
        Database db = new Database();
        DBClasse stub = new DBClasse(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{            
            Classe c = stub.RicercaClassePerId(id);
            if(c == null)
                throw new ClasseException("Classe non trovata");
            return c;
        }
        finally{
            db.chiudiConnessione();
        }   
    }
    

    /**
     * Seleziona dal database tutti i bambini che hanno la classe pari a null, cioè non sono ancora stati assegnati
     * @return lista di bambini non ancora assegnato ad una classe
     * @throws DBConnectionException 
     * @throws BambinoException
     * @throws SQLException
     */
    public List<Bambino> bambiniSenzaClasse() throws DBConnectionException, SQLException, BambinoException{
        Database db = new Database();
        DBBambino stub = new DBBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniSenzaClasse();
            /*if(b.isEmpty())
                throw new BambinoException("Lista vuota");*/
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    /**
     * Seleziona dal database tutti i bambini che hanno la classe da convalidare da parte del delegato del rettore
     * @return lista di bambini da convalidare
     * @throws DBConnectionException 
     * @throws BambinoException
     * @throws SQLException
     */
    public List<Bambino> bambiniConClasseDaConvalidare() throws DBConnectionException, SQLException, BambinoException{
        Database db = new Database();
        DBBambino stub = new DBBambino(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Bambino> b = stub.ricercaBambiniConClasseDaConvalidare();
            /*if(b.isEmpty())
                throw new BambinoException("Lista vuota");*/
            return b;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    /**
     * inserisce una nuova classe 
     * @param id della nuova classe e lista di insegnanti
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws ClasseException
     */
    public boolean inserisciClasse(int id, String sezione, List<EducatoreDidattico> insegnanti) throws ClasseException, DBConnectionException{
        Database db = new Database();
        DBClasse stub = new DBClasse(db); 
        Classe classe = new Classe(id, sezione, insegnanti);
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!stub.inserisci(classe))
                throw new ClasseException("Inserimento fallito, la classe esiste già");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
        
    }
    
    /**
     * inserisce una nuova classe senza passare l'id
     * @param lista di insegnanti
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws ClasseException
     */
    public boolean inserisciClasse(String sezione, List<EducatoreDidattico> insegnanti) throws ClasseException, DBConnectionException{
        Database db = new Database();
        DBClasse stub = new DBClasse(db); 
        Classe classe = new Classe(sezione, insegnanti);
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!stub.inserisci(classe))
                throw new ClasseException("Inserimento fallito, la classe esiste già");
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
     * @throws SQLException 
     */
    public boolean cancellaClasse(int id) throws ClasseException, DBConnectionException, SQLException{
        Database db = new Database();
        DBClasse stub = new DBClasse(db); 
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Classe classe = stub.RicercaClassePerId(id);
            if(classe == null)
                throw new ClasseException("Classe non trovata");
            if(!stub.delete(classe))
                throw new ClasseException("eliminazione fallita");
            return true;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Inserisce un bambino alla classe
     * @param id della classe e bambino da aggiungere
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws BambinoException
     * @throws SQLException 
     */
    public boolean inserisciBambinoNellaClasse(int id, Bambino bambino) throws BambinoException, DBConnectionException, SQLException{
        Database db = new Database();
        DBBambino stub = new DBBambino(db);
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            Bambino bambinoModificato = stub.ricercaBambinoPerCodFiscale(bambino.getCodiceFiscale());
            if (bambinoModificato == null)
                throw new BambinoException("Bambino non trovato");
            bambinoModificato.setClasse(id);
            bambinoModificato.setIscrizioneClasse(AtsiloConstants.ISCRIZIONE_CLASSE_DA_CONVALIDARE);
            if (!stub.replace(bambino, bambinoModificato))
                throw new BambinoException("Modifica fallita");
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    /**
     * Inserisce un bambino alla classe, confermando la sua presenza nella classe
     * @param id della classe e bambino da aggiungere
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws BambinoException
     * @throws SQLException 
     */
    public boolean confermaBambinoNellaClasse(int id, Bambino bambino) throws BambinoException, DBConnectionException, SQLException{
        Database db = new Database();
        DBBambino stub = new DBBambino(db);
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            Bambino bambinoModificato = stub.ricercaBambinoPerCodFiscale(bambino.getCodiceFiscale());
            if (bambinoModificato == null)
                throw new BambinoException("Bambino non trovato");
            bambinoModificato.setIscrizioneClasse(AtsiloConstants.ISCRIZIONE_CLASSE_CONFERMATA);
            if (!stub.replace(bambino, bambinoModificato))
                throw new BambinoException("Modifica fallita");
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public boolean escludiBambinoNellaClasse(int id, Bambino bambino) throws BambinoException, DBConnectionException, SQLException{
        Database db = new Database();
        DBBambino stub = new DBBambino(db);
        
        if (!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try {
            Bambino bambinoModificato = stub.ricercaBambinoPerCodFiscale(bambino.getCodiceFiscale());
            if (bambinoModificato == null)
                throw new BambinoException("Bambino non trovato");
            bambinoModificato.setIscrizioneClasse(AtsiloConstants.ISCRIZIONE_CLASSE_RIFIUTATA);
            if (!stub.replace(bambino, bambinoModificato))
                throw new BambinoException("Modifica fallita");
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Inserisce una lista di bambini nella classe
     * @param id della classe e bambini da aggiungere
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws SQLException 
     * @throws BambinoException 
     */
    public boolean inserisciBambiniNellaClasse(int id, List<Bambino> bambini) throws DBConnectionException, SQLException, BambinoException{
        Database db = new Database();
        DBBambino stub = new DBBambino(db); 
        Bambino bambinoModificato = null;
        Bambino bambino = null;
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{  
            for (int i = 0;i<bambini.size();i++){
                bambino = bambini.get(i);
                bambinoModificato = bambini.get(i);
                if (bambinoModificato == null)
                    throw new BambinoException("Bambino non trovato");
                bambinoModificato.setClasse(id);
                if (!stub.replace(bambino, bambinoModificato))
                    throw new BambinoException("Modifica fallita");
            }
                
            return true;
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
        
    /**
     * Seleziona dal database tutti i bambini che hanno la classe pari a null, cioè non sono ancora stati assegnati
     * @return lista di bambini non ancora assegnato ad una classe
     * @throws DBConnectionException 
     * @throws ClasseException
     * @throws SQLException
     */
      public List<Classe> getClassi() throws DBConnectionException, SQLException, ClasseException{
        Database db = new Database();
        DBClasse stub = new DBClasse(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            List<Classe> c = stub.RicercaClassi();
            /*if(c.isEmpty())
                throw new ClasseException("Lista vuota");*/
            return c;
        }
        finally{
            db.chiudiConnessione();
        }
      }
    
    
    
    
    //I metodi conferma e rifiuta classe non servono più
    /*Da controllare, nell'entità Bambino è stato aggiunto il campo iscrizione_Classe che serve a vedere se l'assegnazione
    della classe è in attesa, convalidata o rifiutata. Per il momento metto tutto come commento
    
    
    /**
     * Conferma l'assegnazione di una lista di bambini ad una classe
     * @param id della classe 
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws ClasseException
     * @throws SQLException 
     
    public boolean ConfermaClasse(int id) throws ClasseException, DBConnectionException, SQLException{
        Database db = new Database();
        DBClasse stub = new DBClasse(db); 
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Classe classe = stub.RicercaClassePerId(id);
            if(classe == null)
                throw new ClasseException("Classe non trovata");
                
            Classe classeModificata = stub.RicercaClassePerId(id);
            classeModificata.setStatoClasse("confermata");
            if(!stub.replace(classe, classeModificata))
                throw new ClasseException("operazione fallita");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
    }
    
    
    
     * Rifiuta l'assegnazione di una lista di bambini ad una classe
     * @param id della classe 
     * @return valore booleano
     * @throws DBConnectionException 
     * @throws ClasseException
     
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
                
            Classe classeModificata = stub.RicercaClassePerId(id);
            classeModificata.setStatoClasse("rifiutata");
            if(!stub.replace(classe, classeModificata))
                throw new ClasseException("operazione fallita");
        }
        finally{
            db.chiudiConnessione();
        }
        return true;
    }*/
      
    
    /**
     * Gets the single istance of this class
     * @return a new ControlDatiPersonali
     */
    public static ControlClassi getIstance(){
        return INSTANCE;
    }
    
  
}