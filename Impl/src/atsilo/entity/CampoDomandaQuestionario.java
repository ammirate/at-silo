package atsilo.entity;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: CampoDomandaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 13/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class CampoDomandaQuestionario {
    private String tipo;
    private String descrizione;
    private String valore;
    private int  idDomandaQuestionario;
    private int idRispostaQuestionario;

    public CampoDomandaQuestionario() {
        super();
    }
    
    public CampoDomandaQuestionario(String tipo, String desc, String valore, int idDomanda){
        this.tipo = tipo;
        this.descrizione = desc;
        this.valore = valore;
        this.idDomandaQuestionario = idDomanda;
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
    public int getIdDomandaQuestionario() {
        return idDomandaQuestionario;
    }

    /**
     * @param i nuovo idDomandaQuestionario
     */
    public void setIdDomandaQuestionario(int i) {
        this.idDomandaQuestionario = i;
    }

    /**
     * @return idRispostaQuestionario
     */
    public int getIdRispostaQuestionario() {
        return idRispostaQuestionario;
    }

    /**
     * @param idRispostaQuestionario nuovo idRispostaQuestionario
     */
    public void setIdRispostaQuestionario(int idRispostaQuestionario) {
        this.idRispostaQuestionario = idRispostaQuestionario;
    }

  
    public String toString(){
        return "Tipo:"+tipo+ "  descrizione:"+descrizione+"  valore:"+valore+" IDdomanda:"+idDomandaQuestionario;
    }

    

  
}
