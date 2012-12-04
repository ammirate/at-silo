package atsilo.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Questionario {
 
    private Date periodo_fine;
    private String descrizione;
    private String flag_rinuncia;
    private String nome;
    private int id;
    private Date periodo_inizio;
    private List<Genitore> listaGenitori;
    private List<DomandaQuestionario> domande;
    
    
    
    /**
     * Costruttore vuoto
     */
    public Questionario() {

        this.listaGenitori = new ArrayList<Genitore>();
        this.domande = new ArrayList<DomandaQuestionario>();
    }
    
    
    
    
    /**
     * @param periodo_fine il paramentro � fissato
     * @param descrizione il paramentro � fissato
     * @param flag_rinuncia il paramentro � fissato
     * @param nome il paramentro � fissato
     * @param id il paramentro � fissato
     * @param periodo_inizio il paramentro � fissato
     * @param pathname il paramentro � fissato
     */
    public Questionario( String descrizione,String flag_rinuncia, String nome, int id, Date periodo_inizio,Date periodo_fine) {
        super();
        this.periodo_fine = periodo_fine;
        this.descrizione = descrizione;
        this.flag_rinuncia = flag_rinuncia;
        this.nome = nome;
        this.id = id;
        this.periodo_inizio = periodo_inizio;
        this.listaGenitori = new ArrayList<Genitore>();
        this.domande = new ArrayList<DomandaQuestionario>();
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
     * @return domande
     */
    public List<DomandaQuestionario> getDomande() {
        return domande;
    }
    
    
    
    /**
     * @param domande nuovo domande
     */
    public void setDomande(List<DomandaQuestionario> domande) {
        this.domande = domande;
    }
    
    
    public void aggiungiDomanda(DomandaQuestionario d){
        domande.add(d);
    }
    
    
    
    /**
     * Metodo che restituisce true se il questionario � stato compilato da genitore
     * altrimenti restituisce false
     * @param genitore � il genitore da confrontare con la lista dei genitori
     * 
     */
    public boolean isCompilatoDa(String genitore){
        for(Genitore g: listaGenitori)
            if(genitore.equalsIgnoreCase(g.getCodiceFiscale()))
                return true;
        return false;
    }
    
    
    
    /**
     * Metodo che assegna ad ogni domanda del questionario la relativa risposta
     * @param risposte e la lista di risposte
     */
    public void compila(List<RispostaQuestionario> risposte, Genitore chiCompila){
        
        for(DomandaQuestionario d : domande)
            for(RispostaQuestionario r : risposte)
                if(r.getIdDomanda().equalsIgnoreCase(d.getId()) ){
                    d.setRisposta(r);
                    r.setCFgenitore(chiCompila.getCodiceFiscale());
                }
        this.listaGenitori.add(chiCompila);
        
    }
    
    
    public String toString(){
        String genitori="listaGenitori";
        String domande="listaDomande";
        
        if(listaGenitori.isEmpty() || listaGenitori==null)
            genitori = "[vuota]";
        if(this.domande.isEmpty() || this.domande==null)
            domande="[null]";
        
        return "ID: "+getId()+ " Nome:"+getNome()+" Domande:"+domande+" Genitori:"+genitori;
    }
    
    
    
}
