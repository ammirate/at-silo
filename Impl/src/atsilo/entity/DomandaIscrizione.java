package atsilo.entity;

public class DomandaIscrizione {
    
    private String dataPresentazione;
    private int iD;
    private int punteggio;
    private String posizione;
    private Genitore genitore;
    private Bambino bambino;

    public DomandaIscrizione() {
    }

    public String getDataPresentazione() {
            return dataPresentazione;
    }

    public void setDataPresentazione(String dataPresentazione) {
            this.dataPresentazione = dataPresentazione;
    }

    public int getiD() {
            return iD;
    }

    public void setiD(int iD) {
            this.iD = iD;
    }

    public int getPunteggio() {
            return punteggio;
    }

    public void setPunteggio(int punteggio) {
            this.punteggio = punteggio;
    }

    public String getPosizione() {
            return posizione;
    }

    public void setPosizione(String posizione) {
            this.posizione = posizione;
    }


    public void setGenitore(Genitore genitore) {
        this.genitore = genitore;
    }

    public Genitore getGenitore() {
        return genitore;
    }

    public void setBambino(Bambino bambino) {
        this.bambino = bambino;
    }

    public Bambino getBambino() {
        return bambino;
    }
}
