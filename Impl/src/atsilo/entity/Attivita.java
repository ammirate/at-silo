package atsilo.entity;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Attività.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 13/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

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
     * La variabile progEdSettimanale avrà il valore della variabile di ProgrammaEducativoSettimanale 
     * @attribute progEdSettimanale La variabile è nulla c'è bisogno di una lettura della classe ProgammaEducativoSettimanale
     */
    private ProgrammaEducativoSettimanale programmaEducativoSettimanale;

    /**
     * @attribute titolo di tipo stringa
     */
    private String titolo;
    
    /**
     * @attribute path di tipo stringa
     */
    private String path;

    /**
     *  La variabile registro avrà il valore della variabile di Registro
     * @attribute registro La variabile è nulla c'è bisogno di una lettura della classe Registro
     */
    private Registro registro;


    /**
     * Costruttore vuoto
     */
    public Attivita() {
    }
    
    /**
     * 
     * @param descrizione
     * @param categoria
     * @param progEdSettimanale
     * @param titolo
     * @param registro
     */
    public Attivita(String descrizione, String categoria,
            ProgrammaEducativoSettimanale progEdSettimanale, String titolo,
            Registro registro, String path) {
        super();
        this.descrizione = descrizione;
        this.categoria = categoria;
        this.programmaEducativoSettimanale = progEdSettimanale;
        this.titolo = titolo;
        this.registro = registro;
        this.path = path;
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
     * @param programma_educativo_settimanale è settato dopo la lettura
     */    
    public void setProgrammaEducativoSettimanale(ProgrammaEducativoSettimanale programma_educativo_settimanale) {
        this.programmaEducativoSettimanale = programma_educativo_settimanale;
    }

    /**
     * Metodo che prende il parametro letto dalla classe ProgrammaEducativoSettimanale
     * @return programma_educativo_settimanale parametro preso dalla lettura
     */
    public ProgrammaEducativoSettimanale getProgrammaEducativoSettimanale() {
        return programmaEducativoSettimanale;
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
     * Metodo che setta il parametro path
     * @param path il parametro settato
     */
    public void setPath(String path) {
        this.path = path;
    }

    /**
     * Metodo che prende il campo path
     * @return path il parametro inserito
     */
    public String getPath() {
        return path;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Registro
     * @param registro è settato dopo la lettura
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
