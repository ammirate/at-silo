package atsilo.entity;

public class Feedback {
    private int id;
    private String descrizione;
    private PersonaleAsilo personaleAsilo;
    
    
    public Feedback(){
    }


    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setPersonaleAsilo(PersonaleAsilo personaleAsilo) {
        this.personaleAsilo = personaleAsilo;
    }

    public PersonaleAsilo getPersonaleAsilo() {
        return personaleAsilo;
    }
}
