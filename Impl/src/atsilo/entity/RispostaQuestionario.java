package atsilo.entity;

public class RispostaQuestionario {
    
    String id;
    String valore;
    Questionario questionario;
    Genitore genitore;
    
    public RispostaQuestionario() {
        
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setValore(String valore) {
        this.valore = valore;
    }

    public String getValore() {
        return valore;
    }

    public void setQuestionario(Questionario questionario) {
        this.questionario = questionario;
    }

    public Questionario getQuestionario() {
        return questionario;
    }

    public void setGenitore(Genitore genitore) {
        this.genitore = genitore;
    }

    public Genitore getGenitore() {
        return genitore;
    }
}
