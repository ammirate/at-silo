package atsilo.application;

import atsilo.entity.Bando;
import atsilo.entity.DomandaIscrizione;

import java.sql.Date;

public class ControlGestioneBando {
    private static final ControlGestioneBando INSTANCE;

    ControlGestioneBando() {
    }

    boolean insrisciPunteggio(DomandaIscrizione iscrizione) {
        return false;
    }

    boolean inserisciIntervalloBando(Date inizio, Date fine) {
        return false;
    }

    boolean modificaBando(Bando bando) {
        return false;
    }

    public static ControlGestioneBando getIstance() {
        return null;
    }
}
