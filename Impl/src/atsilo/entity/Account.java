package atsilo.entity;

import commonj.sdo.DataObject;
import commonj.sdo.helper.DataFactory;

import commonj.sdo.helper.XSDHelper;

import javax.ejb.Remote;
import javax.ejb.Stateless;

@Stateless(name = "AccountSDO", mappedName = "AtsiloApplication-Atsilo-AccountSDO")
@Remote
public class Account{
    
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

    public DataObject getUserNameSDO() throws RuntimeException {
        commonj.sdo.DataObject dataObject = DataFactory.INSTANCE.create(String.class);
        dataObject.set(0, getUserName());
        return dataObject;
    }

    public void setUserNameSDO(String userName) throws RuntimeException {
        setUserName(userName);
    }

    public DataObject getPassWordSDO() throws RuntimeException {
        commonj.sdo.DataObject dataObject = DataFactory.INSTANCE.create(String.class);
        dataObject.set(0, getPassWord());
        return dataObject;
    }

    public void setPassWordSDO(String passWord) throws RuntimeException {
        setPassWord(passWord);
    }

    public DataObject getStatoSDO() throws RuntimeException {
        commonj.sdo.DataObject dataObject = DataFactory.INSTANCE.create(String.class);
        dataObject.set(0, getStato());
        return dataObject;
    }

    public void setStatoSDO(String stato) throws RuntimeException {
        setStato(stato);
    }
    static {
        synchronized (Account.class) {
            try {
                ClassLoader loader = Thread.currentThread().getContextClassLoader();
                XSDHelper.INSTANCE.define(loader.getResourceAsStream("atsilo/entity/AccountWS.xsd"), "atsilo/entity/");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
