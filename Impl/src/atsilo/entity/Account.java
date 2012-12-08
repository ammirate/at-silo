package atsilo.entity;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Account.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class Account implements Beans{

    private String userName;
    private String passWord;

    /**
     * La variabile è nulla bisogna leggere dalla classe Utente
     */
    private String owner;

    /**
     * Costruttore vuoto
     */
    public Account() {}

    /**
     * 
     * @param userName il parametro è settato
     * @param passWord il paramentro è settato
     * @param owner il parametro preso in lettura
     */
    public Account(String userName, String passWord, String owner) {
        super();
        this.userName = userName;
        this.passWord = passWord;
        this.owner = owner;
    }
    
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
     * @param owner è settato dopo la lettura
     */
    public void setOwner(String owner) {
        this.owner = owner;
    }

    /**
     * Metodo che prende il parametro letto dalla classe utente
     * @return owner parametro preso dalla lettura
     */
    public String getOwner() {
        return owner;
    }
}
