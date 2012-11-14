package atsilo.entity;
import java.util.List;

public class Retta {
    private float importo;
    private String id;
    private List<Extra> extra;
    private Genitore genitore;


    public Retta(){}
    
    public void setId(String id){this.id=id;}
    
    public String getId(){return this.id;}
    

    
    public void setImporto(float importo){this.importo=importo;}
    
    public float getImporto(){return this.importo;}

    public void setExtra(List<Extra> extra) {
        this.extra = extra;
    }

    public List<Extra> getExtra() {
        return extra;
    }

    public void setGenitore(Genitore genitore) {
        this.genitore = genitore;
    }

    public Genitore getGenitore() {
        return genitore;
    }
}
