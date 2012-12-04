package atsilo.test.application;

import test.storage.StubClasse;
import test.storage.StubRegistro;
import atsilo.entity.Classe;
import atsilo.entity.Registro;
import atsilo.exception.DBConnectionException;
import atsilo.exception.RegistroException;
import atsilo.storage.Database;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlRegistro.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012
 *-----------------------------------------------------------------
 */
public class ControlRegistroTest {
    
    private static final ControlRegistroTest INSTANCE = new ControlRegistroTest();
    
    
    /**
     * Contructor
     */
    private ControlRegistroTest() {}
    
    
    /**
     * Adds a new register in the database
     * @param registro is the new register
     * @return true if the register was added correctly, else false
     * @throws RegistroException 
     * @throws DBConnectionException 
     */
    public void inserisciRegistro(Registro registro) throws RegistroException, DBConnectionException{
        Database db = new Database();
        StubRegistro stub = new StubRegistro();
        
        if(!stub.inserisciRegistroNelDatabase(registro))
            throw new RegistroException("Inserimento fallito");
        
        
    }
    
    
    /**
     * Gets a class register
     * @param classe is the class
     * @return a register
     * @throws DBConnectionException 
     * @throws RegistroException 
     */
    public Registro getRegistro(Classe classe) throws DBConnectionException, RegistroException{
        Database db = new Database();
        StubRegistro stub = new StubRegistro();
        
        Registro r = stub.ricercaRegistroPerClasse(classe);
        if(r == null)
            throw new RegistroException("Registro non trovato");
        return r;
        
        
    }
    
    
    /**
     * Adds a new register to a class
     * @param registro is the register to add
     * @param classe is the class tht receives the register
     * @return false if the register was added correctly, else false
     * @throws DBConnectionException 
     * @throws RegistroException 
     */
    public void assegnaRegistro(Registro registro, Classe classe) throws DBConnectionException, RegistroException{
        Database db = new Database();
        StubRegistro stubRegistro = new StubRegistro();
        StubClasse stubClasse = new StubClasse(db);
       
        Classe c = stubClasse.RicercaClassePerId(classe.getId());
            if(c!=null)
                if(!stubRegistro.assegnaRegistroAClasse(registro.getId(), classe.getId()))
                    throw new RegistroException("Assegnazione del registro alla classe fallita");
        
        
    }
    
    
    /**
     * Gets the single istance of this class
     * @return a new ControlRegistro
     */
    public static ControlRegistroTest getIstance(){
        return INSTANCE;
    }
    
    
    
}
