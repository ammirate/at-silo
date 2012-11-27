package atsilo.entity;
import java.sql.Date;

public class MenuMensa {
    
    //categoria_bambino,tipologia,primo_piatto,secondo_piatto,contorno,frutta,data,id
    private String id;
    private String categoriaBambino;
    private String tipologia;
    private String primoPiatto;
    private String secondoPiatto;
    private String contorno;
    private String frutta;
    private Date data;
    
    /**
     * Costruttore vuoto
     */
    public MenuMensa() {
    }
    
    /**
     * @param id il paramentro è fissato
     * @param categoriaBambino il paramentro è fissato
     * @param tipologia il paramentro è fissato
     * @param primoPiatto il paramentro è fissato
     * @param secondoPiatto il paramentro è fissato
     * @param contorno il paramentro è fissato
     * @param frutta il paramentro è fissato
     * @param data il paramentro è fissato
     */
    public MenuMensa(String id, String categoriaBambino, String tipologia,
            String primoPiatto, String secondoPiatto, String contorno,
            String frutta, Date data) {
        super();
        this.id = id;
        this.categoriaBambino = categoriaBambino;
        this.tipologia = tipologia;
        this.primoPiatto = primoPiatto;
        this.secondoPiatto = secondoPiatto;
        this.contorno = contorno;
        this.frutta = frutta;
        this.data = data;
    }


    /**
     * Metodo che setta il parametro id
     * @param id il parametro fissato
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * Metodo che prende il parametro Id
     * @return id il parametro inserito
     */
    public String getId() {
        return id;
    }

    /**
     * Metodo che setta il parametro categoria bambino
     * @param categoriaBambino il parametro fissato
     */
    public void setCategoriaBambino(String categoriaBambino) {
        this.categoriaBambino = categoriaBambino;
    }

    /**
     * Metodo che prende il parametro categoria bambino
     * @return categoriaBambino il parametro inserito
     */
    public String getCategoriaBambino() {
        return categoriaBambino;
    }

    /**
     * Metodo che setta il parametro tipologia
     * @param tipologia il parametro fissato
     */
    public void setTipologia(String tipologia) {
        this.tipologia = tipologia;
    }

    /**
     * Metodo che prende il parametro tipologia
     * @return tipologia il parametro inserito
     */
    public String getTipologia() {
        return tipologia;
    }

    /**
     * Metodo che setta il parametro primo piatto
     * @param primoPiatto il parametro fissato
     */
    public void setPrimoPiatto(String primoPiatto) {
        this.primoPiatto = primoPiatto;
    }

    /**
     * Metodo che prende il parametro PrimoPiatto
     * @return primoPiatto il parametro inserito
     */
    public String getPrimoPiatto() {
        return primoPiatto;
    }

    /**
     * Metodo che setta il parametro secondo piatto
     * @param secondoPiatto il parametro fissato
     */
    public void setSecondoPiatto(String secondoPiatto) {
        this.secondoPiatto = secondoPiatto;
    }

    /**
     * Metodo che prende il parametro Secondo piatto
     * @return secondoPiatto il parametro inserito
     */
    public String getSecondoPiatto() {
        return secondoPiatto;
    }
    
    /**
     * Metodo che setta il parametro controno
     * @param contorno il parametro fissato
     */
    public void setContorno(String contorno) {
        this.contorno = contorno;
    }

    /**
     * Metodo che prende il parametro contorno
     * @return contorno il parametro inserito
     */
    public String getContorno() {
        return contorno;
    }

    /**
     * Metodo che setta il parametro frutta
     * @param frutta il parametro fissato
     */
    public void setFrutta(String frutta) {
        this.frutta = frutta;
    }

    /**
     * Metodo che prende il parametro frutta
     * @return frutta il parametro inserito
     */
    public String getFrutta() {
        return frutta;
    }

    /**
     * Metodo che setta il parametro data
     * @param data il parametro fissato
     */
    public void setData(Date data) {
        this.data = data;
    }

    /**
     * Metodo che prende il parametro Data
     * @return data il parametro inserito
     */
    public Date getData() {
        return data;
    }
}
