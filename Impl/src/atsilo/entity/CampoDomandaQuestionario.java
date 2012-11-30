package atsilo.entity;

public class CampoDomandaQuestionario {
    private String tipo;
    private String descrizione;
    private String valore;
    private DomandaQuestionario domanda;
    private RispostaQuestionario risposta;

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
        return domanda;
    }

    /**
     * @param domanda nuovo domanda
     */
    public void setDomanda(DomandaQuestionario domanda) {
        this.domanda = domanda;
    }

    /**
     * @return risposta
     */
    public RispostaQuestionario getRispostaQuestionario() {
        return risposta;
    }

    /**
     * @param risposta nuovo risposta
     */
    public void setRisposta(RispostaQuestionario risposta) {
        this.risposta = risposta;
    }

  
}
