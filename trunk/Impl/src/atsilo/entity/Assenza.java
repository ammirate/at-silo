package atsilo.entity;
import java.sql.Date;

public class Assenza {
    
    /**
     * @attribute data di tipo Date
     */
    private Date data;
    
    /**
     * La variabile Bambino è nulla c'è bisogno di una lettura della classe Bambino
     */
    private Bambino bambino;
    
    /**
     * Costruttore vuoto
     */
    public Assenza() {
    }

    /**
     * 
     * @param data
     * @param bambino
     */
    public Assenza(Date data, Bambino bambino) {
        super();
        this.data = data;
        this.bambino = bambino;
    }
    
    /**
     * Metodo che setta il campo data
     * @param data il parametro fissato
     */
    public void setData(Date data) {
        this.data = data;
    }
    
    /**
     * Metodo che prende il campo data
     * @return data il parametro inserito
     */
    public Date getData() {
        return data;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Bambino
     * @param bambino è settato dopo la lettura
     */    
    public void setRegistro(Bambino bambino) {
        this.bambino = bambino;
    }
    
    /**
     * Metodo che prende il parametro letto dalla classe Bambino
     * @return Bambino parametro preso dalla lettura
     */
    public Bambino getBambino() {
        return bambino;
    }
    
    
    
}