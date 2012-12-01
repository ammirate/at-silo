package atsilo.entity;

import java.sql.Date;

public class Psicopedagogo extends Utente implements EventPlanner{
    
    private int numeroClassi;
    
    /**
     * Costruttore vuoto
     */
    public Psicopedagogo(){       
    }
    
    /**
     * @param numeroClassi il paramentro è fissato
     */
    public Psicopedagogo(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String residenza, int numeroClassi) {
        super(dataNascita, nome, cognome, codiceFiscale, email, comuneNascita, telefono, residenza);
        this.numeroClassi = numeroClassi;
    }

    /**
     * Metodo che setta il valroe numero classi
     * @param numeroClassi il parametro fissato
     */
    public void setNumeroClassi(int numeroClassi) {
        this.numeroClassi = numeroClassi;
    }

    /**
     * Metodo che prende il valore numero classi
     * @return numeroClassi il parametro inserito
     */
    public int getNumeroClassi() {
        return numeroClassi;
    }
}
