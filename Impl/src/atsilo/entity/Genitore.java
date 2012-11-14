package atsilo.entity;

import java.util.List;

public class Genitore extends Utente {


    /**
     * @attribute
     */
    private String tipo;


    private  List<Bambino> figli;
    
    private List<Questionario> questionariCompilati;

    public Genitore() {
    }


    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setFigli(List<Bambino> figli) {
        this.figli = figli;
    }

    public List<Bambino> getFigli() {
        return figli;
    }

    public void setQuestionariCompilati(List<Questionario> questionariCompilati) {
        this.questionariCompilati = questionariCompilati;
    }

    public List<Questionario> getQuestionariCompilati() {
        return questionariCompilati;
    }
}
