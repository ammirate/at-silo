package atsilo.entity;
import java.sql.Date;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Bambino.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class Bambino {
    
    /**
     * @attribute nome di tipo stringa
     */
    private String nome;

    /**
     * @attribute DataNascita di tipo DATE
     */
    private Date dataNascita;

    /**
     * @attribute CategoriaAppartenenza di tipo stringa
     */
    private String categoriaAppartenenza;

    /**
     * @attribute indirizzo di tipo indirizzo
     */
    private String indirizzo;

    /**
     * @attribute classe di tipo intero
     */
    private int classe;

    /**
     * @attribute cognome di tipo stringa
     */
    private String cognome;

    /**
     *  La variabile genitore avrà il valore della variabile di Genitore
     * La variabile Genitore è nulla c'è bisogno di una lettura della classe genitore
     */
    private Genitore genitore;

    /**
     * @attribute CodiceFiscale di tipo stringa
     */
    private String codiceFiscale;

    /**
     *  La variabile assenza avrà i valore della lista Assenza
     * La variabile assenze è nulla c'è bisogno di una lettura della classe Assenza
     */
    private List<Assenza> assenze;

    /**
     * Costruttore vuoto
     */
    public Bambino() {}
    
    /**
     * @param nome il parametro fissato
     * @param dataNascita il parametro fissato
     * @param categoriaAppartenenza il parametro fissato
     * @param indirizzo il parametro fissato
     * @param classe il parametro fissato
     * @param cognome il parametro fissato
     * @param genitore è settato dopo la lettura
     * @param codiceFiscale il parametro fissato
     * @param assenze è settato dopo la lettura
     */
    public Bambino(String nome, Date dataNascita, String categoriaAppartenenza,
            String indirizzo, int classe, String cognome, Genitore genitore,
            String codiceFiscale, List<Assenza> assenze) {
        super();
        this.nome = nome;
        this.dataNascita = dataNascita;
        this.categoriaAppartenenza = categoriaAppartenenza;
        this.indirizzo = indirizzo;
        this.classe = classe;
        this.cognome = cognome;
        this.genitore = genitore;
        this.codiceFiscale = codiceFiscale;
        this.assenze = assenze;
    }
    
    /**
     * Metodo che setta il campo Nome
     * @param Nome il parametro fissato
     */
    public void setNome(String Nome) {
        this.nome = Nome;
    }

    /**
     * Metodo che prende il campo Nome
     * @return nome il paramentro inserito
     */
    public String getNome() {
        return nome;
    }

    /**
     * Metodo che setta il campo DataNascita
     * @param DataNascita il parametro fissato
     */
    public void setDataNascita(Date DataNascita) {
        this.dataNascita = DataNascita;
    }

    /**
     * Metodo che prende il campo DataNascita
     * @return DataNascita il parametro inserito
     */
    public Date getDataNascita() {
        return dataNascita;
    }

    /**
     * Metodo che setta il campo CategoriaAppartenenza
     * @param CategoriaAppartenenza il parametro fissato
     */    
    public void setCategoriaAppartenenza(String CategoriaAppartenenza) {
        this.categoriaAppartenenza = CategoriaAppartenenza;
    }

    /**
     * Metodo che prende il campo CategoriaAppartenenza
     * @return CategoriaAppartenenza il parametro inserito
     */
    public String getCategoriaAppartenenza() {
        return categoriaAppartenenza;
    }

    /**
     * Metodo che setta il campo Indirizzo
     * @param Indirizzo il parametro fissato
     */
    public void setIndirizzo(String Indirizzo) {
        this.indirizzo = Indirizzo;
    }

    /**
     * Metodo che prende il campo Indirizzo
     * @return indirizzo il paramentro inserito
     */
    public String getIndirizzo() {
        return indirizzo;
    }

    /**
     * Metodo che setta il valore Classe
     * @param Classe il parametro fissato
     */
    public void setClasse(int Classe) {
        this.classe = Classe;
    }

    /**
     * Metodo che prende il valore Classe
     * @return classe il parametro inserito
     */
    public int getClasse() {
        return classe;
    }

    /**
     * Metodo che setta il campo Cognome
     * @param Cognome il parametro fissato
     */
    public void setCognome(String Cognome) {
        this.cognome = Cognome;
    }

    /**
     * Metodo che prende il campo Cognome
     * @return cognome il parametro inserito
     */
    public String getCognome() {
        return cognome;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Genitore
     * @param Genitore è settato dopo la lettura
     */
    public void setGenitore(Genitore Genitore) {
        this.genitore = Genitore;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Genitore
     * @return Genitore parametro preso dalla lettura
     */
    public Genitore getGenitore() {
        return genitore;
    }

    /**
     * Metodo che setta il campo CodiceFiscale
     * @param Codice_Fiscale il parametro fissato
     */
    public void setCodice_Fiscale(String Codice_Fiscale) {
        this.codiceFiscale = Codice_Fiscale;
    }

    /**
     * Metodo che prende il campo CodiceFiscale
     * @return codiceFiscale il parametro inserito
     */
    public String getCodice_Fiscale() {
        return codiceFiscale;
    }

    /**
     * Metodo che setta il parametro letto dalla classe assenza
     * @param assenze è settato dopo la lettura
     */
    public void setAssenze(List<Assenza> assenze) {
        this.assenze = assenze;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Assenza
     * @return assenza preso dalla lettura
     */
    public List<Assenza> getAssenze() {
        return assenze;
    }
}
