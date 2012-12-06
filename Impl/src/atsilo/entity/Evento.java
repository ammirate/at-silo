package atsilo.entity;
import java.sql.Date;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Evento.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 13/11/2012 (non responsabile)
 * REVISION
 * Andrea Micco, 6/12/2012
 *-----------------------------------------------------------------
 */

public class Evento {

    private String Descrizione;
    private String Nome;
    private List<String> CC;
    private Date data;
    private String Tipo;
    private String path;
    
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

    /**
     * Costruttore vuoto
     */
    public Evento() {
    }
  
    /**
     * @param descrizione il paramentro è fissato
     * @param nome il paramentro è fissato
     * @param cC  il paramentro è fissato
     * @param data  il paramentro è fissato
     * @param tipo  il paramentro è fissato
     * @param data2  il paramentro è fissato
     * @param classi è settato dopo la lettura
     * @param organizzatore è settato dopo la lettura
     * @param path il parametro è fissato
     */
    public Evento(String descrizione, String nome, List<String> cC, Date data,
            String tipo, Date data2, List<Classe> classi,
            EventPlanner organizzatore, String path) {
        super();
        Descrizione = descrizione;
        Nome = nome;
        CC = cC;
        this.data = data;
        Tipo = tipo;
        Data = data2;
        this.classi = classi;
        this.organizzatore = organizzatore;
        this.path = path;
    }

    /**
     * Metodo che setta il campo descrizione
     * @param Descrizione il parametro fissato
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
     * @param Nome il parametro fissato
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
     * @param data il parametro fissato
     */   
    public void setData(Date data) {
        this.data = data;
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
    
    public void setPath(String path) {
        this.path = path;
    }

    public String getPath() {
        return path;
    }
}
