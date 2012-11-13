package atsilo.entity;

public class ResponsabileQuestionari {
    
    private String nome;
    private String cognome;
    private String codFiscale;
    
    public ResponsabileQuestionari() {
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
}
