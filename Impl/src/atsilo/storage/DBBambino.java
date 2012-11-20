package atsilo.storage;

import atsilo.entity.Bambino;

public class DBBambino extends DBBeans {    
    public DBBambino(Database db){
        super("Bambino",db);
    }
    public Bambino getBambinoFromCF(String codiceFiscale){
        Bambino bambinoTemp;
        //query per selezionare bambino con quel codice fiscale
        //istruzioni varie
        return bambinoTemp;
        
    }
}
