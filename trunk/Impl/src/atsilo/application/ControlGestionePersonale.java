package atsilo.application;

import atsilo.entity.Genitore;
import atsilo.entity.PersonaleAsilo;

//TODO fare la javadoc per la classe, per i metodi e inserire l'attore

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
