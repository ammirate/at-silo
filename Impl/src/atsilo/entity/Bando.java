package atsilo.entity;
public class Bando implements Beans {
    
    /**
     * @attribute identificativo di tipo intero
     */
    private int id;
    
    /**
     * @attribute DataInizio di tipo stringa
     */
    private String dataInizio;
    
    /**
     * @attribute DataFine di tipo stringa
     */
    private String dataFine;
    
    /**
     * Costruttore vuoto
     */
    public Bando() {
    }
    
    /**
     * 
     * @param id parametro fissato
     * @param dataInizio il parametro fissato
     * @param dataFine il parametro fissato
     */
    public Bando(int id, String dataInizio, String dataFine) {
        super();
        this.id = id;
        this.dataInizio = dataInizio;
        this.dataFine = dataFine;
    }

    /**
     * Metodo che prende il valore Classe
     * @return classe il parametro inserito
     */
    public int getiD() {
            return id;
    }

    /**
     * Metodo che setta il valore Id
     * @param iD il parametro fissato
     */
    public void setiD(int iD) {
            this.id = iD;
    }

    /**
     * Metodo che prende il campo DataInizio
     * @return DataInizio il parametro inserito
     */
    public String getDataInizio() {
            return dataInizio;
    }

    /**
     * Metodo che setta il campo DataInizio
     * @param dataInizio il parametro fissato
     */
    public void setDataInizio(String dataInizio) {
            this.dataInizio = dataInizio;
    }

    /**
     * Metodo che prende il campo DataFine
     * @return DataFine il parametro inserito
     */
    public String getDataFine() {
            return dataFine;
    }
    
    /**
     * Metodo che setta il campo DataFine
     * @param dataFine il parametro fissato
     */
    public void setDataFine(String dataFine) {
            this.dataFine = dataFine;
    }
}
