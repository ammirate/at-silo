package atsilo.entity;

public class DomandaIscrizione {
    
    private String dataPresentazione;
    private int iD;
    private int punteggio;
    private String posizione;
    private String codFiscaleGenitore;
    private String codFiscaleBambino;

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

    public String getCodFiscaleGenitore() {
            return codFiscaleGenitore;
    }

    public void setCodFiscaleGenitore(String codFiscaleGenitore) {
            this.codFiscaleGenitore = codFiscaleGenitore;
    }

    public String getCodFiscaleBambino() {
            return codFiscaleBambino;
    }

    public void setCodFiscaleBambino(String codFiscaleBambino) {
            this.codFiscaleBambino = codFiscaleBambino;
    }
}
