package atsilo.entity;
import java.sql.Date;

public class Assenza {
    
    /**
     * @attribute data di tipo Date
     */
    private Date data;
    
   
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
    public Assenza(Date data, Bambino b) {
        super();
        this.data = data;
        this.bambino = b;
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


    
    
    
}