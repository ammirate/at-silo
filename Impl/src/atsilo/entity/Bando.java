package atsilo.entity;

public class Bando {
    
    private int iD;
    private String dataInizio;
    private String dataFine;
    
    public Bando() {
    }

    public int getiD() {
            return iD;
    }

    public void setiD(int iD) {
            this.iD = iD;
    }

    public String getDataInizio() {
            return dataInizio;
    }

    public void setDataInizio(String dataInizio) {
            this.dataInizio = dataInizio;
    }

    public String getDataFine() {
            return dataFine;
    }

    public void setDataFine(String dataFine) {
            this.dataFine = dataFine;
    }
}
