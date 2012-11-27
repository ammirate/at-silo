package atsilo.entity;
import java.util.List;

public class Retta {
    
    private float importo;
    private String id;
    
    /**
     * La variabile extra è nulla c'è bisogno di una lettura della classe Extra
     */
    private List<Extra> extra;
    
    /**
     * La variabile genitore è nulla c'è bisogno di una lettura della classe Genitore
     */
    private Genitore genitore;

    /**
     * Costruttore vuoto
     */
    public Retta(){}
    
    /**
     * @param importo il paramentro è fissato
     * @param id il paramentro è fissato
     * @param extra è settato dopo la lettura 
     * @param genitore è settato dopo la lettura 
     */
    public Retta(float importo, String id, List<Extra> extra, Genitore genitore) {
        super();
        this.importo = importo;
        this.id = id;
        this.extra = extra;
        this.genitore = genitore;
    }

    /**
     * Metodo che prende il campo Id
     * @param id il parametro inserito
     */
    public void setId(String id){
        this.id=id;
        }
    
    /**
     * Metodo che prende il campo id
     * @return id il parametro inserito
     */
    public String getId(){
        return this.id;
        }
    
    /**
     * Metodo che prende il valore importo
     * @param importo il parametro inserito
     */
    public void setImporto(float importo){
        this.importo=importo;
        }
    
    /**
     * Metodo che prende il valore importo
     * @return importo il parametro inserito
     */
    public float getImporto(){
        return this.importo;
        }

    /**
     * Metodo che setta il parametro letto dalla classe Extra
     * @param extra è settato dopo la lettura
     */
    public void setExtra(List<Extra> extra) {
        this.extra = extra;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Extra
     * @return extra preso dalla lettura
     */
    public List<Extra> getExtra() {
        return extra;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Genitore
     * @param genitore è settato dopo la lettura
     */
    public void setGenitore(Genitore genitore) {
        this.genitore = genitore;
    }

    /**
     * Metodo che prende il parametro letto dalla classe genitore
     * @return genitore preso dalla lettura
     */
    public Genitore getGenitore() {
        return genitore;
    }
}
