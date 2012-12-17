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
 * il prefisso ISCRIZIONE_CLASSE identifica i possibili stati della richiesta di appartenenza ad una classe.
 * il prefisso CERTIFICATO identifica i possibili stati della consegna dei vari certificati
 * 
 * @author Alfonso
 * 
 */
public class AtsiloConstants {
    
    /**
     * 
     */
    public static final String CAT_DIRETTORE="Direttore";
    public static final String CAT_GENITORE="genitore";
    public static final String CAT_EDUCATORE="educatore";
    public static final String CAT_PSICOPEDAGOGO="psicopedagogo";
    public static final String CAT_RESP_QUEST="responsabile_questionario";
    public static final String CAT_IMP_ASILO="impiegato_asilo";
    public static final String CAT_IMP_DIR_STUDIO="impiegato_bando";
    public static final String CAT_DELEGATO_RETTORE="delegato_rettore";
    public static final String CAT_RESP_SCIENTIFICO="responsabile_scientifico";
    public static final String STATO_DOMANDA_NONCOMPILATA = "DomandaNonCompilata";
    public static final String STATO_DOMANDA_PRIMO_STEP="DomandaInviataInAttesaDiGraduatoria";
    public static final String STATO_DOMANDA_RIFIUTATA="DomandaRifiutata";
    public static final String STATO_DOMANDA_ACCETTATA="DomandaAccettata";
    public static final String STATO_DOMANDA_SECONDO_STEP="IscrizioneConfermataInAttesaDiAltriDati";
    public static final String STATO_DOMANDA_PRESENTAZIONE_DOCUMENTI="AttesaPresentazioneDocumenti";
    public static final String STATO_DOMANDA_NONINVIATA="DomandaNonInviata";
    public static final String ISCRIZIONE_CLASSE_CONFERMATA="Conferma";
    public static final String ISCRIZIONE_CLASSE_RIFIUTATA="Rifiuta";
    public static final String CERTIFICATO_CONSEGNATO="Consegnato";
    public static final String CERTIFICATO_NON_CONSEGNATO="NonConsegnato";
    public static final String CERTIFICATO_IN_ATTESA="InAttesa";
    
}
