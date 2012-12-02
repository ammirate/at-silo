package atsilo.entity;

public class RispostaQuestionario {
    
    private String id;
    private String valore;
    private String idDomanda;
    private String CFgenitore;
    
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
    public RispostaQuestionario(String id, String valore,String idDomanda, String CodFiscGenitore) {
        super();
        this.id = id;
        this.valore = valore;
        this.idDomanda = idDomanda;
        this.CFgenitore = CodFiscGenitore;
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
     * @return idDomanda
     */
    public String getIdDomanda() {
        return idDomanda;
    }

    /**
     * @param idDomanda nuovo idDomanda
     */
    public void setIdDomanda(String idDomanda) {
        this.idDomanda = idDomanda;
    }

    /**
     * @return cFgenitore
     */
    public String getCFgenitore() {
        return CFgenitore;
    }

    /**
     * @param cFgenitore nuovo cFgenitore
     */
    public void setCFgenitore(String cFgenitore) {
        CFgenitore = cFgenitore;
    }


    /**
     * @return domanda
     */
   
    
    
}
