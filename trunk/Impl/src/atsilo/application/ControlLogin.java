package atsilo.application;

import atsilo.entity.Utente;

public class ControlLogin {
    private static final ControlLogin INSTANCE;

    ControlLogin() {
    }

    Boolean getValoreLogin(Utente utente) {
        return false;
    }

    public static ControlLogin getInstance() {
        return null;
        
    }
}
