package atsilo.application;

import atsilo.entity.Bambino;
import atsilo.entity.Genitore;
import atsilo.entity.OrarioUtente;
import atsilo.entity.Richiesta;
import atsilo.entity.Servizio;

import java.util.List;

//TODO fare javadoc per classe, motodi

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlServizio.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

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