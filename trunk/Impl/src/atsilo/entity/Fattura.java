package atsilo.entity;

public class Fattura {
    private int id;
    private String descrizione;
    private PersonaleAsilo personaleAsilo;


    public Fattura(){
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
