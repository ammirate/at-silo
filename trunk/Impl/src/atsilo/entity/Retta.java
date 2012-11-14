package atsilo.entity;

public class Retta {
    private float importo;
    private String extra;
    private String id;
    
    
    
    
    public Retta(){}
    
    public void setId(String id){this.id=id;}
    
    public String getId(){return this.id;}
    
    public void setExtra(String extra){this.extra=extra;}
    
    public String getextra(){return this.extra;}
    
    public void setImporto(float importo){this.importo=importo;}
    
    public float getImporto(){return this.importo;}
    
}
