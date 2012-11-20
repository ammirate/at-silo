package application;

import atsilo.entity.Genitore;
import atsilo.entity.PersonaleAsilo;

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
