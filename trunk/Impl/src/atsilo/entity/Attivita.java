package atsilo.entity;

public class Attivita {
    /**
     * @attribute
     */
    private String descrizione;

    /**
     * @attribute
     */
    private String categoria;

    /**
     * @attribute
     */
    private ProgrammaEducativoSettimanale progEdSettimanale;

    /**
     * @attribute
     */
    private String titolo;

    /**
     * @attribute
     */
    private Registro registro;


    public Attivita() {
        
    }
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setProgramma_educativo_settimanale(ProgrammaEducativoSettimanale programma_educativo_settimanale) {
        this.progEdSettimanale = programma_educativo_settimanale;
    }

    public ProgrammaEducativoSettimanale getProgramma_educativo_settimanale() {
        return progEdSettimanale;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setRegistro(Registro registro) {
        this.registro = registro;
    }

    public Registro getRegistro() {
        return registro;
    }
}
