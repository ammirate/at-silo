package application;

import atsilo.entity.Bambino;
import atsilo.entity.Genitore;
import atsilo.entity.OrarioUtente;
import atsilo.entity.Richiesta;
import atsilo.entity.Servizio;

import java.util.List;

public class ControlServizio {
private static final ControlServizio cs;
    private ControlServizio(){
    
}
public static ControlServizio getInstance(){
    return cs;
}
public void inserisciServizio (Servizio s){
    
}
public void modificaServizio(Servizio s){
    
}
public List<Servizio> ricercaServizio (Servizio s){
    return null;
}

public List<Servizio> getElencoServizio(){
    return null;
}
public List<Servizio> getServizioPerBambino(Bambino b){
        return null;
    }
public List<Servizio> getServizioPerId(String id){
            return null;
        }

public void inserisciRichiesta (Richiesta r){
    
}
public Richiesta eliminaRichiesta (Richiesta r){
    return null;
}

public List<Richiesta> getElencoRichiesta(){
    return null;
}

public List<Richiesta> getRichiestaPerBambino(Bambino b){
        return null;
    }

public List<Richiesta> getRichiestaPerGenitore(Genitore g){
        return null;
    }
public Richiesta getRichiestaPerId(String id){
    return null;
}
public void approvaRichiesta(Richiesta r){
    
}

public void rifiutaRichiesta(Richiesta r){
        
    }










}