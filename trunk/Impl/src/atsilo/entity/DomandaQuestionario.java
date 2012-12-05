package atsilo.entity;

import java.util.List;

public class DomandaQuestionario {
    
    private int id;
    private String descrizione;
    private List<CampoDomandaQuestionario> campi;
    private int idQuestionario;
    


    /**
     * La variabile questionario avr� il valore della variabile di Questionario
     * La variabile questionario � nulla c'� bisogno di una lettura della classe questionario
     */
    
    /**
     * Costruttore vuoto
     */
    public DomandaQuestionario(){    
    }

    /**
     * Costruttore
     * @param id il parametro � settato
     * @param descrizione il parametro � settato
     * @param campi � una lista contenente i campi della domanda
     * @param questionario � settato dopo la lettura
     */
    public DomandaQuestionario(int id, int idQuestionario, String descrizione, List<CampoDomandaQuestionario> campi){
        super();
        this.id = id;
        this.descrizione = descrizione;
        this.campi = campi;
        idQuestionario = idQuestionario;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Metodo che prende il campo Id
     * @return iD il parametro inserito
     */
    public int getId() {
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

