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
 *
 *-----------------------------------------------------------------
 */

package atsilo.entity;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;


public class Evento {
    
    private int id;
    
    private String descrizione;
    private String nome;
    private String CC;
    private Date data;
    private String tipo;
    private String path;
    
    
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
        this.id = 0;
        classi = new ArrayList<Classe>();
    }
    
    
    
    /**
     * @param descrizione il paramentro è fissato
     * @param nome il paramentro è fissato
     * @param cC  il paramentro è fissato
     * @param data  il paramentro è fissato
     * @param tipo  il paramentro è fissato
     * @param organizzatore è settato dopo la lettura
     * @param path il parametro è fissato
     */
    public Evento(String descrizione, String nome, String cC, Date data, String tipo,
            EventPlanner organizzatore, String path) {
        super();
        this.descrizione = descrizione;
        this.nome = nome;
        this.CC = cC;
        this.data = data;
        this.tipo = tipo;
        this.organizzatore = organizzatore;
        this.path = path;
        this.id = 0;
        classi = new ArrayList<Classe>();

    }
    
    
    
    
    /**
     * Restituisce il valore dell'id dell'evento
     * settato nel database in maniera autoincrementante
     * @return id
     */
    public int getId() {
        return id;
    }
    
    
    
    /**
     * Setta l'id dell'evento
     * @param nuovo id da assegnare all'evento
     */
    public void setId(int id) {
        this.id = id;
    }
    
    
    
    /**
     * Metodo che setta il campo descrizione
     * @param nuova descrizione da settare all'evento
     */   
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }
    
    
    
    /**
     * Metodo che restituisce il campo Descrizione
     * @return descrizione dell'evento
     */
    public String getDescrizione() {
        return descrizione;
    }
    
    
    
    /**
     * Metodo che setta il campo nome
     * @param vuovo nome da settare all'evento
     */   
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    /**
     * Metodo che restituisce il campo Nome
     * @return nome dell'evento
     */
    public String getNome() {
        return nome;
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
        return data;
    }
    
    
    /**
     * Metodo che setta il parametro letto dalla classe EventPlanner
     * @param u è settato dopo la lettura
     */
    public void setOrganizzatore(EventPlanner u) {
        this.organizzatore = u;
    }
    
    /**
     * Metodo che prende il parametro letto dalla classe EventPlanner
     * @return organizzatore preso dalla lettura
     */
    public EventPlanner getOrganizzatore() {
        return organizzatore;
    }
    
    
    
    /**
     * 
     * @param CC
     */
    public void setCC(String CC) {
        this.CC = CC;
    }
    
    
    /**
     * 
     * @return
     */
    public String getCC() {
        return CC;
    }
    
    /**
     * 
     * @param tipo
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
    /**
     * 
     * @return
     */
    public String getTipo() {
        return tipo;
    }
    
    
    /**
     * 
     * @param path
     */
    public void setPath(String path) {
        this.path = path;
    }
    
    
    
    /**
     * 
     * @return
     */
    public String getPath() {
        return path;
    }
    
    
    
    /**
     * 
     * @param classe
     */
    public void aggiungiClasse(Classe classe){
        classi.add(classe);
    }

    
    
    /**
     * @return classi
     */
    public List<Classe> getClassi() {
        return classi;
    }

    /**
     * @param classi nuovo classi
     */
    public void setClassi(List<Classe> classi) {
        this.classi = classi;
    }
    
    
}
