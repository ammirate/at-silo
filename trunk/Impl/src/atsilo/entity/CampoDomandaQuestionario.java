package atsilo.entity;

public class CampoDomandaQuestionario {
    private String tipo;
    private String descrizione;
    private String valore;
    private DomandaQuestionario domandaQuestionario;
    private RispostaQuestionario rispostaQuestionario;

    public CampoDomandaQuestionario() {
        super();
    }

    /**
     * @return tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo nuovo tipo
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return descrizione
     */
    public String getDescrizione() {
        return descrizione;
    }

    /**
     * @param descrizione nuovo descrizione
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    /**
     * @return valore
     */
    public String getValore() {
        return valore;
    }

    /**
     * @param valore nuovo valore
     */
    public void setValore(String valore) {
        this.valore = valore;
    }

    /**
     * @return domanda
     */
    public DomandaQuestionario getDomandaQuestionario() {
        return domandaQuestionario;
    }

    /**
     * @param domanda nuovo domanda
     */
    public void setDomandaQuestionario(DomandaQuestionario domanda) {
        this.domandaQuestionario = domanda;
    }

    /**
     * @return risposta
     */
    public RispostaQuestionario getRispostaQuestionario() {
        return rispostaQuestionario;
    }

    /**
     * @param risposta nuovo risposta
     */
    public void setRispostaQuestionario(RispostaQuestionario risposta) {
        this.rispostaQuestionario = risposta;
    }

  
}
