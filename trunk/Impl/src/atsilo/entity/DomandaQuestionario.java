package atsilo.entity;

import java.util.List;

public class DomandaQuestionario {
    
    private String id;
    private String descrizione;
    private List<CampoDomandaQuestionario> campi;
    private RispostaQuestionario risposta;
    private int idQuestionario;
    


    /**
     * La variabile questionario avrà il valore della variabile di Questionario
     * La variabile questionario è nulla c'è bisogno di una lettura della classe questionario
     */
    
    /**
     * Costruttore vuoto
     */
    public DomandaQuestionario(){    
    }

    /**
     * Costruttore
     * @param id il parametro è settato
     * @param descrizione il parametro è settato
     * @param campi è una lista contenente i campi della domanda
     * @param questionario è settato dopo la lettura
     */
    public DomandaQuestionario(String id, int idQuestionario, String descrizione, List<CampoDomandaQuestionario> campi){
        super();
        this.id = id;
        this.descrizione = descrizione;
        this.campi = campi;
        idQuestionario = idQuestionario;
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
    
    
    public void aggiungiCampo(CampoDomandaQuestionario c){
        campi.add(c);
    }

    /**
     * @return idRisposta
     */
    public RispostaQuestionario getRisposta() {
        return risposta;
    }

    /**
     * @param idRisposta nuovo idRisposta
     */
    public void setRisposta(RispostaQuestionario risposta) {
        this.risposta = risposta;
    }

    /**
     * @return idQuestionario
     */
    public int getIdQuestionario() {
        return idQuestionario;
    }

    /**
     * @param idQuestionario nuovo idQuestionario
     */
    public void setIdQuestionario(int idQuestionario) {
        this.idQuestionario = idQuestionario;
    }

    /**
     * @return risposta
     */
//    

    
    
    
}


