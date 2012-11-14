package atsilo.entity;

public class EducatoreDidattico extends Utente{
    /**
     * @attribute
     */
    private String Titolo_di_studio;


    /**
     * @attribute
     */
    public void setTitolo_di_studio(String Titolo_di_studio) {
        this.Titolo_di_studio = Titolo_di_studio;
    }

    public String getTitolo_di_studio() {
        return Titolo_di_studio;
    }
}
