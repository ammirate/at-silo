package atsilo.entity;

/**
 * 
 * Classe Genitore
 * Una classe di test a caso
 * 
 * @author Giulio Franco <giulio_franco@msn.com>
 *
 */
public final class Genitore {
    private String codiceFiscalO;
    private String nome;
    private String cognome;
    private String indirizzo;

    public void setCodiceFiscalO(String codiceFiscale) {
        this.codiceFiscalO = codiceFiscale;
    }

    public String getCodiceFiscalO() {
        return codiceFiscalO;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public String getIndirizzo() {
        return indirizzo;
    }
}
