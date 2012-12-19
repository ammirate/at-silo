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
import atsilo.entity.StatisticheQuestionario;
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
    @Test  //OK
    public void testInserisciQuestionario() throws DBConnectionException, QuestionarioException, SQLException {
      
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2012, 11, 11);
        Date dataInI= new Date(dataIn.getTimeInMillis());
        Date dataFini= new Date(dataFin.getTimeInMillis());

        Questionario questionario = new Questionario("Controllo qualita", null, "Qualita",  dataInI, dataFini);
        
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
   // @Test // OK
    public void testIsEditableTrue() {
        
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2011, 1, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2011, 11, 30);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        Questionario questionario = new Questionario("questionario 51", null, "Numero51",51,  dataI, dataF);
        
       assertTrue( control.isEditable(questionario));
        
    }
    
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#isEditable(atsilo.entity.Questionario)}.
     */
   // @Test  // OK
    public void testIsEditableFalse() {
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2013, 5, 11);
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
  //  @Test  //OK
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
   // @Test // OK
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
  //  @Test  //OK
    public void testRicercaQuestionario() throws DBConnectionException, QuestionarioException {
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2012, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        
        Questionario questionario = new Questionario("Controllo per nome strano 2011", null, "asdrubale",26,  dataI, dataF);
        
        control.inserisciQuestionario(questionario);
        
        List<Questionario> Q = control.ricercaQuestionario("asdrubale");
        
        boolean trovato = false;
        for(Questionario q : Q)
            if(q.getNome().equalsIgnoreCase("asdrubale"))
                trovato = true;
        
        assertTrue(trovato);
        
    }
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#compilaQuestionario(int, java.util.List, java.lang.String)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
  //  @Test //OK
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
   // @Test   //OK
    public void testGetQuestionariDaCompilare() throws DBConnectionException, QuestionarioException {
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2013, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        
        Questionario q1 = new Questionario("Controllo compilazione!!", null, "Compilazione",110,  dataI, dataF);
        Questionario q2 = new Questionario("Controllo compilazione??", null, "Compilazione",111,  dataI, dataF);

        control.inserisciQuestionario(q1);
        control.inserisciQuestionario(q2);
        
        List<RispostaQuestionario> R = new ArrayList<RispostaQuestionario>();
        R.add(new RispostaQuestionario());
        
        control.compilaQuestionario(110, R, "VLLLRU83A24T928B");
        
        //il genitore ha compilato uno dei due questionari inseriti
        //il test va bene se getQuestionari da compilare mi restituisce l'altro questionario
        
        List<Questionario> Q = control.getQuestionariDaCompilare("VLLLRU83A24T928B");
        
        boolean trovato = false;
        
        for(Questionario q : Q)
            if(q.getId()==111)
                trovato = true;
        
        assertTrue(trovato);
        
    }
    

    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#inserisciDomanda(int, atsilo.entity.DomandaQuestionario)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
  //  @Test //OK
    public void testInserisciDomanda() throws DBConnectionException, QuestionarioException, SQLException {
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2013, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        
        Questionario q = new Questionario("Controllo inserimento domanda", null, "ControlloDomanda",127,  dataI, dataF);
      
        DomandaQuestionario d = new DomandaQuestionario(87,127,"che ore sono?", null);
        CampoDomandaQuestionario c1 = new CampoDomandaQuestionario("radio", "è presto", "17.00", 87);
        CampoDomandaQuestionario c2 = new CampoDomandaQuestionario("radio", "non tanto presto", "20.00", 87);
        CampoDomandaQuestionario c3= new CampoDomandaQuestionario("radio", "è tardi", "23.00", 87);
        d.aggiungiCampo(c1);
        d.aggiungiCampo(c2);
        d.aggiungiCampo(c3);
        
        control.inserisciQuestionario(q);
        control.inserisciDomanda(127, d);
        
        List<DomandaQuestionario> domande = control.caricaQuestionarioDaCompilare(127, "CVLMRA69A23B333C").getDomande();
        
        DomandaQuestionario test = domande.get(0);
        assertEquals(d.toString(), test.toString());
        assertEquals(c1.toString(), test.getCampi().get(0).toString());
        assertEquals(c2.toString(), test.getCampi().get(1).toString());
        assertEquals(c3.toString(), test.getCampi().get(2).toString());
        
    }
    
    
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#eliminaDomanda(int)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
  //  @Test  //OK
    public void testEliminaDomanda() throws DBConnectionException, QuestionarioException, SQLException {
        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2013, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        
        Questionario q = new Questionario("Controllo eliminazione domanda", null, "ControlloElDomanda",132,  dataI, dataF);
      
        DomandaQuestionario dom1 = new DomandaQuestionario(200,132,"funziona??", null);
        dom1.aggiungiCampo(new CampoDomandaQuestionario("radio", "si", "si", 200));
        dom1.aggiungiCampo(new CampoDomandaQuestionario("radio", "no", "no", 200));
        
        DomandaQuestionario dom2 = new DomandaQuestionario(201,132,"funzionerà??", null);
        dom1.aggiungiCampo(new CampoDomandaQuestionario("radio", "si", "si", 201));
        dom1.aggiungiCampo(new CampoDomandaQuestionario("radio", "no", "no", 201));
        q.aggiungiDomanda(dom1);
        q.aggiungiDomanda(dom2);
        
        control.inserisciQuestionario(q);
        
        control.eliminaDomanda(201);
        
        List<DomandaQuestionario> D = control.caricaQuestionarioDaCompilare(132, "CVLMRA69A23B333C").getDomande();
        assertEquals(1, D.size() );
    }
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#modificaDomanda(int, atsilo.entity.DomandaQuestionario)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
  //  @Test  //OK
    public void testModificaDomanda() throws DBConnectionException, QuestionarioException, SQLException {

        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2013, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        
        Questionario q = new Questionario("Controllo modifica domanda", null, "ControlloMoDomanda",153,  dataI, dataF);
        
        DomandaQuestionario d1 = new DomandaQuestionario(61,153,"domanda sabato sera",null);
        d1.aggiungiCampo(new CampoDomandaQuestionario("radio","non lo so", "boh",61));
        d1.aggiungiCampo(new CampoDomandaQuestionario("radio","forse", "forse",61));
        
        DomandaQuestionario d222 = new DomandaQuestionario(62,153,"domanda domenica sera",null);
        d222.aggiungiCampo(new CampoDomandaQuestionario("radio","non lo so", "boh",62));
        d222.aggiungiCampo(new CampoDomandaQuestionario("radio","forse", "forse",62));
   
        q.aggiungiDomanda(d1);
        
        control.inserisciQuestionario(q);
        control.modificaDomanda(61, d222);
        
        List<DomandaQuestionario> D = control.caricaQuestionarioDaCompilare(153, "CVLMRA69A23B333C").getDomande();    
        DomandaQuestionario test = D.get(0);
        
        assertEquals(62, test.getId());
    }
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#getStatistische(int)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
   // @Test
    public void testGetStatistische() throws DBConnectionException, QuestionarioException, SQLException {
        
        RispostaQuestionario r1 = new RispostaQuestionario("lattante",1,"CVLMRA69A23B333C");
        RispostaQuestionario r2 = new RispostaQuestionario("full-time",2,"CVLMRA69A23B333C");
        List<RispostaQuestionario> primo = new ArrayList<RispostaQuestionario>();
        primo.add(r1);
        primo.add(r2);
        
        RispostaQuestionario r3 = new RispostaQuestionario("lattante",1,"DBNGPP69A23B222C");
        RispostaQuestionario r4 = new RispostaQuestionario("full-time",2,"DBNGPP69A23B222C");
        List<RispostaQuestionario> secondo = new ArrayList<RispostaQuestionario>();
        secondo.add(r3);
        secondo.add(r4);
        
        RispostaQuestionario r5 = new RispostaQuestionario("divezzi",1,"DCSGVN74A23B224X");
        RispostaQuestionario r6 = new RispostaQuestionario("Part-time con pranzo",2,"DCSGVN74A23B224X");
        List<RispostaQuestionario> terzo = new ArrayList<RispostaQuestionario>();
        terzo.add(r5);
        terzo.add(r6);
        
                
        control.compilaQuestionario(1, primo, "CVLMRA69A23B333C");
        control.compilaQuestionario(1, secondo, "DBNGPP69A23B222C");
        control.compilaQuestionario(1, terzo, "DCSGVN74A23B224X");
        
        StatisticheQuestionario S = control.getStatistische(1);
        
        Questionario q1 = control.caricaQuestionarioDaCompilare(1, "CVLMRA69A23B333C");
        List<DomandaQuestionario> domande = q1.getDomande();
        
        /*  stampa le statistiche
        for(DomandaQuestionario d : domande1){
            System.out.println("\n-- "+d.getDescrizione());
            List<CampoDomandaQuestionario> campi = d.getCampi();
            for(CampoDomandaQuestionario c : campi){
                float perc =(S.getPercentualiFromCampo(d.getId(), c.getId()) *100)/S.getNumeroComp();
                System.out.println(c.getDescrizione()+": "+perc+"%");
            }//end for 
        }//end for esterno
        */
        
        DomandaQuestionario d = domande.get(0);
        CampoDomandaQuestionario c = d.getCampi().get(0);
        float perc =( S.getPercentualiFromCampo(d.getId(), c.getId()) *100)/S.getNumeroComp();
        
        //assertEquals su due double è deprecato...
        boolean ok = false;
        if(perc == 66.0)
            ok = true;
        assertTrue(ok);
    }
    
    
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#getAllQuestionari()}.
     * @throws DBConnectionException 
     */
   // @Test //OK
    public void testGetAllQuestionari() throws DBConnectionException {
        List<Questionario> Q = new ArrayList<Questionario>();
        Q = control.getAllQuestionari();
        
        assertTrue(!Q.isEmpty());
    }
    
    
    
    /**
     * Test method for {@link atsilo.application.ControlQuestionario#getQuestionario(int)}.
     * @throws QuestionarioException 
     * @throws DBConnectionException 
     * @throws SQLException 
     */
  // @Test  //OK
    public void testGetQuestionario() throws DBConnectionException, QuestionarioException, SQLException {

        Calendar dataIn = Calendar.getInstance();
        dataIn.set(2012, 11, 1);
        Calendar dataFin = Calendar.getInstance();
        dataFin.set(2013, 11, 11);
        Date dataI= new Date(dataIn.getTimeInMillis());
        Date dataF= new Date(dataFin.getTimeInMillis());
        
        Questionario questionario = new Questionario("QuestionarioAmbarapaccicciccoccò", null, "Mensa",598,  dataI, dataF);
        
        control.inserisciQuestionario(questionario);
        
        Questionario Q = control.getQuestionario(598);
        
        assertEquals(questionario.getNome(), Q.getNome());
        
    }
    
    Database db = new Database();   
    private static final Logger LOG = Logger.getLogger(JUnitTestControlQuestionario.class.getName());
    ControlQuestionario control = ControlQuestionario.getIstance();

    
}
