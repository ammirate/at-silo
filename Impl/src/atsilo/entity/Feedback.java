package atsilo.entity;

public class Feedback {
    private int id;
    private String descrizione;
    
    /**
     * La variabile personaleAsilo è nulla c'è bisogno di una lettura della classe PersonaleAsilo
     */
    private PersonaleAsilo personaleAsilo;
    
    /**
     * Costruttore vuoto
     */
    public Feedback(){
    }
    
    /**
     * @param id il parametro fissato
     * @param descrizione il parametro fissato
     * @param personaleAsilo è settato dopo la lettura
     */
    public Feedback(int id, String descrizione, PersonaleAsilo personaleAsilo) {
        super();
        this.id = id;
        this.descrizione = descrizione;
        this.personaleAsilo = personaleAsilo;
    }



    /**
     * Metodo che prende il valore Id
     * @param id il parametro inserito
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Metodo che prende il valore Id
     * @return id il parametro inserito
     */
    public int getId() {
        return id;
    }

    /**
     * Metodo che setta il campo importo
     * @param descrizione il parametro fissato
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    /**
     * Metodo che prende il campo Descrizione
     * @return descrizione il parametro inserito
     */
    public String getDescrizione() {
        return descrizione;
    }

    /**
     * Metodo che setta il parametro letto dalla classe PersonaleAsilo
     * @param personaleAsilo è settato dopo la lettura
     */
    public void setPersonaleAsilo(PersonaleAsilo personaleAsilo) {
        this.personaleAsilo = personaleAsilo;
    }

    /**
     * Metodo che prende il parametro letto dalla classe PersonaleAsilo
     * @return personaleAsilo preso dalla lettura
     */
    public PersonaleAsilo getPersonaleAsilo() {
        return personaleAsilo;
    }
}
