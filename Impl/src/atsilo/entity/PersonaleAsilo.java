package atsilo.entity;

public class PersonaleAsilo extends Utente {

    private String categoriaAppartenza;
    
    public PersonaleAsilo() {
    }

    public void setCategoriaAppartenza(String categoriaAppartenza) {
        this.categoriaAppartenza = categoriaAppartenza;
    }

    public String getCategoriaAppartenza() {
        return categoriaAppartenza;
    }
}
