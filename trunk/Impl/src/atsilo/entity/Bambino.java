package atsilo.entity;

public class Bambino {
    
    private String nome;
    private String cognome;
    private String codFiscale;
    private String dataNascita;
    private String comuneNascita;
    private String indirizzo;
    
    public Bambino() {
    }

    public String getNome() {
            return nome;
    }

    public void setNome(String nome) {
            this.nome = nome;
    }

    public String getCognome() {
            return cognome;
    }

    public void setCognome(String cognome) {
            this.cognome = cognome;
    }

    public String getCodFiscale() {
            return codFiscale;
    }

    public void setCodFiscale(String codFiscale) {
            this.codFiscale = codFiscale;
    }

    public String getDataNascita() {
            return dataNascita;
    }

    public void setDataNascita(String dataNascita) {
            this.dataNascita = dataNascita;
    }

    public String getComuneNascita() {
            return comuneNascita;
    }

    public void setComuneNascita(String comuneNascita) {
            this.comuneNascita = comuneNascita;
    }

    public String getIndirizzo() {
            return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
            this.indirizzo = indirizzo;
    }
}
