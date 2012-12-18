package atsilo.storage;

import atsilo.entity.Bambino;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atsilo.entity.Assenza;
import atsilo.entity.Bando;
import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.RispostaQuestionario;
import atsilo.entity.Servizio;
import atsilo.storage.DBBeans.Assegnazione;
import atsilo.util.AtsiloConstants;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBDomandaIscrizione.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, Luigi Lomasto, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

public class DBDomandaIscrizione extends DBBeans<DomandaIscrizione> {
    
    public DBDomandaIscrizione(Database db){
        super("domanda_iscrizione",db);
    }
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    /**
     * 
     * @return
     */
    private static List<String> creaChiave()
    {
        List<String> res=  Arrays.asList("id");
        
        return Collections.unmodifiableList(res);
    }
    /**
     * 
     * @return
     */
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        res.put("id","id");
        res.put("escluso","escluso");
        res.put("notaEsclusione","nota_esclusione");
        res.put("punteggio","punteggio");
        res.put("posizione","posizione");
        res.put("dataPresentazione","data_presentazione");
        res.put("statoDomanda", "stato_domanda");
        res.put("certificatoMalattie", "certificato_malattie");
        res.put("certificatoVaccinazioni", "certificato_vaccinazioni");
        res.put("certificatoPrivacy", "certificato_privacy");
        res.put("bambinoDisabile", "bambino_disabile");
        res.put("genitoreInvalido", "genitore_invalido");
        res.put("genitoreSolo", "genitore_solo");
        res.put("genitoreVedovo", "genitore_vedovo");
        res.put("genitoreNubile", "genitore_nubile");
        res.put("genitoreSeparato", "genitore_separato");
        res.put("figlioNonRiconosciuto", "figlio_non_riconosciuto");
        res.put("affidoEsclusivo", "affido_esclusivo");
        res.put("altriComponentiDisabili", "altri_componenti_disabili");
        res.put("condizioniCalcoloPunteggio", "condizioni_calcolo_punteggio");
        res.put("isee", "isee");
        res.put("stato_convalidazione", "stato_convalidazione");
        res.put("vaccinazioni", "vaccinazioni");
        res.put("malattieInfettive","malattie_infettive");
        
        
        
