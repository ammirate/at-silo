package atsilo.entity;
import java.sql.Date;
import java.util.List;

public class Bambino {
    /**
     * @attribute
     */
    private String Nome;

    /**
     * @attribute
     */
    private Date DataNascita;

    /**
     * @attribute
     */
    private String CategoriaAppartenenza;

    /**
     * @attribute
     */
    private String Indirizzo;

    /**
     * @attribute
     */
    private int Classe;

    /**
     * @attribute
     */
    private String Cognome;

    /**
     * @attribute
     */
    private Genitore Genitore;

    /**
     * @attribute
     */
    private String Codice_Fiscale;

    private Assenza assenze;

    public Bambino() {
    }


    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public String getNome() {
        return Nome;
    }

    public void setDataNascita(Date DataNascita) {
        this.DataNascita = DataNascita;
    }

    public Date getDataNascita() {
        return DataNascita;
    }

    public void setCategoriaAppartenenza(String CategoriaAppartenenza) {
        this.CategoriaAppartenenza = CategoriaAppartenenza;
    }

    public String getCategoriaAppartenenza() {
        return CategoriaAppartenenza;
    }

    public void setIndirizzo(String Indirizzo) {
        this.Indirizzo = Indirizzo;
    }

    public String getIndirizzo() {
        return Indirizzo;
    }

    public void setClasse(int Classe) {
        this.Classe = Classe;
    }

    public int getClasse() {
        return Classe;
    }

    public void setCognome(String Cognome) {
        this.Cognome = Cognome;
    }

    public String getCognome() {
        return Cognome;
    }

    public void setGenitore(Genitore Genitore) {
        this.Genitore = Genitore;
    }

    public Genitore getGenitore() {
        return Genitore;
    }

    public void setCodice_Fiscale(String Codice_Fiscale) {
        this.Codice_Fiscale = Codice_Fiscale;
    }

    public String getCodice_Fiscale() {
        return Codice_Fiscale;
    }

    public void setAssenze(List<Assenza> assenze) {
        this.assenze = assenze;
    }

    public List<Assenza> getAssenze() {
        return assenze;
    }
}
