package atsilo.entity;

public class Psicopedagogo extends Utente implements EventPlanner{
    
    private int numeroClassi;
    
    public Psicopedagogo(){       
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
