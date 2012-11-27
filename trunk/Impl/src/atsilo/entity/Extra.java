package atsilo.entity;

import java.sql.Date;
import java.util.List;


public class Extra {
    private float importo;
    private String descrizione;
    private String id;
    private Date dataInizio;
    private Date dataFine;
    private List<Retta> retteAssociate;

    /**
     * Costruttore vuoto
     */
    public Extra(){
    }

    /**
     * @param importo il paramentro è fissato
     * @param descrizione il paramentro è fissato
     * @param id il paramentro è fissato
     * @param dataInizio il paramentro è fissato
     * @param dataFine il paramentro è fissato
     * @param retteAssociate fissato dopo la lettura
     */
    public Extra(float importo, String descrizione, String id, Date dataInizio,
            Date dataFine, List<Retta> retteAssociate) {
        super();
        this.importo = importo;
        this.descrizione = descrizione;
        this.id = id;
        this.dataInizio = dataInizio;
        this.dataFine = dataFine;
        this.retteAssociate = retteAssociate;
    }

    /**
     * Metodo che prende il valore importo
     * @return importo il parametro inserito
     */
    public float getImporto() {
        return importo;
    }

    /**
     * Metodo che setta il valore importo
     * @param importo il parametro fissato
     */
    public void setImporto(float importo) {
        this.importo = importo;
    }
    
    /**
     * Metodo che prende il campo Descrizione
     * @return descrizione il parametro inserito
     */
    public String getDescrizione() {
        return descrizione;
    }

    /**
     * Metodo che setta il campo descrizione
     * @param descrizione il parametro fissato
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    /**
     * Metodo che prende il campo Id
     * @return id il parametro inserito
     */
    public String getId() {
        return id;
    }

    /**
     * Metodo che setta il campo Id
     * @param id il parametro fissato
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * Metodo che prende il campo DataInizio
     * @return dataInizio il parametro inserito
     */
    public Date getDataInizio() {
        return dataInizio;
    }

    /**
     * Metodo che setta il campo dataInizio
     * @param dataInizio il parametro fissato
     */
    public void setDataInizio(Date dataInizio) {
        this.dataInizio = dataInizio;
        }

    /**
     * Metodo che prende il campo DataFine
     * @return DataFine il parametro inserito
     */
    public Date getDataFine() {
        return dataFine;
    }
    
    /**
     * Metodo che setta il campo dataFine
     * @param dataFine il parametro fissato
     */
    public void setDataFine(Date dataFine) {
        this.dataFine = dataFine;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Retta
     * @return RetteAssociate preso dalla lettura
     */
    public List<Retta> getRetteAssociate() {
        return retteAssociate;
    }
    
    /**
     * Metodo che setta il parametro letto dalla classe assenza
     * @param retteAssociate è settato dopo la lettura
     */
    public void setRetteAssociate(List<Retta> retteAssociate) {
        this.retteAssociate = retteAssociate;
    }
}
