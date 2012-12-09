/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlDatiPersonaliTest.java
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
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import atsilo.entity.Bambino;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;
import atsilo.entity.Utente;
import atsilo.exception.BambinoException;
import atsilo.exception.DBConnectionException;
import atsilo.exception.DomandaIscrizioneException;
import atsilo.exception.GenitoreException;
import atsilo.exception.InserimentoDatiException;
import atsilo.exception.UtenteException;
import atsilo.application.ControlDatiPersonali;


/**
 * Classe ControlDatiPersonaliTest
 * <Descrizione classe>
 * 
 * @author Elisa
 * 
 */
public class ControlDatiPersonaliTest {
    
    ControlDatiPersonali control = new ControlDatiPersonali();
    Genitore g = null;
    Bambino b = null;
    Utente u = null;

    
    @Test
    // visualizzazione genitore normale
    public void getDatiGenitoreTest() throws GenitoreException, DBConnectionException, SQLException, InserimentoDatiException  {
         g = control.getDatiGenitore("MSCGNN75H43H654K");
         assertNotNull(g);
    }
    
    @Test (expected=InserimentoDatiException.class)
    // visualizzazione genitore con codice fiscale non valido
    public void getDatiGenitoreTest2() throws GenitoreException, DBConnectionException, SQLException, InserimentoDatiException  {
         g = control.getDatiGenitore("MSCGNN75H43H654");
    }
   
    @Test
    // visualizzazione iscritto normale
    public void getDatiBambinoTest() throws BambinoException, DBConnectionException, SQLException, InserimentoDatiException   {
         assertNotNull(control.getDatiBambino("MSCGNN75H43H654K"));
    }
    
    @Test (expected=InserimentoDatiException.class)
    // visualizzazione iscritto con codice fiscale non valido
    public void getDatiBambinoTest2() throws BambinoException, DBConnectionException, SQLException, InserimentoDatiException   {
        b = control.getDatiBambino("MSCGH43H654K");
    }
    
    @Test
    // visualizzazione utente normale
    public void getValoriUtenteTest() throws BambinoException, DBConnectionException, SQLException, UtenteException, InserimentoDatiException   {
         assertNotNull(control.getValoriUtente("MSCGNN75H43H654K"));
    }
    
    @Test (expected=InserimentoDatiException.class)
    // visualizzazione utente con codice fiscale non valido
    public void getValoriUtenteTest2() throws BambinoException, DBConnectionException, SQLException, InserimentoDatiException, UtenteException   {
        u = control.getValoriUtente("MSCGNN7H43H654K");
    }

    @Test
    // modifica certificazioni
    public void completaIscrizioneTest() throws DomandaIscrizioneException, DBConnectionException, BambinoException, InserimentoDatiException   {
         assertTrue(control.completaIscrizione("MSCGNN75H43H654K", "consegnato", "consegnato", "consegnato"));
    }
    
    @Test (expected=InserimentoDatiException.class)
    // modifica certificazioni con codice fiscale non valido
    public void completaIscrizioneTest2() throws DomandaIscrizioneException, DBConnectionException, BambinoException, InserimentoDatiException   {
         assertTrue(control.completaIscrizione("MNN75H43H654K", "consegnato", "consegnato", "consegnato"));
    }
    
    @Test
    // convalida Iscrizione
    public void convalidaIscrizioneTest() throws DomandaIscrizioneException, DBConnectionException   {
         assertTrue(control.convalidaIscrizione(10));
    }
    
    @Test
    // completa Iscrizione
    public void getValoriIscrizioniNonConvalidateTest() throws DomandaIscrizioneException, DBConnectionException   {
         assertNotNull(control.getValoriIscrizioniNonConvalidate());
    }
    
    @Test
    // completa Iscrizione
    public void escludiIscrizioneTest() throws DomandaIscrizioneException, DBConnectionException   {
         assertTrue(control.escludiIscrizione(10));
    }
    
    @Test
    // prendi cf bambini da account
    public void getCfBambiniTest() throws BambinoException, DBConnectionException    {
         assertNotNull(control.getCfBambini("MarioB"));
    }    
    
    @Test
    // prendi cf bambini da account
    public void getDatiIscrizioneTest() throws DBConnectionException, DomandaIscrizioneException, InserimentoDatiException    {
         assertNotNull(control.getDatiIscrizione("MarioB","MSCGNN75H43H654K"));
    }
    
    @Test (expected=InserimentoDatiException.class)
    // prendi cf bambini da account (con cf non valido)
    public void getDatiIscrizioneTest2() throws DBConnectionException, DomandaIscrizioneException, InserimentoDatiException    {
         control.getDatiIscrizione("MarioB","MSCGNN43H654K");
    }
   

}
