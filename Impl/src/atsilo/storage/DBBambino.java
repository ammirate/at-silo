package atsilo.storage;

import atsilo.entity.Bambino;

public class DBBambino extends DBBeans {    
    /**
     * Costruttore 
     * @param db 
     */
    public DBBambino(Database db){super("Bambino",db);}
    
    
    public Bambino ricercaBambinoPerCodFiscale(String codicefiscale){} //modificato
    
    public Bambino ricercaBambinoPerDataNascita(Date d){} //aggiunto
    
    public Bambino ricercaBambinoPerNome(String nome){}//aggiunto
    
    public Bambino ricercaBambinoPerCognome(String cognome){}//aggiunto
    
    public String ricercaIndirizzoBambino(Bambino b){}//aggiunto
    
    public int ricercaClasseBambino(Bambino b)//aggiunto
    
    public String ricercaGenitore(Bambino b)//aggiunto
    
    
}
