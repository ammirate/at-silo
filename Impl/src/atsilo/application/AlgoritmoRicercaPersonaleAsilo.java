package atsilo.application;

import atsilo.entity.Utente;

import java.util.Collections;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: AlgoritmoRicercaPersonaleAsilo.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Sconisciuto, 28/11/2012
 *-----------------------------------------------------------------
 */

public class AlgoritmoRicercaPersonaleAsilo extends AlgoritmoRicerca {
    @Override
    public List<Utente> ricerca(List<String> parametriRicerca) {
        return Collections.emptyList();
    }
}
