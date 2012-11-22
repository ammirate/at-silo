package atsilo.entity;

public class PersonaleAsilo extends Utente implements EventPlanner{
    
    private String categoriaAppartenenza;
    
    public PersonaleAsilo(){
        
    }
    
    /**
     * Metodo che setta il parametro categoriaAppartenenza
     * @param categoriaAppartenenza il parametro fissato
     */
    public void setCategoriaAppartenenza(String categoriaAppartenenza) {
        this.categoriaAppartenenza = categoriaAppartenenza;
    }

    /**
     * Metodo che prende il parametro CategoriaAppartenenz
     * @return CategoriaAppartenenz il parametro inserito
     */
    public String getCategoriaAppartenenza() {
        return categoriaAppartenenza;
    }
}