        return Collections.unmodifiableMap(res);
    }
    
    /**
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() {
        return MAPPINGS;
    }
    
    
    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {
        return CHIAVE;
    }
    
    
    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected DomandaIscrizione creaBean(ResultSet r) throws SQLException {
        Bambino b=new Bambino();
        Genitore g=new Genitore();
        Genitore gnr=new Genitore();
        Servizio s=new Servizio();
        String ge=r.getString("genitore");
        g.setCodiceFiscale(ge);
        String ba=r.getString("bambino");
        b.setCodiceFiscale(ba);
        int se=r.getInt("servizio");
        s.setId(se);
        String genonric=r.getString("cf_genitore_non_richiedente");
        gnr.setCodiceFiscale(genonric);
        DomandaIscrizione temp = new DomandaIscrizione();
        
        temp.setId(r.getInt("id"));
        temp.setNotaEsclusione(r.getString("nota_esclusione"));
        temp.setPosizione(r.getInt("posizione"));
        temp.setPunteggio(r.getInt("punteggio"));
        temp.setDataPresentazione(r.getDate("data_presentazione"));
        temp.setBambino(b);
        temp.setGenitore(g);
        temp.setGenitoreNonRichiedente(gnr);
        temp.setServizio(s);
        temp.setAffidoEsclusivo(r.getBoolean("affido_esclusivo"));
        temp.setAltriComponentiDisabili(r.getBoolean("altri_componenti_disabili"));
        temp.setBambinoDisabile(r.getBoolean("bambino_disabile"));
        temp.setCertificatoMalattie(r.getString("certificato_malattie"));
        temp.setCertificatoPrivacy(r.getString("certificato_privacy"));
        temp.setCondizioniCalcoloPunteggio(r.getString("condizioni_calcolo_punteggio"));
        temp.setFiglioNonRiconosciuto(r.getBoolean("figlio_non_riconosciuto"));
        temp.setGenitoreInvalido(r.getBoolean("genitore_invalido"));
        temp.setGenitoreNubile(r.getBoolean("genitore_nubile"));
        temp.setGenitoreSeparato(r.getBoolean("genitore_separato"));
        temp.setGenitoreSolo(r.getBoolean("genitore_solo"));
        temp.setGenitoreVedovo(r.getBoolean("genitore_vedovo"));
        temp.setIsee(r.getFloat("isee"));
        temp.setStato_convalidazione(r.getString("stato_convalidazione"));
        temp.setStatoDomanda(r.getString("stato_domanda"));
        temp.setCertificatoVaccinazioni(r.getString("certificato_vaccinazioni"));
        temp.setVaccinazioni(r.getString("vaccinazioni"));
        temp.setMalattieInfettive(r.getString("malattie_infettive"));
        
        
        return temp;
    }
    
    /**
     * ricerca l'id della domanda iscrizione di un bambino 
     * @param codiceFiscaleB è il codice fiscale del bambino per il quale viene cercata 
     * la domanda d'iscrizione,se è null si verifica un NULLPOINTEREXCEPTION
     * @return Domandaiscrizione appartenente al bambino richiesto oppure null se
     * non ha fatto domanda d'iscrizione
     * @throws SQLException se si verifica un errore di connessione con il database
     */
    
    public DomandaIscrizione ricercaDomandaDaBambino(String codiceFiscaleB) throws SQLException {
        
        DomandaIscrizione d=new DomandaIscrizione();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE bambino = ?");
        tabella.setParam(stmt, 1, "bambino", codiceFiscaleB);
        ResultSet r = stmt.executeQuery();
        
        DomandaIscrizione temp = new DomandaIscrizione();
        
        if(r.next()){
        Bambino b=new Bambino();
        Genitore g=new Genitore();
        Genitore gnr=new Genitore();
        Servizio s=new Servizio();
        String ge=r.getString("genitore");
        g.setCodiceFiscale(ge);
        String ba=r.getString("bambino");
        b.setCodiceFiscale(ba);
        int se=r.getInt("servizio");
        s.setId(se);
        String genonric=r.getString("cf_genitore_non_richiedente");
        gnr.setCodiceFiscale(genonric);
        
        temp.setId(r.getInt("id"));
        temp.setNotaEsclusione(r.getString("nota_esclusione"));

        temp.setPosizione(r.getInt("posizione"));
        temp.setPunteggio(r.getInt("punteggio"));
        temp.setDataPresentazione(r.getDate("data_presentazione"));
        temp.setBambino(b);
        temp.setGenitore(g);
        temp.setGenitoreNonRichiedente(gnr);
        temp.setServizio(s);
        temp.setAffidoEsclusivo(r.getBoolean("affido_esclusivo"));
        temp.setAltriComponentiDisabili(r.getBoolean("altri_componenti_disabili"));
        temp.setBambinoDisabile(r.getBoolean("bambino_disabile"));
        temp.setCertificatoMalattie(r.getString("certificato_malattie"));
        temp.setCertificatoPrivacy(r.getString("certificato_privacy"));
        temp.setCondizioniCalcoloPunteggio(r.getString("condizioni_calcolo_punteggio"));
        temp.setFiglioNonRiconosciuto(r.getBoolean("figlio_non_riconosciuto"));
        temp.setGenitoreInvalido(r.getBoolean("genitore_invalido"));
        temp.setGenitoreNubile(r.getBoolean("genitore_nubile"));
        temp.setGenitoreSeparato(r.getBoolean("genitore_separato"));
        temp.setGenitoreSolo(r.getBoolean("genitore_solo"));
        temp.setGenitoreVedovo(r.getBoolean("genitore_vedovo"));
        temp.setIsee(r.getFloat("isee"));
        temp.setStato_convalidazione(r.getString("stato_convalidazione"));
        temp.setStatoDomanda(r.getString("stato_domanda"));
        temp.setCertificatoVaccinazioni(r.getString("certificato_vaccinazioni"));
        temp.setVaccinazioni(r.getString("vaccinazioni"));
        temp.setMalattieInfettive(r.getString("malattie_infettive"));
        }
        r.close();
        return temp;
    }
    
    /**
     * ricerca le domande di iscrizione  di un genitore
     * @param codiceFiscaleG  è il codice fiscale del genitore per il quale 
     * vengono cercate le domande d'iscrizione
     * @return una lista di Domande di iscrizione appartenenti al genitore 
     * richiesto oppure una lista di iscrizioni vuota se il genitore non ha 
     * fatto domanda d'iscrizione
     * @throws SQLException se si verifica un errore di connessione con il database
     */
    public List<DomandaIscrizione> ricercaDomandaDaGenitore(String codiceFiscaleG) 
            throws SQLException {
       
        List<DomandaIscrizione> lista=new ArrayList<DomandaIscrizione>();
        
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE genitore = ?");
        tabella.setParam(stmt, 1, "genitore", codiceFiscaleG);
        ResultSet r = stmt.executeQuery();
        
        while(r.next()){
            
            DomandaIscrizione temp = new DomandaIscrizione();
            
            Bambino b=new Bambino();
            Genitore g=new Genitore();
            Genitore gnr = new Genitore();
            Servizio s=new Servizio();
            String ge=r.getString("genitore");g.setCodiceFiscale(ge);
            String ba=r.getString("bambino");b.setCodiceFiscale(ba);
            int se=r.getInt("servizio");s.setId(se);
            String genonric=r.getString("cf_genitore_non_richiedente");
            gnr.setCodiceFiscale(genonric);
            
            temp.setId(r.getInt("id"));
            temp.setNotaEsclusione(r.getString("nota_esclusione"));
            temp.setPosizione(r.getInt("posizione"));
            temp.setPunteggio(r.getInt("punteggio"));
            temp.setDataPresentazione(r.getDate("data_presentazione"));
            temp.setBambino(b);
            temp.setGenitore(g);
            temp.setGenitoreNonRichiedente(gnr);
            temp.setServizio(s);
            temp.setAffidoEsclusivo(r.getBoolean("affido_esclusivo"));
            temp.setAltriComponentiDisabili(r.getBoolean("altri_componenti_disabili"));
            temp.setBambinoDisabile(r.getBoolean("bambino_disabile"));
            temp.setCertificatoMalattie(r.getString("certificato_malattie"));
            temp.setCertificatoPrivacy(r.getString("certificato_privacy"));
            temp.setCondizioniCalcoloPunteggio(r.getString("condizioni_calcolo_punteggio"));
            temp.setFiglioNonRiconosciuto(r.getBoolean("figlio_non_riconosciuto"));
            temp.setGenitoreInvalido(r.getBoolean("genitore_invalido"));
            temp.setGenitoreNubile(r.getBoolean("genitore_nubile"));
            temp.setGenitoreSeparato(r.getBoolean("genitore_separato"));
            temp.setGenitoreSolo(r.getBoolean("genitore_solo"));
            temp.setGenitoreVedovo(r.getBoolean("genitore_vedovo"));
            temp.setIsee(r.getFloat("isee"));
            temp.setStato_convalidazione(r.getString("stato_convalidazione"));
            temp.setStatoDomanda(r.getString("stato_domanda"));
            temp.setCertificatoVaccinazioni(r.getString("certificato_vaccinazioni"));
            temp.setVaccinazioni(r.getString("vaccinazioni"));
            temp.setMalattieInfettive(r.getString("malattie_infettive"));
            lista.add(temp);
            
        }
     
        r.close();
        return lista;
    }
    
    /**
     * da rivedere
     * ricerca una domanda d'iscrizione per id 
     * @param id è il valore dell'identificativo da ricercare, può avere un qualsiasi valore appartenente all'intervallo degli interi int.
     * @return una domandaIscrizione che ha l'id ricercato oppure un oggetto vuoto se la domanda non esiste
     * @throws SQLException se si verifica un errore di connessione con il database.
     */
    public DomandaIscrizione ricercaDomandaDaId(int id) throws SQLException {
        DomandaIscrizione temp=new DomandaIscrizione();

        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE id = ?");
        tabella.setParam(stmt, 1, "id", id);
        ResultSet r= stmt.executeQuery();
        
        
        
        if(r.next()){
        
            Bambino b=new Bambino();
            Genitore g=new Genitore();
            Genitore gnr = new Genitore();
            Servizio s=new Servizio();
            String ge=r.getString("genitore");g.setCodiceFiscale(ge);
            String ba=r.getString("bambino");b.setCodiceFiscale(ba);
            int se=r.getInt("servizio");s.setId(se);
            String genonric=r.getString("cf_genitore_non_richiedente");
            gnr.setCodiceFiscale(genonric);
            
            temp.setId(r.getInt("id"));
            temp.setNotaEsclusione(r.getString("nota_esclusione"));
            temp.setPosizione(r.getInt("posizione"));
            temp.setPunteggio(r.getInt("punteggio"));
            temp.setDataPresentazione(r.getDate("data_presentazione"));
            temp.setBambino(b);
            temp.setGenitore(g);
            temp.setGenitoreNonRichiedente(gnr);
            temp.setServizio(s);
            temp.setAffidoEsclusivo(r.getBoolean("affido_esclusivo"));
            temp.setAltriComponentiDisabili(r.getBoolean("altri_componenti_disabili"));
            temp.setBambinoDisabile(r.getBoolean("bambino_disabile"));
            temp.setCertificatoMalattie(r.getString("certificato_malattie"));
            temp.setCertificatoPrivacy(r.getString("certificato_privacy"));
            temp.setCondizioniCalcoloPunteggio(r.getString("condizioni_calcolo_punteggio"));
            temp.setFiglioNonRiconosciuto(r.getBoolean("figlio_non_riconosciuto"));
            temp.setGenitoreInvalido(r.getBoolean("genitore_invalido"));
            temp.setGenitoreNubile(r.getBoolean("genitore_nubile"));
            temp.setGenitoreSeparato(r.getBoolean("genitore_separato"));
            temp.setGenitoreSolo(r.getBoolean("genitore_solo"));
            temp.setGenitoreVedovo(r.getBoolean("genitore_vedovo"));
            temp.setIsee(r.getFloat("isee"));
            temp.setStato_convalidazione(r.getString("stato_convalidazione"));
            temp.setStatoDomanda(r.getString("stato_domanda"));
            temp.setCertificatoVaccinazioni(r.getString("certificato_vaccinazioni"));
            temp.setVaccinazioni(r.getString("vaccinazioni"));
            temp.setMalattieInfettive(r.getString("malattie_infettive"));
        }
        else{
            r.close();
            return null;
        }
        r.close();
        return temp;
    }
    
    
    /**
     * ricerca una domanda iscrizione per data
     * @param da la data da ricercare nel database per trovare le domande d'iscrizione. deve avere un valore definito e non successivo alla data nella quale si effettua la richiesta, altrimenti la ricerca non ha risultato
     * @return una lista di domande aventi la stessa data oppure una lista vuota se la ricerca non produce risultato
     * @throws SQLException se c'è errore di connessione con il database
     */
   /* public List<DomandaIscrizione> ricercaDomandaPerData(Date da) throws SQLException{
        List<DomandaIscrizione> lista=new ArrayList<DomandaIscrizione>();
        DomandaIscrizione d=new DomandaIscrizione();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE data = ?");
        tabella.setParam(stmt, 1, "data", da);
        ResultSet res= stmt.executeQuery();
        for(DomandaIscrizione t : iteraResultSet(res))
            lista.add(t);
        
        res.close();
        return lista;
    }
    
    /**
     * ricerca una domanda iscrizione per punteggio
     * @param p il punteggio da ricercare nel database per trovare le domande d'iscrizione. deve avere un valore maggiore o uguale a 0 ovviamente perchè non esiste un punteggio negativo(la ricerca avviene ugualmente ma non produce risultati.)
     * @return una lista di domande aventi lo stesso punteggio  oppure una lista vuota se la ricerca non produce risultato
     * @throws SQLException se c'è errore di connessione con il database
     */
  /*  public List<DomandaIscrizione> ricercaDomandaPerPunteggio(int p) throws SQLException{
        List<DomandaIscrizione> lista=new ArrayList<DomandaIscrizione>();
        DomandaIscrizione d=new DomandaIscrizione();
        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + "WHERE punteggio = ?");
        tabella.setParam(stmt, 1, "punteggio", p);
        ResultSet res= stmt.executeQuery();
        for(DomandaIscrizione t : iteraResultSet(res))
            lista.add(t);
        
        res.close();
        return lista;
    }*/
    
    
    /**
     * riceve l'id di una domanda d'iscrizione e vede se la sua posizione rientra nella graduatoria
     * @param id è l'identificativo della domanda d'iscrizione
     * @return
     * @throws SQLException
     */
  /*  public String getValoreStatoIscrizione(int id) throws SQLException{
        
        
        DomandaIscrizione d=new DomandaIscrizione();
        d=ricercaDomandaDaId(id);
        
        DBBando b=new DBBando(db);
        Bando bando= new Bando();
        bando=b.cercaBandoAttivoPerData(d.getDataPresentazione());
        
        if(bando.getPostiDisponibili() > d.getPosizione())
            return "idoneo";
        else
            return "non idoneo";
    }
    // da implementare
    public boolean modificaCertificatiIscrizione(int id, boolean vaccinazioni, boolean malattie, boolean privacy) throws SQLException 
    {
        return true;
        
        
    }*/
    
    /**
     * Metodo che restituisce le domande senza punteggio assegnato
     * @return
     * @throws SQLException
     */
    public List<DomandaIscrizione> ricercaDomandeNonEscluseSenzaPunteggio() throws SQLException {
        ArrayList<DomandaIscrizione> toReturn = new ArrayList<DomandaIscrizione>();

        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE nota_esclusione IS NULL AND stato_convalidazione=?");
        tabella.setParam(stmt, 1, "stato_convalidazione", AtsiloConstants.STATO_DOMANDA_PRIMO_STEP);
        ResultSet r= stmt.executeQuery();
        
       while (r.next()){
            DomandaIscrizione temp=new DomandaIscrizione();
            Bambino b=new Bambino();
            Genitore g=new Genitore();
            Genitore gnr = new Genitore(); 
            Servizio s=new Servizio();
            String ge=r.getString("genitore");g.setCodiceFiscale(ge);
            String ba=r.getString("bambino");b.setCodiceFiscale(ba);
            int se=r.getInt("servizio");s.setId(se);
            String genonric=r.getString("cf_genitore_non_richiedente");
            gnr.setCodiceFiscale(genonric);
            
            temp.setId(r.getInt("id"));
            temp.setNotaEsclusione(r.getString("nota_esclusione"));
            temp.setPosizione(r.getInt("posizione"));
            temp.setPunteggio(r.getInt("punteggio"));
            temp.setDataPresentazione(r.getDate("data_presentazione"));
            temp.setBambino(b);
            temp.setGenitore(g);
            temp.setGenitoreNonRichiedente(gnr);
            temp.setServizio(s);
            temp.setAffidoEsclusivo(r.getBoolean("affido_esclusivo"));
            temp.setAltriComponentiDisabili(r.getBoolean("altri_componenti_disabili"));
            temp.setBambinoDisabile(r.getBoolean("bambino_disabile"));
            temp.setCertificatoMalattie(r.getString("certificato_malattie"));
            temp.setCertificatoPrivacy(r.getString("certificato_privacy"));
            temp.setCondizioniCalcoloPunteggio(r.getString("condizioni_calcolo_punteggio"));
            temp.setFiglioNonRiconosciuto(r.getBoolean("figlio_non_riconosciuto"));
            temp.setGenitoreInvalido(r.getBoolean("genitore_invalido"));
            temp.setGenitoreNubile(r.getBoolean("genitore_nubile"));
            temp.setGenitoreSeparato(r.getBoolean("genitore_separato"));
            temp.setGenitoreSolo(r.getBoolean("genitore_solo"));
            temp.setGenitoreVedovo(r.getBoolean("genitore_vedovo"));
            temp.setIsee(r.getFloat("isee"));
            temp.setStato_convalidazione(r.getString("stato_convalidazione"));
            temp.setStatoDomanda(r.getString("stato_domanda"));
            temp.setCertificatoVaccinazioni(r.getString("certificato_vaccinazioni"));
            temp.setVaccinazioni(r.getString("vaccinazioni"));
            temp.setMalattieInfettive(r.getString("malattie_infettive"));
            toReturn.add(temp);
        } 
        r.close();
        return toReturn;
    }
    
    /**
     * Metodo che restituisce le domande senza punteggio assegnato
     * @return
     * @throws SQLException
     */
    public List<DomandaIscrizione> ricercaDomandeCompletateDaConvalidare() throws SQLException {
        ArrayList<DomandaIscrizione> toReturn = new ArrayList<DomandaIscrizione>();

        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE stato_convalidazione=?");
        stmt.setString(1, AtsiloConstants.STATO_DOMANDA_PRESENTAZIONE_DOCUMENTI);
        ResultSet r= stmt.executeQuery();
        
       while (r.next()){
            DomandaIscrizione temp=new DomandaIscrizione();
            Bambino b=new Bambino();
            Genitore g=new Genitore();
            Genitore gnr = new Genitore(); 
            Servizio s=new Servizio();
            String ge=r.getString("genitore");g.setCodiceFiscale(ge);
            String ba=r.getString("bambino");b.setCodiceFiscale(ba);
            int se=r.getInt("servizio");s.setId(se);
            String genonric=r.getString("cf_genitore_non_richiedente");
            gnr.setCodiceFiscale(genonric);
            
            temp.setId(r.getInt("id"));
            temp.setNotaEsclusione(r.getString("nota_esclusione"));
            temp.setPosizione(r.getInt("posizione"));
            temp.setPunteggio(r.getInt("punteggio"));
            temp.setDataPresentazione(r.getDate("data_presentazione"));
            temp.setBambino(b);
            temp.setGenitore(g);
            temp.setGenitoreNonRichiedente(gnr);
            temp.setServizio(s);
            temp.setAffidoEsclusivo(r.getBoolean("affido_esclusivo"));
            temp.setAltriComponentiDisabili(r.getBoolean("altri_componenti_disabili"));
            temp.setBambinoDisabile(r.getBoolean("bambino_disabile"));
            temp.setCertificatoMalattie(r.getString("certificato_malattie"));
            temp.setCertificatoPrivacy(r.getString("certificato_privacy"));
            temp.setCondizioniCalcoloPunteggio(r.getString("condizioni_calcolo_punteggio"));
            temp.setFiglioNonRiconosciuto(r.getBoolean("figlio_non_riconosciuto"));
            temp.setGenitoreInvalido(r.getBoolean("genitore_invalido"));
            temp.setGenitoreNubile(r.getBoolean("genitore_nubile"));
            temp.setGenitoreSeparato(r.getBoolean("genitore_separato"));
            temp.setGenitoreSolo(r.getBoolean("genitore_solo"));
            temp.setGenitoreVedovo(r.getBoolean("genitore_vedovo"));
            temp.setIsee(r.getFloat("isee"));
            temp.setStato_convalidazione(r.getString("stato_convalidazione"));
            temp.setStatoDomanda(r.getString("stato_domanda"));
            temp.setCertificatoVaccinazioni(r.getString("certificato_vaccinazioni"));
            temp.setVaccinazioni(r.getString("vaccinazioni"));
            temp.setMalattieInfettive(r.getString("malattie_infettive"));
            toReturn.add(temp);
        } 
        r.close();
        return toReturn;
    }
    
    public List<DomandaIscrizione> ricercaDomandeConPunteggioInIntervalloDiConsegna(String inizio, String fine) throws SQLException {
        ArrayList<DomandaIscrizione> toReturn = new ArrayList<DomandaIscrizione>();

        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE nota_esclusione IS NULL ORDER BY punteggio DESC");
        ResultSet r= stmt.executeQuery();
        String[] ggmmaa_inizio = inizio.split("-");
        String[] ggmmaa_fine = fine.split("-");
        Date data_inizio = new Date(Integer.parseInt(ggmmaa_inizio[0])-1900,
                Integer.parseInt(ggmmaa_inizio[1])-1,
                Integer.parseInt( ggmmaa_inizio[2]));
        Date data_fine = new Date(Integer.parseInt(ggmmaa_fine[0])-1900,Integer.parseInt(ggmmaa_fine[1])-1,Integer.parseInt(ggmmaa_fine[2]));
       while (r.next()){
            DomandaIscrizione temp=new DomandaIscrizione();
            Bambino b=new Bambino();
            Genitore g=new Genitore();
            Genitore gnr = new Genitore(); 
            Servizio s=new Servizio();
            String ge=r.getString("genitore");g.setCodiceFiscale(ge);
            String ba=r.getString("bambino");b.setCodiceFiscale(ba);
            int se=r.getInt("servizio");s.setId(se);
            String genonric=r.getString("cf_genitore_non_richiedente");
            gnr.setCodiceFiscale(genonric);
            
            temp.setId(r.getInt("id"));
            temp.setNotaEsclusione(r.getString("nota_esclusione"));
            temp.setPosizione(r.getInt("posizione"));
            temp.setPunteggio(r.getInt("punteggio"));
            temp.setDataPresentazione(r.getDate("data_presentazione"));
            temp.setBambino(b);
            temp.setGenitore(g);
            temp.setGenitoreNonRichiedente(gnr);
            temp.setServizio(s);
            temp.setAffidoEsclusivo(r.getBoolean("affido_esclusivo"));
            temp.setAltriComponentiDisabili(r.getBoolean("altri_componenti_disabili"));
            temp.setBambinoDisabile(r.getBoolean("bambino_disabile"));
            temp.setCertificatoMalattie(r.getString("certificato_malattie"));
            temp.setCertificatoPrivacy(r.getString("certificato_privacy"));
            temp.setCondizioniCalcoloPunteggio(r.getString("condizioni_calcolo_punteggio"));
            temp.setFiglioNonRiconosciuto(r.getBoolean("figlio_non_riconosciuto"));
            temp.setGenitoreInvalido(r.getBoolean("genitore_invalido"));
            temp.setGenitoreNubile(r.getBoolean("genitore_nubile"));
            temp.setGenitoreSeparato(r.getBoolean("genitore_separato"));
            temp.setGenitoreSolo(r.getBoolean("genitore_solo"));
            temp.setGenitoreVedovo(r.getBoolean("genitore_vedovo"));
            temp.setIsee(r.getFloat("isee"));
            temp.setStato_convalidazione(r.getString("stato_convalidazione"));
            temp.setStatoDomanda(r.getString("stato_domanda"));
            temp.setCertificatoVaccinazioni(r.getString("certificato_vaccinazioni"));
            temp.setVaccinazioni(r.getString("vaccinazioni"));
            temp.setMalattieInfettive(r.getString("malattie_infettive"));
            if(temp.getDataPresentazione().after(data_inizio) && temp.getDataPresentazione().before(data_fine))
            {
                toReturn.add(temp);
            }
        } 
        r.close();
        return toReturn;
    }
    
    public List<DomandaIscrizione> ricercaDomandeEscluseInIntervalloDiConsegna(String inizio, String fine) throws SQLException {
        ArrayList<DomandaIscrizione> toReturn = new ArrayList<DomandaIscrizione>();

        PreparedStatement stmt = tabella.prepareStatement(
                "SELECT * FROM " + tabella.getNomeTabella() + " WHERE nota_esclusione IS NOT NULL");
        ResultSet r= stmt.executeQuery();
        String[] ggmmaa_inizio = inizio.split("-");
        String[] ggmmaa_fine = fine.split("-");
        Date data_inizio = new Date(Integer.parseInt(ggmmaa_inizio[0])-1900,
                Integer.parseInt(ggmmaa_inizio[1])-1,
                Integer.parseInt( ggmmaa_inizio[2]));
        Date data_fine = new Date(Integer.parseInt(ggmmaa_fine[0])-1900,Integer.parseInt(ggmmaa_fine[1])-1,Integer.parseInt(ggmmaa_fine[2]));
       while (r.next()){
            DomandaIscrizione temp=new DomandaIscrizione();
            Bambino b=new Bambino();
            Genitore g=new Genitore();
            Genitore gnr = new Genitore(); 
            Servizio s=new Servizio();
            String ge=r.getString("genitore");g.setCodiceFiscale(ge);
            String ba=r.getString("bambino");b.setCodiceFiscale(ba);
            int se=r.getInt("servizio");s.setId(se);
            String genonric=r.getString("cf_genitore_non_richiedente");
            gnr.setCodiceFiscale(genonric);
            
            temp.setId(r.getInt("id"));
            temp.setNotaEsclusione(r.getString("nota_esclusione"));
            temp.setPosizione(r.getInt("posizione"));
            temp.setPunteggio(r.getInt("punteggio"));
            temp.setDataPresentazione(r.getDate("data_presentazione"));
            temp.setBambino(b);
            temp.setGenitore(g);
            temp.setGenitoreNonRichiedente(gnr);
            temp.setServizio(s);
            temp.setAffidoEsclusivo(r.getBoolean("affido_esclusivo"));
            temp.setAltriComponentiDisabili(r.getBoolean("altri_componenti_disabili"));
            temp.setBambinoDisabile(r.getBoolean("bambino_disabile"));
            temp.setCertificatoMalattie(r.getString("certificato_malattie"));
            temp.setCertificatoPrivacy(r.getString("certificato_privacy"));
            temp.setCondizioniCalcoloPunteggio(r.getString("condizioni_calcolo_punteggio"));
            temp.setFiglioNonRiconosciuto(r.getBoolean("figlio_non_riconosciuto"));
            temp.setGenitoreInvalido(r.getBoolean("genitore_invalido"));
            temp.setGenitoreNubile(r.getBoolean("genitore_nubile"));
            temp.setGenitoreSeparato(r.getBoolean("genitore_separato"));
            temp.setGenitoreSolo(r.getBoolean("genitore_solo"));
            temp.setGenitoreVedovo(r.getBoolean("genitore_vedovo"));
            temp.setIsee(r.getFloat("isee"));
            temp.setStato_convalidazione(r.getString("stato_convalidazione"));
            temp.setStatoDomanda(r.getString("stato_domanda"));
            temp.setCertificatoVaccinazioni(r.getString("certificato_vaccinazioni"));
            temp.setVaccinazioni(r.getString("vaccinazioni"));
            temp.setMalattieInfettive(r.getString("malattie_infettive"));
            if(temp.getDataPresentazione().after(data_inizio) && temp.getDataPresentazione().before(data_fine))
            {
                toReturn.add(temp);
            }
        } 
        r.close();
        return toReturn;
    }
    
    protected Assegnazione[] creaAssegnazioni(DomandaIscrizione bean) {
       
        Assegnazione DBDomandaIscrizione_assegnazione = new Assegnazione("servizio",bean.getServizio().getId());
        Assegnazione DBDomandaIscrizione_assegnazione1 = new Assegnazione("genitore",bean.getGenitore().getCodiceFiscale());
        Assegnazione DBDomandaIscrizione_assegnazione2 = new Assegnazione("bambino",bean.getBambino().getCodiceFiscale());
        Assegnazione DBDomandaIscrizione_assegnazione3 = new Assegnazione("cf_genitore_non_richiedente",bean.getGenitoreNonRichiedente().getCodiceFiscale());
        
        Assegnazione[] DBAssign = new Assegnazione[4];
        DBAssign[0]=DBDomandaIscrizione_assegnazione;
        DBAssign[1]=DBDomandaIscrizione_assegnazione1;
        DBAssign[2]=DBDomandaIscrizione_assegnazione2;
        DBAssign[3]=DBDomandaIscrizione_assegnazione3;
        return DBAssign;
    }
    
}