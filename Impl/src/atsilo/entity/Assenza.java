package atsilo.entity;
import java.sql.Date;

public class Assenza {
    
    /**
     * @attribute data di tipo Date
     */
    private Date data;
    
   
    private String codicefiscale;
    
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
    public Assenza(Date data, String cf) {
        super();
        this.data = data;
        this.codicefiscale = cf;
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