package atsilo.application;

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
public boolean inserisciServizio (Servizio s){
    return false;
}
public boolean modificaServizio(Servizio s){
    return false;
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

public boolean inserisciRichiesta (Richiesta r){
    return false;
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
public boolean approvaRichiesta(Richiesta r){
    return false;
}

public boolean rifiutaRichiesta(Richiesta r){
        return false;
    }










}