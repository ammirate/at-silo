package atsilo.entity;

public class Attivita {
    /**
     * @attribute descrizione di tipo stringa
     */
    private String descrizione;

    /**
     * @attribute categoria di tipo stringa
     */
    private String categoria;

    /**
     * @attribute La variabile è nulla c'è bisogno di una lettura della classe ProgammaEducativoSettimanale
     */
    private ProgrammaEducativoSettimanale progEdSettimanale;

    /**
     * @attribute titolo di tipo stringa
     */
    private String titolo;

    /**
     * @attribute La variabile è nulla c'è bisogno di una lettura della classe Registro
     */
    private Registro registro;


    public Attivita() {
    }
    
    /**
     * Metodo che setta il campo Descrizione
     * @param descrizione il parametro settato
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    /**
     * Metodo che prende il campo descrizione
     * @return descrizione il paramentro inserito
     */
    public String getDescrizione() {
        return descrizione;
    }

    /**
     * Metodo che statta il campo categoria
     * @param categoria il parametro fissato
     */
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    /**
     * Metodo che prende il campo Categoria
     * @return categoria il parametro inserito
     */
    public String getCategoria() {
        return categoria;
    }

    /**
     * Metodo che setta il parametro letto dalla classe ProgrammaEducativoSettimanale
     * @param ProgrammaEducativoSettimanale è settato dopo la lettura
     */    
    public void setProgramma_educativo_settimanale(ProgrammaEducativoSettimanale programma_educativo_settimanale) {
        this.progEdSettimanale = programma_educativo_settimanale;
    }

    /**
     * Metodo che prende il parametro letto dalla classe ProgrammaEducativoSettimanale
     * @return ProgrammaEducativoSettimanale parametro preso dalla lettura
     */
    public ProgrammaEducativoSettimanale getProgramma_educativo_settimanale() {
        return progEdSettimanale;
    }

    /**
     * Metodo che setta il parametro Titolo
     * @param titolo il parametro settato
     */
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    /**
     * Metodo che prende il campo Titolo
     * @return titolo il parametro inserito
     */
    public String getTitolo() {
        return titolo;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Registro
     * @param owner è settato dopo la lettura
     */    
    public void setRegistro(Registro registro) {
        this.registro = registro;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Registro
     * @return registro parametro preso dalla lettura
     */
    public Registro getRegistro() {
        return registro;
    }
}
