package atsilo.application;

import atsilo.entity.Genitore;
import atsilo.entity.PersonaleAsilo;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlGestionePersonale.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

//TODO fare la javadoc per la classe, per i metodi

public class ControlGestionePersonale {
    private static final ControlGestionePersonale INSTANCE;

    ControlGestionePersonale() {
    }

    PersonaleAsilo eliminaPersonale(PersonaleAsilo personale) {
        return null;
    }

    boolean inserisciPesonaleAsilo(PersonaleAsilo personale) {
        return false;
        
    }

    boolean modificaPesonaleAsilo(PersonaleAsilo personale) {
        return false;
        
    }
    
    boolean modificaUtente(Genitore utente) {
        return false;
    }

    public static ControlGestionePersonale getIstance() {
        return null;
    }
}
