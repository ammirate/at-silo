package atsilo.entity;

public class Richiesta {
    private int id;
    private String tipo;
    private String menuRichiesto;
    private String orarioRichiesto;
    private String allegato;
    
    
    public Richiesta(){}
    
    public void setId(int id){this.id=id;}
    public int getId(){return this.id;}
    
    public void setTipo(String tipo){this.tipo=tipo;}
    public String getTipo(){return this.tipo;}
    
    public void setMenuRichiesto(String menuRichiesto){this.menuRichiesto=menuRichiesto;}
    public String getMenuRichiesto(){return this.menuRichiesto;}
    
    public void setOrarioRichiesto(String orarioRichiesto){this.orarioRichiesto=orarioRichiesto;}
    public String getOrarioRichiesto(){return this.orarioRichiesto;}
    
    public void setAllegato(String allegato){this.allegato=allegato;}
    public String getAllegato(){return this.allegato;}
    
    
    
}
