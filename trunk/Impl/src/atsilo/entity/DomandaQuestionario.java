package atsilo.entity;

public class DomandaQuestionario {
    
    private String id;
    private String descrizione;
    
    /**
     * La variabile questionario è nulla c'è bisogno di una lettura della classe questionario
     */
    private Questionario questionario;
    
    public DomandaQuestionario(){    
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
     * Metodo che setta il parametro letto dalla classe Questionario
     * @param questionario è settato dopo la lettura
     */
    public void setQuestionario(Questionario questionario) {
        this.questionario = questionario;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Questionario
     * @return questionario parametro preso dalla lettura
     */
    public Questionario getQuestionario() {
        return questionario;
    }
}


