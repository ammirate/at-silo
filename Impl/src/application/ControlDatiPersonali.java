package application;

import atsilo.entity.Bambino;

public class ControlDatiPersonali {
    private static final ControlDatiPersonali INSTANCE;

    ControlDatiPersonali() {
    }

    String getValoreStatoIscrizione(Bambino bambino) {
        return "";
    }

    Genitore getDatiGenitore(Genitore genitore) {
        return null;
    }

    Bambino getDatiBambino(Bambinp bambino) {
        return null;
    }

    Utente getUtente(Utente utente) {
        return null;
    }

    public static ControlDatiPersonali getIstance() {
        return null;
    }
}
