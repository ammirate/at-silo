package atsilo.entity;

public class Feedback {
    private int id;
    private String descrizione;
    
    
    public Feedback(){}
    
    public void setId(int id){this.id=id;}
    public int getId(){return this.id;}
    
    public void setDescrizione(String descrizione){this.descrizione=descrizione;}
    public String getDescrizione(){return this.descrizione;}
}
