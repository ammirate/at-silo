package atsilo.entity;

public class DomandaIscrizione {
    
    private String dataPresentazione;
    private int iD;
    private int punteggio;
    private String posizione;
    
    /**
     * La variabile genitore è nulla c'è bisogno di una lettura della classe Genitore
     */
    private Genitore genitore;
    /**
     * La variabile Bambino è nulla c'è bisogno di una lettura della classe Bambino
     */
    private Bambino bambino;

    public DomandaIscrizione() {
    }

    /**
     * Metodo che prende il campo DataPresentazione
     * @return DataPresentazione il paramentro inserito
     */
    public String getDataPresentazione() {
            return dataPresentazione;
    }

    /**
     * Metodo che setta il campo DataPresentazione
     * @param dataPresentazione il parametro fissato
     */
    public void setDataPresentazione(String dataPresentazione) {
            this.dataPresentazione = dataPresentazione;
    }

    /**
     * Metodo che prende il valore di Id
     * @return iD il paramentro inserito
     */
    public int getiD() {
            return iD;
    }

    /**
     * Metodo che setta il valore Id
     * @param iD il parametro fissato
     */
    public void setiD(int iD) {
            this.iD = iD;
    }

    /**
     * Metodo che prende il valore di punteggio
     * @return punteggio il paramentro inserito
     */
    public int getPunteggio() {
            return punteggio;
    }

    /**
     * Metodo che setta il valore punteggio
     * @param punteggio il parametro fissato
     */
    public void setPunteggio(int punteggio) {
            this.punteggio = punteggio;
    }

    /**
     * Metodo che prende il campo posizione
     * @return posizione il paramentro inserito
     */
    public String getPosizione() {
            return posizione;
    }

    /**
     * Metodo che setta il campo posizione
     * @param posizione il parametro fissato
     */
    public void setPosizione(String posizione) {
            this.posizione = posizione;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Genitore
     * @param Genitore è settato dopo la lettura
     */
    public void setGenitore(Genitore genitore) {
        this.genitore = genitore;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Genitore
     * @return Genitore parametro preso dalla lettura
     */
    public Genitore getGenitore() {
        return genitore;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Bambino
     * @param Bambino è settato dopo la lettura
     */
    public void setBambino(Bambino bambino) {
        this.bambino = bambino;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Bambino
     * @return bambino parametro preso dalla lettura
     */
    public Bambino getBambino() {
        return bambino;
    }
}
