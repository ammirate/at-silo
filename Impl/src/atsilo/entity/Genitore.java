package atsilo.entity;

import java.util.List;

public class Genitore {
    /**
     * @attribute
     */
    private Date dataNascita;

    /**
     * @attribute
     */
    private String CodiceFiscale;

    /**
     * @attribute
     */
    private String ComuneNascita;

    /**
     * @attribute
     */
    private String Email;

    /**
     * @attribute
     */
    private String indirizzoResidenza;

    /**
     * @attribute
     */
    private String tipo;

    /**
     * @attribute
     */
    private String Cognome;

    /**
     * @attribute
     */
    private String Telefono;

    /**
     * @attribute
     */
    private String nome;
    
    private  List<Bambino> figli;
    
    private List<Questionario> questionariCompilati;

    public Genitore() {
    }

    public void setIndirizzoResidenza(String add) {
    }

    public void setTelefono(String t) {
    }

    public String getTelefono() {
    }

    public void setComuneNascita(String cm) {
    }

    public String getEmail() {
    }

    public String getTipo() {
    }

    public String getComuneNascita() {
    }

    public String getCognome() {
    }

    public String getIndirizzoResidenza() {
    }

    public String getCodiceFiscale() {
    }

    public void setEmail(String m) {
    }

    public String getNome() {
    }

    public Date getDataNascita() {
    }

    public void setCodiceFiscale(Object cf) {
    }

    public void addFiglio(Bambino bambino) {
    }

    public List<Bambino> getFigli() {
        return null;
    }

    public void addQuestionarioCompilato(Questionario questionario) {
    }

    public List<Questionario> getQuestionariCompilati() {
        return null;
    }
}
