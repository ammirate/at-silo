package atsilo.entity;


public class Psicopedagogo extends Utente implements EventPlanner{
    
    private int numeroClassi;
    
    public Psicopedagogo(){
        
    }


    public void setNumeroClassi(int numeroClassi) {
        this.numeroClassi = numeroClassi;
    }

    public int getNumeroClassi() {
        return numeroClassi;
    }
}
