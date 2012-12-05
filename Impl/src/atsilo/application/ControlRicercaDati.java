package atsilo.application;

import atsilo.entity.Utente;

import java.util.List;

//TODO scrivere la javadoc per la classe e i metodi

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlRicercaDati.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Gianfranco Bottiglieri, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class ControlRicercaDati {
    private static final ControlRicercaDati ISTANCE;

    ControlRicercaDati() {
    }


    public static ControlRicercaDati getIstance() {
        return null;
    }

   public List<Utente> getRicerca(String tipoRicercante, String tipoRicercato, List<String> campiRicerca) {
       return null;
    }
   
   /**
    * Visualizzazione dell'utente. dovrebbe lanciare un boundary..
    */
   public void getUtenteRicercato() {
       
   }
}
