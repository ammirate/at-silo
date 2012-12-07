/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: TestDBAccessi.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * fabio, 06/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package test.storage;

import java.sql.SQLException;

import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Tirocinante;
import atsilo.storage.DBPersonaleAsilo;
import atsilo.storage.DBQuestionario;
import atsilo.storage.DBTirocinante;
import atsilo.storage.Database;

/**
 * Classe TestDBAccessi
 * <Descrizione classe>
 * 
 * @author fabio
 * 
 */
public class TestDBAccessi {
    
    /**
     * @param args
     * @throws SQLException 
     */
    public static void main(String[] args) throws SQLException {
        // TODO Scheletro generato automaticamente
        Database db=new Database();
        db.apriConnessione();
        
        DBPersonaleAsilo q=new DBPersonaleAsilo(db);
        //___testClasseDBPersonaleAsilo
       
        //metodo_getPersonaleAsiloPerCf
       /* PersonaleAsilo a=q.getPersonaleAsiloPerCF("MRSVRN90A32B235B");
        System.out.println("Nome : "+a.getCognome());
        System.out.println("Nome : "+a.getNome());
*/
        //metodo_getCategoriaAppartenenzaPersonaleAsilo
      /* String s=q.getCategoriaAppartenenzaPersonaleAsilo("MRSVRN90A32B235B");
       System.out.println("Eccoti la cat : "+s);*/
      /*metodo_getTirocinantePerCf*/
        
        DBTirocinante dbt=new DBTirocinante(db);
        Tirocinante t=dbt.getTirocinantePerCF("MZZCRS91L44X098Y");
        System.out.println("Tirocinante : ="+t.getCapDomicilio()+t.getTelefono()+t.getEmail());
        db.chiudiConnessione();
 
    }
    //Logger
    /*
     * private static final java.util.Logger LOG
     *         = Logger.getLogger(TestDBAccessi.class.getName());
     */
    
    //Variabili di istanza
    
    
    //Costruttori
    
    
    //Metodi
}
