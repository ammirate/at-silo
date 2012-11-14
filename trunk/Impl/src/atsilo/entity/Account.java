package atsilo.entity;

public class Account{
    
            private String userName;
            private String passWord;
            private String stato;
    private Utente owner;

    public Account() {}


    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setStato(String stato) {
        this.stato = stato;
    }

    public String getStato() {
        return stato;
    }

    public void setOwner(Utente owner) {
        this.owner = owner;
    }

    public Utente getOwner() {
        return owner;
    }
}
