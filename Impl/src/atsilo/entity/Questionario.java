package atsilo.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Questionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class Questionario {
 
    private Date periodo_fine;
    private String descrizione;
    private String flag_rinuncia;
    private String nome;
    private int id;
    private Date periodo_inizio;
    private List<Genitore> listaGenitori;
    private List<DomandaQuestionario> domande;
    private List<RispostaQuestionario> rispostePrecaricate;
    
    /**
     * Costruttore vuoto
     */
    public Questionario() {

        this.listaGenitori = new ArrayList<Genitore>();
        this.domande = new ArrayList<DomandaQuestionario>();
        this.rispostePrecaricate = new ArrayList<RispostaQuestionario>();
    }
    
    
    
    
    /**
     * @param periodo_fine il paramentro è fissato
     * @param descrizione il paramentro è fissato
     * @param flag_rinuncia il paramentro è fissato
     * @param nome il paramentro è fissato
     * @param periodo_inizio il paramentro è fissato
     * @param pathname il paramentro è fissato
     */
    public Questionario( String descrizione,String flag_rinuncia, 
            String nome,  Date periodo_inizio,Date periodo_fine) {
        super();
        this.periodo_fine = periodo_fine;
        this.descrizione = descrizione;
        this.flag_rinuncia = flag_rinuncia;
        this.nome = nome;
      //  this.id = id;
        this.periodo_inizio = periodo_inizio;
        this.listaGenitori = new ArrayList<Genitore>();
        this.domande = new ArrayList<DomandaQuestionario>();
        

        this.listaGenitori = new ArrayList<Genitore>();
        this.domande = new ArrayList<DomandaQuestionario>();
        this.rispostePrecaricate = new ArrayList<RispostaQuestionario>();
    }   
    
    
    
    
    
    /**Costruttore con id
     * @param periodo_fine il paramentro è fissato
     * @param descrizione il paramentro è fissato
     * @param flag_rinuncia il paramentro è fissato
     * @param nome il paramentro è fissato
     * @param id il paramentro è fissato
     * @param periodo_inizio il paramentro è fissato
     * @param pathname il paramentro è fissato
     */
    public Questionario( String descrizione,String flag_rinuncia, 
            String nome, int id,  Date periodo_inizio,Date periodo_fine) {
        super();
        this.periodo_fine = periodo_fine;
        this.descrizione = descrizione;
        this.flag_rinuncia = flag_rinuncia;
        this.nome = nome;
        this.id = id;
        this.periodo_inizio = periodo_inizio;
        this.listaGenitori = new ArrayList<Genitore>();
        this.domande = new ArrayList<DomandaQuestionario>();
        

        this.listaGenitori = new ArrayList<Genitore>();
        this.domande = new ArrayList<DomandaQuestionario>();
        this.rispostePrecaricate = new ArrayList<RispostaQuestionario>();
    }
    



    /**
     * @return chiCompilato
     */
   
    /**
     * @return listaGenitori
     */
    public List<Genitore> getListaGenitori() {
        return listaGenitori;
    }

    /**
     * @param listaGenitori nuovo listaGenitori
     */
    public void setListaGenitori(List<Genitore> listaGenitori) {
        this.listaGenitori = listaGenitori;
    }
    
    public void addGenitore(Genitore genitore){
        listaGenitori.add(genitore);
    }

    /**
     * Metodo che setta il campo periodo fine
     * @param periodo_fine il parametro fissato
     */
    public void setPeriodo_fine(Date periodo_fine) {
        this.periodo_fine = periodo_fine;
    }

    /**
     * Metodo che restituisce il campo periodo fine
     * @return periodo_fine il parametro inserito
     */
    public Date getPeriodo_fine() {
        return periodo_fine;
    }
    
    public String getPeriodo_fineString() {
        return periodo_fine.toString();
    }
    
    public String getPeriodo_inizioString() {
        return periodo_inizio.toString();
    }

    /**
     * Metodo che setta il campo descrizione
     * @param descrizione il parametro fissato
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    /**
     * Metodo che restituisce il campo descrizione
     * @return descrizione il parametro inserito
     */
    public String getDescrizione() {
        return descrizione;
    }

    /**
     * Metodo che setta il campo flag rinuncia
     * @param flag_rinuncia il parametro fissato
     */
    public void setFlag_rinuncia(String flag_rinuncia) {
        this.flag_rinuncia = flag_rinuncia;
    }

    /**
     * Metodo che restituisce il campo flag rinuncia
     * @return flag_rinuncia il parametro inserito
     */
    public String getFlag_rinuncia() {
        return flag_rinuncia;
    }

    /**
     * Metodo che setta il campo nome
     * @param nome il parametro fissato
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * Metodo che restituisce il campo mome
     * @return nome il parametro inserito
     */
    public String getNome() {
        return nome;
    }

    /**
     * Metodo che setta il valore id
     * @param id il parametro fissato
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Metodo che restituisce il valore Id
     * @return id il parametro inserito
     */
    public int getId() {
        return id;
    }


    
    /**
     * Metodo che setta il campo periodo inizio
     * @param periodo_inizio il parametro fissato
     */
    public void setPeriodo_inizio(Date periodo_inizio) {
        this.periodo_inizio = periodo_inizio;
    }

    /**
     * Metodo che restituisce il campo periodi inizio
     * @return periodo_inizio il parametro inserito
     */
    public Date getPeriodo_inizio() {
        return periodo_inizio;
    }

    
    
    /**
     * Restituisce tutte le domande del questionario
     * @return domande che è un arrayList di DomandaQuestionario
     */
    public List<DomandaQuestionario> getDomande() {
        return domande;
    }
    
    
    
    /**
     * Setta tutte le domande di un questionario
     * @param domande è un arrayList di DomandaQuestionario
     */
    public void setDomande(List<DomandaQuestionario> domande) {
        
        for(DomandaQuestionario d: domande)
            d.setIdQuestionario(getId());
        this.domande = domande;

    }
    
    
    public void aggiungiDomanda(DomandaQuestionario d){
        domande.add(d);
    }
    
    
    
    /**
     * Metodo che restituisce true se il questionario è stato compilato da genitore
     * altrimenti restituisce false
     * @param genitore è il genitore da confrontare con la lista dei genitori
     * 
     */
    public boolean isCompilatoDa(String genitore){
        for(Genitore g: listaGenitori)
            if(genitore.equalsIgnoreCase(g.getCodiceFiscale()))
                return true;
        return false;
    }
    
    
    
    
    
    public String toString(){
        String genitori="listaGenitori";
        String domande="listaDomande";
        
        if(listaGenitori.isEmpty() || listaGenitori==null)
            genitori = "[vuota]";
        if(this.domande.isEmpty() || this.domande==null)
            domande="[null]";
        
        return "QUESTIONARIO    ID: "+getId()+ " Nome:"+getNome()+" Domande:"+domande+" Genitori:"+genitori;
    }
    
    
    /**
     * Inserisce le risposte già inserite dall'utente in una List
     * così da poterle caricare e visualizzare
     * @param d domanda vera del questionario a cui risponde la domanda
     * @param r risposta del genitore
     */
    public void precaricaRispostaAllaDomanda(RispostaQuestionario r){
        
        
        rispostePrecaricate.add(r);
        
    }
    
    public List<RispostaQuestionario> getRispostePrecaricate(){
        return rispostePrecaricate;
    }
    
}
