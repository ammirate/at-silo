package atsilo.entity;

import java.sql.Date;

public class PersonaleAsilo extends Utente implements EventPlanner{
    
    private String categoriaAppartenenza;
    
    /**
     * Costruttore vuoto
     */
    public PersonaleAsilo(){}
    
    /**
     * @param categoriaAppartenenza è settato dopo la lettura 
     */
    public PersonaleAsilo(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String residenza, String categoriaAppartenenza) {
        super(dataNascita, nome, cognome, codiceFiscale, email, comuneNascita, telefono, residenza);
        this.categoriaAppartenenza = categoriaAppartenenza;
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
