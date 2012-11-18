package application;

import atsilo.entity.*;
import java.util.List;
import java.sql.Date;

public class ControlRegistro {

    Registro registro;
    
    public ControlRegistro() {
        
    }
    
    //---------- Assenze---------
    public void inserisciAssenza(Bambino bambino, Date data){}
    
    public Assenza eliminaAssenza(Bambino bambino, Date data){
        return null;
    }
            
    public List<Assenza> visualizzaAssenzeGiorno(Date data){
        return null;  
    }
    //-----------------------------
    
 
    public void inserisciAttivita(Attivita attivita){}
    
    public void modificaAttivita(String attivita){}
    
    public Attivita eliminaAttivita(String titolo){
        return null;
    }
    
    public Attivita ricercaAttivitaPerTitolo(String titolo){
        return null;
    }
    
    public List<Attivita> ricercaAttivitaPerCategoria(String categoria){
        return null;
    }
    
    public void inserisciEvento(Evento evento){}
    
    public void modificaEvento(Evento evento){}
    
    public Evento eliminaEvento(Evento evento){
        return null;
    }

    public void spostaEvento(Evento evento, Date newData){}
    
    public List<Evento> getEventiPerPersonale(PersonaleAsilo pers){
        return null;
    }
    
    public List<Evento> getEventiInData(Date data){
        return null;
    }
    
    
    
}
