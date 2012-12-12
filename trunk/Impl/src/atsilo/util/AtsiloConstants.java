/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: AtsiloConstants.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Alfonso, 12/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.util;

/**
 * Classe AtsiloConstants
 * Questa classe contiene le costanti che sono usate nella base dati per i campi
 * che possono assumere un insieme di valori.
 * il prefisso CAT_ identifica il tipo di utente della categoria Personale Asilo.
 * il prefisso STATO_DOMANDA identifica i possibili stati di una domanda.
 * 
 * @author Alfonso
 * 
 */
public class AtsiloConstants {
    
    /**
     * 
     */
    public static final String CAT_DIRETTORE="Direttore";
    public static final String CAT_IMP_ASILO="ImpiegatoAsilo";
    public static final String CAT_IMP_DIR_STUDIO="ImpiegatoDirittoStudio";
    public static final String CAT_DELEGATO_RETTORE="DelegatoRettore";
    public static final String STATO_DOMANDA_NONCOMPILATA = "DomandaNonCompilata";
    public static final String STATO_DOMANDA_INVIATA="DomandaInviataInAttesaDiGraduatoria";
    public static final String STATO_DOMANDA_RIFIUTATA="DomandaRifiutata";
    public static final String STATO_DOMANDA_NONCONFERMATA="IscrizioneConfermataInAttesaDiAltriDati";
    public static final String STATO_DOMANDA_NONINVIATA="DomandaNonInviata";
    
}
