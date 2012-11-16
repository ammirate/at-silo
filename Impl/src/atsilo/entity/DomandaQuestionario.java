package atsilo.entity;

public class DomandaQuestionario {
    
    private String id;
    private String descrizione;
    private Questionario questionario;
    
    public DomandaQuestionario(){
        
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setQuestionario(Questionario questionario) {
        this.questionario = questionario;
    }

    public Questionario getQuestionario() {
        return questionario;
    }
}


