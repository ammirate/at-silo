package atsilo.entity;

public class RispostaQuestionario {
    
    private String id;
    private String valore;
    
    /**
     * La variabile questionario � nulla c'� bisogno di una lettura della classe Questionario
     */
    private Questionario questionario;
    
    /**
     * La variabile genitore � nulla c'� bisogno di una lettura della classe Genitore
     */
    private Genitore genitore;
    
    /**
     * Costruttore vuoto
     */
    public RispostaQuestionario() {
    }

    /**
     * @param id il paramentro � fissato
     * @param valore il paramentro � fissato
     * @param questionario � settato dopo la lettura
     * @param genitore � settato dopo la lettura
     */
    public RispostaQuestionario(String id, String valore,
            Questionario questionario, Genitore genitore) {
        super();
        this.id = id;
        this.valore = valore;
        this.questionario = questionario;
        this.genitore = genitore;
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
     * @param questionario � settato dopo la lettura
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
     * @param genitore � settato dopo la lettura
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
