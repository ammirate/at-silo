package atsilo.application;

import atsilo.entity.Utente;

import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: AlgoritmoRicercaBambino.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Sconisciuto, 28/11/2012
 *-----------------------------------------------------------------
 */

public abstract class AlgoritmoRicerca {
    
    public abstract List<Utente> ricerca(List<String> parametriRicerca) {
        
    }
}
