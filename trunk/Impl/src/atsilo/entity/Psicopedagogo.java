package atsilo.entity;

<<<<<<< .mine
public class Psicopedagogo extends Utente{
    /**
     * @attribute
     */
       private String numero_classi;
=======
public class Psicopedagogo extends Utente {
>>>>>>> .r1309

<<<<<<< .mine
    /**
     * @attribute
     */
=======

    /**
     * @attribute
     */
    private String numeroClassi;

    /**
     * @attribute
     */
>>>>>>> .r1309
    private String titoloDiStudi;

<<<<<<< .mine
   
=======

>>>>>>> .r1309
    public Psicopedagogo() {
    }

<<<<<<< .mine
=======
    public void setNumeroClassi(String numeroClassi) {
        this.numeroClassi = numeroClassi;
    }
>>>>>>> .r1309

<<<<<<< .mine
    public void setNumero_classi(String numero_classi) {
        this.numero_classi = numero_classi;
    }

    public String getNumero_classi() {
        return numero_classi;
    }

    public void setTitolo_di_studio(String titolo_di_studio) {
        this.titolo_di_studio = titolo_di_studio;
    }

    public String getTitolo_di_studio() {
        return titolo_di_studio;
    }
=======
    public String getNumeroClassi() {
        return numeroClassi;
    }

    public void setTitoloDiStudi(String titoloDiStudi) {
        this.titoloDiStudi = titoloDiStudi;
    }

    public String getTitoloDiStudi() {
        return titoloDiStudi;
    }
>>>>>>> .r1309
}
