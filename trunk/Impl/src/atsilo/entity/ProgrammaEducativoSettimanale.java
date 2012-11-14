package atsilo.entity;

public class ProgrammaEducativoSettimanale {
    /**
     * @attribute
     */
    private String settimana;

    /**
     * @attribute
     */
    private String descrizione;

    /**
     * @attribute
     */
    private String obiettivi;

    /**
     * @attribute
     */
    Psicopedagogo psicopedagogo;

    /**
     * @attribute
     */
    private int id;

    public ProgrammaEducativoSettimanale() {
    }

    public void setDescrizione(String d) {
    }

    public int getId() {
    }

    public void setObiettivi(String o) {
    }

  

    public void setSettimana(String s) {
    }

    public String getObiettivi() {
    }

    public String getSettimana() {
    }

    public String getDescrizione() {
    }

    public void setPsicopedagogo(Psicopedagogo psicopedagogo) {
        this.psicopedagogo = psicopedagogo;
    }

    public Psicopedagogo getPsicopedagogo() {
        return psicopedagogo;
    }
}
