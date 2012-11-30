package atsilo.entity;

import java.util.List;

public class DomandaQuestionario {
    
    private String id;
    private String descrizione;
    private List<CampoDomandaQuestionario> campi;
    private RispostaQuestionario risposta;
    


    /**
     * La variabile questionario avr� il valore della variabile di Questionario
     * La variabile questionario � nulla c'� bisogno di una lettura della classe questionario
     */
    private Questionario questionario;
    
    /**
     * Costruttore vuoto
     */
    public DomandaQuestionario(){    
    }

    /**
     * @param id il parametro � settato
     * @param descrizione il parametro � settato
     * @param questionario � settato dopo la lettura
     */
    public DomandaQuestionario(String id, String descrizione,
            Questionario questionario) {
        super();
        this.id = id;
        this.descrizione = descrizione;
        this.questionario = questionario;
    }
    
    public void setId(String id) {
        this.id = id;
    }

    /**
     * Metodo che prende il campo Id
     * @return iD il parametro inserito
     */
    public String getId() {
        return id;
    }

    /**
     * Metodo che setta il campo Descrizione
     * @param descrizione il parametro fissato
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    /**
     * Metodo che prende il campo descrizione
     * @return descrizione il parametro inserito
     */
    public String getDescrizione() {
        return descrizione;
    }

    /**
     * @return risposta
     */
    public RispostaQuestionario getRisposta() {
        return risposta;
    }

    /**
     * @param risposta nuovo risposta
     */
    public void setRisposta(RispostaQuestionario risposta) {
        this.risposta = risposta;
    }

    /**
     * @return campi
     */
    public List<CampoDomandaQuestionario> getCampi() {
        return campi;
    }

    /**
     * @param campi nuovo campi
     */
    public void setCampi(List<CampoDomandaQuestionario> campi) {
        this.campi = campi;
    }
    
    public Questionario getQuestionario() {
        return questionario;
    }

    /**
     * @param questionario nuovo questionario
     */
    public void setQuestionario(Questionario q) {
        this.questionario = questionario;
    }
    
    
}


