package atsilo.entity;

public class RispostaQuestionario {
    
    private String id;
    private String valore;
    
    /**
     * La variabile questionario è nulla c'è bisogno di una lettura della classe Questionario
     */
    private Questionario questionario;
    
    /**
     * La variabile genitore è nulla c'è bisogno di una lettura della classe Genitore
     */
    private Genitore genitore;
    
    public RispostaQuestionario() {
    }

    /**
     * Metodo che prende il campo Id
     * @param id il parametro inserito
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * Metodo che prende il campo id
     * @return id il parametro inserito
     */
    public String getId() {
        return id;
    }

    /**
     * Metodo che prende il campo valore
     * @param valore il parametro inserito
     */
    public void setValore(String valore) {
        this.valore = valore;
    }

    /**
     * Metodo che prende il campo valore
     * @return valore il parametro inserito
     */
    public String getValore() {
        return valore;
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
     * @return questionario preso dalla lettura
     */
    public Questionario getQuestionario() {
        return questionario;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Genitore
     * @param genitore è settato dopo la lettura
     */
    public void setGenitore(Genitore genitore) {
        this.genitore = genitore;
    }

    /**
     * Metodo che prende il parametro letto dalla classe genitore
     * @return genitore preso dalla lettura
     */
    public Genitore getGenitore() {
        return genitore;
    }
}
