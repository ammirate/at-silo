package atsilo.storage;
import atsilo.storage.DBBambino;

import java.util.ArrayList;
import java.util.List;

public class DBAccount extends DBBeans {
   Tabella tabella;

    
    public DBAccount(){
        tabella= new Tabella("Account");
        super(tabella);
    }
   
    }

  
}
