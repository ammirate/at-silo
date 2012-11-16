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
    
    public MenuMensa() {
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setCategoriaBambino(String categoriaBambino) {
        this.categoriaBambino = categoriaBambino;
    }

    public String getCategoriaBambino() {
        return categoriaBambino;
    }

    public void setTipologia(String tipologia) {
        this.tipologia = tipologia;
    }

    public String getTipologia() {
        return tipologia;
    }

    public void setPrimoPiatto(String primoPiatto) {
        this.primoPiatto = primoPiatto;
    }

    public String getPrimoPiatto() {
        return primoPiatto;
    }

    public void setSecondoPiatto(String secondoPiatto) {
        this.secondoPiatto = secondoPiatto;
    }

    public String getSecondoPiatto() {
        return secondoPiatto;
    }

    public void setContorno(String contorno) {
        this.contorno = contorno;
    }

    public String getContorno() {
        return contorno;
    }

    public void setFrutta(String frutta) {
        this.frutta = frutta;
    }

    public String getFrutta() {
        return frutta;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Date getData() {
        return data;
    }
}
