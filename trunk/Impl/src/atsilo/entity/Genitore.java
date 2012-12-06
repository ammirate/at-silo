package atsilo.entity;

import java.sql.Date;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Genitore.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 * REVISION
 * Andrea Micco, 6/12/2012
 *-----------------------------------------------------------------
 */

public class Genitore extends Utente {

    private String tipo;
    private String dipendentePresso;
    private String rapportiAteneoSalerno;
    private String rapportiComuneFisciano;
    private String statusLavorativo;
    private Date scadenzaContratto;
    private String categoriaAppartenenza;
    private String rapportoParentela;
    
    
    /**
     * La variabile figli � nulla c'� bisogno di una lettura della classe Bambino
     */
    private List<Bambino> figli;
    
    /**
     * La variabile questionariCompilati � nulla c'� bisogno di una lettura della classe Questionario
     */
    private List<Questionario> questionariCompilati;

    /**
     * Costruttore vuoto
     */
    public Genitore() {
    }
    
    /**
     * @param tipo il paramentro � fissato
     * @param figli � settato dopo la lettura
     * @param questionariCompilati � settato dopo la lettura
     * @param dipendentePresso il parametro � fissato
     * @param rapportiAteneoSalerno il parametro � fissato
     * @param rapportiComuneFisciano il parametro � fissato
     * @param statusLavorativo il parametro � fissato
     * @param scadenzaContratto il parametro � fissato
     * @param categoriaAppartenenza il parametro � fissato
     * @param rapportoParentela il parametro � fissato
     */
    public Genitore(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, List<Bambino> figli,
            List<Questionario> questionariCompilati, String tipo, String dipendentePresso,
            String rapportiAteneoSalerno, String rapportiComuneFisciano,
            String statusLavorativo, Date scadenzaContratto, String categoriaAppartenenza,
            String rapportoParentela) {
        super(dataNascita, nome, cognome, codiceFiscale, email, comuneNascita,
               telefono, cittadinanza, indirizzoResidenza,
                numeroCivicoResidenza, capResidenza, comuneResidenza,
                provinciaResidenza, indirizzoDomicilio,
                numeroCivicoDomicilio,  capDomicilio, comuneDomicilio,
                provinciaDomicilio);
        this.tipo = tipo;
        this.figli = figli;
        this.questionariCompilati = questionariCompilati;
        this.dipendentePresso = dipendentePresso;
        this.rapportiAteneoSalerno = rapportiAteneoSalerno;
        this.rapportiComuneFisciano = rapportiComuneFisciano;
        this.statusLavorativo = statusLavorativo;
        this.scadenzaContratto = scadenzaContratto;
        this.categoriaAppartenenza = categoriaAppartenenza;
        this.rapportoParentela = rapportoParentela;
    }



    /**
     * Metodo che prende il parametro tipo
     * @param tipo il parametro inserito
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * Metodo che prende il parametro tipo
     * @return tipo il parametro inserito
     */
    public String getTipo() {
        return tipo;
    }
    
    /**
     * Metodo che prende il parametro dipendentePresso
     * @param dipendentePresto il parametro inserito
     */
    public void setDipendentePresso(String dipendentePresso) {
        this.dipendentePresso = dipendentePresso;
    }

    /**
     * Metodo che prende il parametro dipendentePresso
     * @return dipendentePresso il parametro inserito
     */
    public String getDipendentePresso() {
        return dipendentePresso;
    }
    
    /**
     * Metodo che prende il parametro rapportiAteneoSalerno
     * @param rapportiAteneoSalerno il parametro inserito
     */
    public void setRapportiAteneoSalerno(String rapportiAteneoSalerno) {
        this.rapportiAteneoSalerno = rapportiAteneoSalerno;
    }

    /**
     * Metodo che prende il parametro rapportiAteneoSalerno
     * @return rapportiAteneoSalerno il parametro inserito
     */
    public String getRapportiAteneoSalerno() {
        return rapportiAteneoSalerno;
    }

    /**
     * Metodo che prende il parametro rapportiComuneFisciano
     * @param rapportiComuneFisciano il parametro inserito
     */
    public void setRapportiComuneFisciano(String rapportiComuneFisciano) {
        this.rapportiComuneFisciano = rapportiComuneFisciano;
    }

    /**
     * Metodo che prende il parametro rapportiComuneFisciano
     * @return rapportiComuneFisciano il parametro inserito
     */
    public String getRapportiComuenFisciano() {
        return rapportiComuneFisciano;
    }
    
    /**
     * Metodo che prende il parametro statusLavorativo
     * @param statusLavorativo il parametro inserito
     */
    public void setStasuLavorativo(String statusLavorativo) {
        this.statusLavorativo = statusLavorativo;
    }

    /**
     * Metodo che prende il parametro statusLavorativo
     * @return statusLavorativo il parametro inserito
     */
    public String getStatusLavorativo() {
        return statusLavorativo;
    }
    
    /**
     * Metodo che prende il parametro rapportoParentela
     * @param rapportoParentela il parametro inserito
     */
    public void setRapportoParentela(String rapportoParentela) {
        this.rapportoParentela = rapportoParentela;
    }

    /**
     * Metodo che prende il parametro rapportoParentela
     * @return rapportoParentela il parametro inserito
     */
    public String getRapportoParentela() {
        return rapportoParentela;
    }

    /**
     * Metodo che prende il parametro scadenzaContratto
     * @param scadenzaContratto il parametro inserito
     */
    public void setScadenzaContratto(Date scadenzaContratto) {
        this.scadenzaContratto = scadenzaContratto;
    }

    /**
     * Metodo che prende il parametro scadenzaContratto
     * @return scadenzaContratto il parametro inserito
     */
    public Date getScadenzaContratto() {
        return scadenzaContratto;
    }

    /**
     * Metodo che prende il parametro categoriaAppartenenza
     * @param categoriaAppartenenza il parametro inserito
     */
    public void setCategoriaAppartenenza(String categoriaAppartenenza) {
        this.categoriaAppartenenza = categoriaAppartenenza;
    }

    /**
     * Metodo che prende il parametro categoriaAppartenenza
     * @return categoriaAppartenenza il parametro inserito
     */
    public String getCategoriaAppartenenza() {
        return categoriaAppartenenza;
    }

    
    /**
     * Metodo che setta il parametro letto dalla classe Bambino
     * @param figli � settato dopo la lettura
     */
    public void setFigli(List<Bambino> figli) {
        this.figli = figli;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Bambino
     * @return figli preso dalla lettura
     */
    public List<Bambino> getFigli() {
        return figli;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Questionario
     * @param questionariCompilati � settato dopo la lettura
     */
    public void setQuestionariCompilati(List<Questionario> questionariCompilati) {
        this.questionariCompilati = questionariCompilati;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Questionaro
     * @return questionariCompilati preso dalla lettura
     */
    public List<Questionario> getQuestionariCompilati() {
        return questionariCompilati;
    }
    
    
    public void aggiungiQuestionarioCompilato(Questionario q){
        questionariCompilati.add(q);
    }
}
