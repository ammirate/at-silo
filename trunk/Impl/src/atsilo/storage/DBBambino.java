package atsilo.storage;

import atsilo.entity.Bambino;

public class DBBambino extends DBBeans {
    Tabella tabella;
    
    public DBBambino(){
        tabella= new Tabella("Bambino");
        super(tabella);
    }
    public Bambino getBambinoFromCF(String codiceFiscale){
        Bambino bambinoTemp;
        //query per selezionare bambino con quel codice fiscale
        //istruzioni varie
        return bambinoTemp;
        
    }
}
