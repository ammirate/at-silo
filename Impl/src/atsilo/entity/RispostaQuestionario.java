package atsilo.entity;

public class RispostaQuestionario {
    
    private String id;
    private String valore;
    
    /**
     * La variabile questionario è nulla c'è bisogno di una lettura della classe Questionario
     */
    private DomandaQuestionario domanda;
    
    /**
     * La variabile genitore è nulla c'è bisogno di una lettura della classe Genitore
     */
    private Genitore genitore;
    
    /**
     * Costruttore vuoto
     */
    public RispostaQuestionario() {
    }

    /**
     * @param id il paramentro è fissato
     * @param valore il paramentro è fissato
     * @param genitore è settato dopo la lettura
     */
    public RispostaQuestionario(String id, String valore,DomandaQuestionario domanda, Genitore genitore) {
        super();
        this.id = id;
        this.valore = valore;
        this.domanda=domanda;
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
     * @return domanda
     */
    public DomandaQuestionario getDomanda() {
        return domanda;
    }

    /**
     * @param domanda nuovo domanda
     */
    public void setDomanda(DomandaQuestionario domanda) {
        this.domanda = domanda;
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
