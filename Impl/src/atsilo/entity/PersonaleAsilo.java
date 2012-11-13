package atsilo.entity;

public class PersonaleAsilo {
    
    private String nome;
    private String cognome;
    private String codFiscale;
    private String categoriaAppartenza;
    
    public PersonaleAsilo() {
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

    public String getCategoriaAppartenza() {
            return categoriaAppartenza;
    }

    public void setCategoriaAppartenza(String categoriaAppartenza) {
            this.categoriaAppartenza = categoriaAppartenza;
    }
}
