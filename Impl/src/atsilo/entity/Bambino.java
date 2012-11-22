package atsilo.entity;
import java.sql.Date;
import java.util.List;

public class Bambino {
    /**
     * @attribute nome di tipo stringa
     */
    private String Nome;

    /**
     * @attribute DataNascita di tipo DATE
     */
    private Date DataNascita;

    /**
     * @attribute CategoriaAppartenenza di tipo stringa
     */
    private String CategoriaAppartenenza;

    /**
     * @attribute indirizzo di tipo indirizzo
     */
    private String Indirizzo;

    /**
     * @attribute classe di tipo intero
     */
    private int Classe;

    /**
     * @attribute cognome di tipo stringa
     */
    private String Cognome;

    /**
     * La variabile Genitore � nulla c'� bisogno di una lettura della classe genitore
     */
    private Genitore Genitore;

    /**
     * @attribute CodiceFiscale di tipo stringa
     */
    private String Codice_Fiscale;

    /**
     * La variabile assenze � nulla c'� bisogno di una lettura della classe Assenza
     */
    private Assenza assenze;

    public Bambino() {
    }
    
    /**
     * Metodo che setta il campo Nome
     * @param Nome il parametro fissato
     */
    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    /**
     * Metodo che prende il campo Nome
     * @return nome il paramentro inserito
     */
    public String getNome() {
        return Nome;
    }

    /**
     * Metodo che setta il campo DataNascita
     * @param DataNascita il parametro fissato
     */
    public void setDataNascita(Date DataNascita) {
        this.DataNascita = DataNascita;
    }

    /**
     * Metodo che prende il campo DataNascita
     * @return DataNascita il parametro inserito
     */
    public Date getDataNascita() {
        return DataNascita;
    }

    /**
     * Metodo che setta il campo CategoriaAppartenenza
     * @param CategoriaAppartenenza il parametro fissato
     */    
    public void setCategoriaAppartenenza(String CategoriaAppartenenza) {
        this.CategoriaAppartenenza = CategoriaAppartenenza;
    }

    /**
     * Metodo che prende il campo CategoriaAppartenenza
     * @return CategoriaAppartenenza il parametro inserito
     */
    public String getCategoriaAppartenenza() {
        return CategoriaAppartenenza;
    }

    /**
     * Metodo che setta il campo Indirizzo
     * @param Indirizzo il parametro fissato
     */
    public void setIndirizzo(String Indirizzo) {
        this.Indirizzo = Indirizzo;
    }

    /**
     * Metodo che prende il campo Indirizzo
     * @return indirizzo il paramentro inserito
     */
    public String getIndirizzo() {
        return Indirizzo;
    }

    /**
     * Metodo che setta il valore Classe
     * @param classe il parametro fissato
     */
    public void setClasse(int Classe) {
        this.Classe = Classe;
    }

    /**
     * Metodo che prende il valore Classe
     * @return classe il parametro inserito
     */
    public int getClasse() {
        return Classe;
    }

    /**
     * Metodo che setta il campo Cognome
     * @param cognome il parametro fissato
     */
    public void setCognome(String Cognome) {
        this.Cognome = Cognome;
    }

    /**
     * Metodo che prende il campo Cognome
     * @return cognome il parametro inserito
     */
    public String getCognome() {
        return Cognome;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Genitore
     * @param Genitore � settato dopo la lettura
     */
    public void setGenitore(Genitore Genitore) {
        this.Genitore = Genitore;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Genitore
     * @return Genitore parametro preso dalla lettura
     */
    public Genitore getGenitore() {
        return Genitore;
    }

    /**
     * Metodo che setta il campo CodiceFiscale
     * @param CodiceFiscale il parametro fissato
     */
    public void setCodice_Fiscale(String Codice_Fiscale) {
        this.Codice_Fiscale = Codice_Fiscale;
    }

    /**
     * Metodo che prende il campo CodiceFiscale
     * @return codiceFiscale il parametro inserito
     */
    public String getCodice_Fiscale() {
        return Codice_Fiscale;
    }

    /**
     * Metodo che setta il parametro letto dalla classe assenza
     * @param assenza � settato dopo la lettura
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
