package atsilo.entity;

public class Psicopedagogo extends Utente {


    /**
     * @attribute
     */
    private String numeroClassi;

    /**
     * @attribute
     */
    private String titoloDiStudi;


    public Psicopedagogo() {
    }

    public void setNumeroClassi(String numeroClassi) {
        this.numeroClassi = numeroClassi;
    }

    public String getNumeroClassi() {
        return numeroClassi;
    }

    public void setTitoloDiStudi(String titoloDiStudi) {
        this.titoloDiStudi = titoloDiStudi;
    }

    public String getTitoloDiStudi() {
        return titoloDiStudi;
    }
}
