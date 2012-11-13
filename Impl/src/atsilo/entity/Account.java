package atsilo.entity;

public class Account {
    
            private String userName;
            private String passWord;
            private String stato;
            
            public Account() {
            }

            public String getUserName() {
                    return userName;
            }

            public void setUserName(String userName) {
                    this.userName = userName;
            }

            public String getPassWord() {
                    return passWord;
            }

            public void setPassWord(String passWord) {
                    this.passWord = passWord;
            }

            public String getStato() {
                    return stato;
            }

            public void setStato(String stato) {
                    this.stato = stato;
            }
}
