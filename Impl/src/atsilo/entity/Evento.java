package atsilo.entity;
import java.sql.Date;
import java.util.List;

public class Evento {
 

    private String Descrizione;
    private String Nome;
    private Date Data;
    private List<Classe> classi;
    private EventPlanner organizzatore;

    public Evento() {
    }

    public void setDescrizione(String Descrizione) {
        this.Descrizione = Descrizione;
    }

    public String getDescrizione() {
        return Descrizione;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public String getNome() {
        return Nome;
    }

    public void setData(Date Data) {
        this.Data = Data;
    }

    public Date getData() {
        return Data;
    }

    public void setClassi(List<Classe> classi) {
        this.classi = classi;
    }

    public List<Classe> getClassi() {
        return classi;
    }

    public void setOrganizzatore(EventPlanner organizzatore) {
        this.organizzatore = organizzatore;
    }

    public EventPlanner getOrganizzatore() {
        return organizzatore;
    }
}
