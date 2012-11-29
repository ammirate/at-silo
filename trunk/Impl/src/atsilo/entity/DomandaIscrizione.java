package atsilo.entity;

public class DomandaIscrizione {
    
    private String dataPresentazione;
    private int id;
    private int punteggio;
    private String posizione;
    
    /**
     * La variabile genitore avrà il valore della variabile di Genitore
     * La variabile genitore è nulla c'è bisogno di una lettura della classe Genitore
     */
    private Genitore genitore;
    
    /**
     * La variabile bambino avrà il valore della variabile di Bambino
     * La variabile Bambino è nulla c'è bisogno di una lettura della classe Bambino
     */
    private Bambino bambino;
    
    /**
     * Costruttore vuoto
     */
    public DomandaIscrizione() {
    }

    /**
     * @param dataPresentazione il parametro è fissato
     * @param iD il parametro è fissato
     * @param punteggio il parametro è fissato
     * @param posizione il parametro è fissato
     * @param genitore è settato dopo la lettura
     * @param bambino è settato dopo la lettura
     */
    public DomandaIscrizione(String dataPresentazione, int iD, int punteggio,
            String posizione, Genitore genitore, Bambino bambino) {
        super();
        this.dataPresentazione = dataPresentazione;
        this.id = iD;
        this.punteggio = punteggio;
        this.posizione = posizione;
        this.genitore = genitore;
        this.bambino = bambino;
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
    public int getId() {
            return id;
    }

    /**
     * Metodo che setta il valore Id
     * @param iD il parametro fissato
     */
    public void setId(int iD) {
            this.id = iD;
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
     * @param genitore2 è settato dopo la lettura
     */
    public void setGenitore(Genitore genitore2) {
        this.genitore = genitore2;
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
     * @param bambino è settato dopo la lettura
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
