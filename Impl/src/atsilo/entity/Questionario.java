package atsilo.entity;

public class Questionario {
    /**
     * @attribute
     */
    private String periodo_fine;

    /**
     * @attribute
     */
    private String descrizione;

    /**
     * @attribute
     */
    private String flag_rinuncia;

    /**
     * @attribute
     */
    private String nome;

    /**
     * @attribute
     */
    private int id;

    /**
     * @attribute
     */
    private String periodo_inizio;

    /**
     * @attribute
     */
    private String pathname;

    public Questionario() {
    }


    public void setPeriodo_fine(String periodo_fine) {
        this.periodo_fine = periodo_fine;
    }

    public String getPeriodo_fine() {
        return periodo_fine;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setFlag_rinuncia(String flag_rinuncia) {
        this.flag_rinuncia = flag_rinuncia;
    }

    public String getFlag_rinuncia() {
        return flag_rinuncia;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setPeriodo_inizio(String periodo_inizio) {
        this.periodo_inizio = periodo_inizio;
    }

    public String getPeriodo_inizio() {
        return periodo_inizio;
    }

    public void setPathname(String pathname) {
        this.pathname = pathname;
    }

    public String getPathname() {
        return pathname;
    }
}
