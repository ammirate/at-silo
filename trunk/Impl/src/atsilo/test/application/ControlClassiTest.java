/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlClassiTest.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Elisa, 05/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import atsilo.application.ControlClassi;
import atsilo.application.ControlDatiPersonali;
import atsilo.entity.Bambino;
import atsilo.entity.Classe;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Genitore;
import atsilo.entity.Utente;
import atsilo.exception.ClasseException;
import atsilo.exception.DBConnectionException;
import atsilo.exception.GenitoreException;
import atsilo.exception.InserimentoDatiException;
import atsilo.storage.Database;
import atsilo.stub.application.StubClasse;

/**
 * Classe ControlClassiTest
 * <Descrizione classe>
 * 
 * @author Elisa
 * 
 */
public class ControlClassiTest {
    
    ControlClassi control = new ControlClassi();
    Classe c = null;
    Bambino b = new Bambino();
    List<Bambino> bb = new ArrayList<Bambino>();

    
    @Test
    // inserimento di una classe
    public void inserisciClasseTest() throws ClasseException, DBConnectionException {
         assertTrue(control.inserisciClasse(5, "", null));     
    }
    
    @Test
    // eliminazione di una classe
    public void cancellaClasseTest() throws ClasseException, DBConnectionException   {
         assertTrue(control.cancellaClasse(5));     
    }
    
    @Test
    // inserimento di un bambino in una classe
    public void inserisciBambinoNellaClasseTest() throws ClasseException, DBConnectionException   {
         assertTrue(control.inserisciBambinoNellaClasse(5, b));     
    }
    
    @Test
    // inserimento di una lista di bambini in una classe
    public void inserisciBambiniNellaClasseTest() throws ClasseException, DBConnectionException   {
         assertTrue(control.inserisciBambiniNellaClasse(5, bb));     
    }
    
    @Test
    // conferma di una classe
    public void ConfermaClasseTest() throws ClasseException, DBConnectionException   {
         assertTrue(control.ConfermaClasse(5));     
    }
    
    @Test
    // rifiuto di una classe
    public void RifiutaClasseTest() throws ClasseException, DBConnectionException   {
         assertTrue(control.RifiutaClasse(5));     
    }
    
}
