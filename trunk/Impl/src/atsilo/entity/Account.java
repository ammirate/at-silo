package atsilo.entity;

public class Account implements Beans{
    
    private String userName;
    private String passWord;

    /**
     * La variabile � nulla c'� bisogno di una lettura da una della classe Utente e il 
     * valore pu� essere: Genitore, PersonaleAsilo, ResponsabileQuestionario e Psicopedagogo
     */
    private Utente owner;

    public Account() {}

    /**
     * Metodo che setta il campo userName
     * @param userName il parametro fissato
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    /**
     *  Metodo che prende il campo userName
     * @return userName il parametro inserito
     */
    public String getUserName() {
        return userName;
    }
    
    /**
     * Metodo che setta il campo passWord
     * @param passWord il parametro fissato
     */
    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }
    
    /**
     * Metodo che prende il campo passWord
     * @return passWord il parametro inserito
     */
    public String getPassWord() {
        return passWord;
    }
    
    /**
     * Metodo che setta il parametro letto dalla classe utente
     * @param owner � settato dopo la lettura
     */
    public void setOwner(Utente owner) {
        this.owner = owner;
    }

    /**
     * Metodo che prende il parametro letto dalla classe utente
     * @return owner parametro preso dalla lettura
     */
    public Utente getOwner() {
        return owner;
    }
}
