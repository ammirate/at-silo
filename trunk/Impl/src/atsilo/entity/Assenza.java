package atsilo.entity;
import java.sql.Date;

public class Assenza {
    
    /**
     * @attribute data di tipo DATE
     */
    private Date data;
    
    /**
     * La variabile Bambino è nulla c'è bisogno di una lettura della classe Bambino
     */
    private Bambino bambino;
    
    public Assenza() {
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
    public String getData() {
        return Data;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Bambino
     * @param Bambino è settato dopo la lettura
     */    
    public void setRegistro(Bambino Bambino) {
        this.bambino = bambino;
    }
    
    /**
     * Metodo che prende il parametro letto dalla classe Bambino
     * @return bambino parametro preso dalla lettura
     */
    public Bambino getBambino() {
        return Bambino;
    }
    
    
    
}