package atsilo.entity;

public class PersonaleAsilo extends Utente implements EventPlanner{
    
    private String categoriaAppartenenza;
    
    public PersonaleAsilo(){
        
    }

    public void setCategoriaAppartenenza(String categoriaAppartenenza) {
        this.categoriaAppartenenza = categoriaAppartenenza;
    }

    public String getCategoriaAppartenenza() {
        return categoriaAppartenenza;
    }
}
