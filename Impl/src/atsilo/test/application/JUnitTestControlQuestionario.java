/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: JUnitTestControlQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio, 15/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Logger;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import atsilo.application.ControlQuestionario;
import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;
import atsilo.exception.DBConnectionException;
import atsilo.exception.QuestionarioException;
import atsilo.storage.Database;

/**
 * Classe JUnitTestControlQuestionario
 * <Descrizione classe>
 * 
 * @author Antonio
 * 
 */
public class JUnitTestControlQuestionario {
    
    
    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
       if(! db.apriConnessione())
           LOG.info("connessione al db fallita");
           
    }
    
    
    /**
     * @throws java.lang.Exception
     */
    @After
    public void tearDown() throws Exception {
        db.chiudiConnessione();
    }
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#inserisciQuestionario(atsilo.entity.Questionario)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
    //@Test  //OK
    public void testInserisciQuestionario() throws DBConnectionException, QuestionarioException, SQLException {
      
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2012, 11, 11);
        Date dataInI= new Date(dataIn.getTimeInMillis());
        Date dataFini= new Date(dataFin.getTimeInMillis());

        Questionario questionario = new Questionario("Controllo qualita", null, "Qualita",25,  dataInI, dataFini);
        
        control.inserisciQuestionario(questionario);
        Questionario temp = control.getQuestionario(25);
        
        assertEquals(25, temp.getId());
    }
    
    
    
    
    
    
    /**Creo un nuovo questionario, lo inserisco nel DB, lo elimino
     *  dopodichè cerco di caricarlo. Se il caricamento fallisce allora è stato 
     *  eliminato correttamente.
     *   
     * Test method for {@link atsilo.application.ControlQuestionario#eliminaQuestionario(int)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
    // @Test // OK 
    public void testEliminaQuestionario() throws DBConnectionException, QuestionarioException, SQLException {
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2012, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        
        Questionario questionario = new Questionario("questionario 51", null, "Numero51",51,  dataI, dataF);
        control.inserisciQuestionario(questionario);
        
        boolean nonPresente = false;
        control.eliminaQuestionario(51);
        
        Questionario q = control.getQuestionario(51);
        if(q==null)
            nonPresente = true;
        
        assertTrue(nonPresente);
       
    }
    
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#isEditable(atsilo.entity.Questionario)}.
     */
    //@Test // OK
    public void testIsEditableTrue() {
        
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2013, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        Questionario questionario = new Questionario("questionario 51", null, "Numero51",51,  dataI, dataF);
        
       assertTrue( control.isEditable(questionario));
        
    }
    
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#isEditable(atsilo.entity.Questionario)}.
     */
    //@Test  // NO
    public void testIsEditableFalse() {
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2011, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2012, 5, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        Questionario questionario = new Questionario("questionario 51", null, "Numero51",51,  dataI, dataF);
        
       assertFalse( control.isEditable(questionario));
        
    }
    
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#modificaQuestionario(int, atsilo.entity.Questionario)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
   // @Test // OK
    public void testModificaQuestionario() throws DBConnectionException, QuestionarioException, SQLException {
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2012, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        Questionario questionario = new Questionario("questionario 84", null, "Numero84",84,  dataI, dataF);
        
        control.inserisciQuestionario(questionario);
        
        Questionario toSostitute = questionario;
        toSostitute.setDescrizione("questionario sostituito");
        toSostitute.setFlag_rinuncia("si");
        toSostitute.setNome("sostituito");
        
        control.modificaQuestionario(84, toSostitute);
        
        Questionario sostituito = control.getQuestionario(84);
        
        assertEquals("sostituito", sostituito.getNome());
        
    }
    
    
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#spostaDataInizio(int, java.sql.Date)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
    //@Test  //OK
    public void testSpostaDataInizio() throws DBConnectionException, QuestionarioException, SQLException {
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2012, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataNuova= new Date(dataFin.getTimeInMillis());        
        
        Questionario questionario = new Questionario("questionario 91", null, "Numero91",91,  dataI, null);
        
        control.inserisciQuestionario(questionario);
        control.spostaDataInizio(91, dataNuova);
        Questionario q = control.getQuestionario(91);
        
        assertEquals(dataNuova.toString(), q.getPeriodo_inizio().toString());
    }
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#spostaDataFine(int, java.sql.Date)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
    //@Test // OK
    public void testSpostaDataFine() throws DBConnectionException, QuestionarioException, SQLException {

        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2012, 11, 11);
        Date dataNuova= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        
        
        Questionario questionario = new Questionario("questionario 97", null, "Numero97",97,  null, dataF);
        
        control.inserisciQuestionario(questionario);
        control.spostaDataFine(97, dataNuova);
        Questionario q = control.getQuestionario(97);
        
        assertEquals(dataNuova.toString(), q.getPeriodo_fine().toString());
        
    }
    
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#ricercaQuestionario(java.lang.String)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     */
    //@Test  //OK
    public void testRicercaQuestionario() throws DBConnectionException, QuestionarioException {
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2012, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        
        Questionario questionario = new Questionario("Controllo qualita 2012", null, "Qualita",26,  dataI, dataF);
        Questionario questionario1 = new Questionario("Controllo qualita20122", null, "Qualita",24,  dataI, dataF);
        
        control.inserisciQuestionario(questionario);
        control.inserisciQuestionario(questionario1);
        
        List<Questionario> Q = control.ricercaQuestionario("Qualita");
        
        assertEquals(24, Q.get(0).getId());
        assertEquals(26, Q.get(1).getId());
    }
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#compilaQuestionario(int, java.util.List, java.lang.String)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
    @Test //OK
    public void testCompilaQuestionario() throws DBConnectionException, QuestionarioException, SQLException {
        
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2012, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        
        Questionario questionario = new Questionario("Controllo compilazione", null, "Compilazione",103,  dataI, dataF);
       
        DomandaQuestionario d = new DomandaQuestionario(51,103,"anni?",null);
        CampoDomandaQuestionario c1= new CampoDomandaQuestionario("", "21", "21",51);
        CampoDomandaQuestionario c2= new CampoDomandaQuestionario("", "22", "22",51);  
        List<CampoDomandaQuestionario> campi = new ArrayList<CampoDomandaQuestionario>();
        campi.add(c1);
        campi.add(c2);
        d.setCampi(campi);
        
        DomandaQuestionario d1 = new DomandaQuestionario(52,103,"abiti a?",null);
        CampoDomandaQuestionario c3= new CampoDomandaQuestionario("", "pompei", "pompei",52);
        CampoDomandaQuestionario c4= new CampoDomandaQuestionario("", "salerno", "salerno",52);  
        List<CampoDomandaQuestionario> campi1 = new ArrayList<CampoDomandaQuestionario>();
        campi1.add(c3);
        campi1.add(c4);
        d1.setCampi(campi1);
        
                
        questionario.aggiungiDomanda(d);
        questionario.aggiungiDomanda(d1);
        
        RispostaQuestionario r = new RispostaQuestionario("21",51,"CVLMRA69A23B333C");
        RispostaQuestionario r1 = new RispostaQuestionario("pompei",52,"CVLMRA69A23B333C");
        List<RispostaQuestionario> risposte = new ArrayList<RispostaQuestionario>();
        risposte.add(r);
        risposte.add(r1);
        
        
        control.inserisciQuestionario(questionario);
        control.compilaQuestionario(103, risposte, "CVLMRA69A23B333C");
        
        Questionario q = control.caricaQuestionarioDaCompilare(103, "CVLMRA69A23B333C");
        
        RispostaQuestionario risp = q.getRispostePrecaricate().get(0);
      /*  System.out.println(risp);
        RispostaQuestionario risp1 = q.getRispostePrecaricate().get(1);
        System.out.println(risp1);
        */
        assertEquals("21", risp.getValore());
        
    }
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#getQuestionariDaCompilare(java.lang.String)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     */
   // @Test //NO
    public void testGetQuestionariDaCompilare() throws DBConnectionException, QuestionarioException {
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2012, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        
        Questionario q1 = new Questionario("Controllo compilazione!!", null, "Compilazione",110,  dataI, dataF);
        Questionario q2 = new Questionario("Controllo compilazione??", null, "Compilazione",111,  dataI, dataF);

        control.inserisciQuestionario(q1);
        control.inserisciQuestionario(q2);
        
        List<RispostaQuestionario> R = new ArrayList<RispostaQuestionario>();
        R.add(new RispostaQuestionario());
        
        control.compilaQuestionario(110, R, "CVLMRA69A23B333C");
        
        //il genitore ha compilato uno dei due questionari inseriti
        //il test va bene se getQuestionari da compilare mi restituisce l'altro questionario
        
        List<Questionario> Q = control.getQuestionariDaCompilare("CVLMRA69A23B333C");
        
        Questionario test = Q.get(0);
        assertEquals(111,test.getId());
        
    }
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#caricaQuestionarioDaCompilare(int, java.lang.String)}.
     */
   // @Test
    public void testCaricaQuestionarioDaCompilare() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#inserisciDomanda(int, atsilo.entity.DomandaQuestionario)}.
     */
   // @Test
    public void testInserisciDomanda() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#eliminaDomanda(int)}.
     */
   // @Test
    public void testEliminaDomanda() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#modificaDomanda(int, atsilo.entity.DomandaQuestionario)}.
     */
    //@Test
    public void testModificaDomanda() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#getStatistische(int)}.
     */
    //@Test
    public void testGetStatistische() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#getAllQuestionari()}.
     */
   // @Test
    public void testGetAllQuestionari() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#getIstance()}.
     */
    //@Test
    public void testGetIstance() {
        fail("Not yet implemented");
    }
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#getQuestionario(int)}.
     */
   // @Test
    public void testGetQuestionario() {
        fail("Not yet implemented");
    }
    
    Database db = new Database();   //Logger
    private static final Logger LOG = Logger.getLogger(JUnitTestControlQuestionario.class.getName());
    ControlQuestionario control = ControlQuestionario.getIstance();

    
}
