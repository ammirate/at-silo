package atsilo.entity;

public class CampoDomandaQuestionario {
    private String tipo;
    private String descrizione;
    private String valore;
    private String  idDomandaQuestionario;
    private String idRispostaQuestionario;

    public CampoDomandaQuestionario() {
        super();
    }
    
    public CampoDomandaQuestionario(String tipo, String desc, String valore, String idDomanda){
        this.tipo = tipo;
        this.descrizione = desc;
        this.valore = valore;
        this.idDomandaQuestionario = idDomanda;
        this.idRispostaQuestionario = null;
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
     * @return idDomandaQuestionario
     */
    public String getIdDomandaQuestionario() {
        return idDomandaQuestionario;
    }

    /**
     * @param idDomandaQuestionario nuovo idDomandaQuestionario
     */
    public void setIdDomandaQuestionario(String idDomandaQuestionario) {
        this.idDomandaQuestionario = idDomandaQuestionario;
    }

    /**
     * @return idRispostaQuestionario
     */
    public String getIdRispostaQuestionario() {
        return idRispostaQuestionario;
    }

    /**
     * @param idRispostaQuestionario nuovo idRispostaQuestionario
     */
    public void setIdRispostaQuestionario(String idRispostaQuestionario) {
        this.idRispostaQuestionario = idRispostaQuestionario;
    }

  

  
}
