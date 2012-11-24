package atsilo.entity;
import java.sql.Date;
import java.util.List;

public class Evento {
 

    private String Descrizione;
    private String Nome;
    private List<String> CC;
    private Date data;
    private String Tipo;
   // private 
    
    /**
     * @attribute Data di tipo DATE
     */
    private Date Data;
    
    /**
     * La variabile classi è nulla c'è bisogno di una lettura della classe "Classe"
     */
    private List<Classe> classi;
    
    /**
     * La variabile organizzatore è nulla c'è bisogno di una lettura della classe EventPlanner
     */
    private EventPlanner organizzatore;

    public Evento() {
    }

    /**
     * Metodo che setta il campo descrizione
     * @param descrizione il parametro fissato
     */   
    public void setDescrizione(String Descrizione) {
        this.Descrizione = Descrizione;
    }

    /**
     * Metodo che prende il campo Descrizione
     * @return Descrizione il parametro inserito
     */
    public String getDescrizione() {
        return Descrizione;
    }

    /**
     * Metodo che setta il campo nome
     * @param nome il parametro fissato
     */   
    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    /**
     * Metodo che prende il campo Nome
     * @return Nome il parametro inserito
     */
    public String getNome() {
        return Nome;
    }

    /**
     * Metodo che setta il campo data
     * @param Data il parametro fissato
     */   
    public void setData(Date Data) {
        this.Data = Data;
    }

    /**
     * Metodo che prende il campo Data
     * @return data il parametro inserito
     */
    public Date getData() {
        return Data;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Classe
     * @param classi è settato dopo la lettura
     */
    public void setClassi(List<Classe> classi) {
        this.classi = classi;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Classe
     * @return classi preso dalla lettura
     */
    public List<Classe> getClassi() {
        return classi;
    }

    /**
     * Metodo che setta il parametro letto dalla classe EventPlanner
     * @param organizzatore è settato dopo la lettura
     */
    public void setOrganizzatore(EventPlanner organizzatore) {
        this.organizzatore = organizzatore;
    }

    /**
     * Metodo che prende il parametro letto dalla classe EventPlanner
     * @return organizzatore preso dalla lettura
     */
    public EventPlanner getOrganizzatore() {
        return organizzatore;
    }

    public void setCC(List<String> CC) {
        this.CC = CC;
    }

    public List<String> getCC() {
        return CC;
    }

    public void setData1(Date data) {
        this.data = data;
    }

    public Date getData1() {
        return data;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public String getTipo() {
        return Tipo;
    }
}
