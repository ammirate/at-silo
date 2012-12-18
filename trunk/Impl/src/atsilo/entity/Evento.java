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

package atsilo.entity;
import java.sql.Date;
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
    private Utente organizzatore;
    
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
     * @param organizzatore è settato dopo la lettura
     * @param path il parametro è fissato
     */
    public Evento(String descrizione, String nome, String cC, Date data, String tipo,
            Utente organizzatore, String path) {
        super();
        this.descrizione = descrizione;
        this.nome = nome;
        this.CC = cC;
        this.data = data;
        this.tipo = tipo;
        this.organizzatore = organizzatore;
        this.path = path;
        // l'id viene settato nel layer storage, perchè è Autoincrement
    }
    /**
     * @return id
     */
    public int getId() {
        return id;
    }
    
    /**
     * @param id nuovo id
     */
    public void setId(int id) {
        this.id = id;
    }
    
    /**
     * Metodo che setta il campo descrizione
     * @param descrizione il parametro fissato
     */   
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }
    
    /**
     * Metodo che prende il campo Descrizione
     * @return Descrizione il parametro inserito
     */
    public String getDescrizione() {
        return descrizione;
    }
    
    /**
     * Metodo che setta il campo nome
     * @param nome il parametro fissato
     */   
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    /**
     * Metodo che prende il campo Nome
     * @return Nome il parametro inserito
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
    public void setOrganizzatore(Utente u) {
        this.organizzatore = u;
    }
    
    /**
     * Metodo che prende il parametro letto dalla classe EventPlanner
     * @return organizzatore preso dalla lettura
     */
    public Utente getOrganizzatore() {
        return organizzatore;
    }
    
    public void setCC(String CC) {
        this.CC = CC;
    }
    
    public String getCC() {
        return CC;
    }
    
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    public String getTipo() {
        return tipo;
    }
    
    public void setPath(String path) {
        this.path = path;
    }
    
    public String getPath() {
        return path;
    }
}
