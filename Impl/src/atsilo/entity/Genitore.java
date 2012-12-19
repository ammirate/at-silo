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
 * Mariella Ferrara 8/12/2012
 *-----------------------------------------------------------------
 */

public class Genitore extends Utente {

    private String tipo;
    private String dipendentePresso;
    private String rapportiAteneoSalerno;
    private String rapportiComuneFisciano;
    private int statusLavorativo;
    private Date scadenzaContratto;
    private String categoriaAppartenenza;
    private String rapportoParentela;
    private String condizioneLavorativa;
    private String tipoContratto;
    
    
    /**
     * La variabile figli è nulla c'è bisogno di una lettura della classe Bambino
     */
    private List<Bambino> figli;
    
    /**
     * La variabile questionariCompilati è nulla c'è bisogno di una lettura della classe Questionario
     */
    private List<Questionario> questionariCompilati;

    /**
     * Costruttore vuoto
     */
    public Genitore() {
    }
    
    /**
     * @param tipo il paramentro è fissato
     * @param figli è settato dopo la lettura
     * @param questionariCompilati è settato dopo la lettura
     * @param dipendentePresso il parametro è fissato
     * @param rapportiAteneoSalerno il parametro è fissato
     * @param rapportiComuneFisciano il parametro è fissato
     * @param statusLavorativo il parametro è fissato
     * @param scadenzaContratto il parametro è fissato
     * @param categoriaAppartenenza il parametro è fissato
     * @param rapportoParentela il parametro è fissato
     * @param condizioneLavorativa il parametro è fissato
     * @param tipoContratto il parametro è fissato
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
            int statusLavorativo, Date scadenzaContratto, String categoriaAppartenenza,
            String rapportoParentela, String condizioneLavorativa, String tipoContratto) {
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
        this.condizioneLavorativa=condizioneLavorativa;
        this.tipoContratto=tipoContratto;
    }



    /**
     * Metodo che setta il campo tipo
     * @param tipo è settato dopo la lettura
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
     * Metodo che setta il campo dipendentePresso
     * @param dipendentePresto è settato dopo la lettura
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
     * Metodo che setta il campo rapportiAteneoSalerno
     * @param rapportiAteneoSalerno è settato dopo la lettura
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
     * Metodo che setta il campo rapportiComuneFisciano
     * @param rapportiComuneFisciano è settato dopo la lettura
     */
    public void setRapportiComuneFisciano(String rapportiComuneFisciano) {
        this.rapportiComuneFisciano = rapportiComuneFisciano;
    }

    /**
     * Metodo che prende il parametro rapportiComuneFisciano
     * @return rapportiComuneFisciano il parametro inserito
     */
    public String getRapportiComuneFisciano() {
        return rapportiComuneFisciano;
    }
    
    /**
     * Metodo che setta il campo statusLavorativo
     * @param statusLavorativo è settato dopo la lettura
     */
    public void setStatusLavorativo(int statusLavorativo) {
        this.statusLavorativo = statusLavorativo;
    }

    /**
     * Metodo che prende il parametro statusLavorativo
     * @return statusLavorativo il parametro inserito
     */
    public int getStatusLavorativo() {
        return statusLavorativo;
    }
    
    /**
     * Metodo che setta il campo rapportoParentela
     * @param rapportoParentela è settato dopo la lettura
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
     * Metodo che setta il campo scadenzaContratto
     * @param scadenzaContratto è settato dopo la lettura
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
     * Metodo che setta il campo categoriaAppartenenza
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
     * @param figli è settato dopo la lettura
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
     * @param questionariCompilati è settato dopo la lettura
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

    /**
     * Metodo che prende il parametro condizioneLavorativa
     * @return condizioneLavorativa il parametro inserito
     */
    public String getCondizioneLavorativa() {
        return condizioneLavorativa;
    }

    /**
     * Metodo che setta il campo condizioneLavorativa
     * @param condizioneLavorativa è settato dopo la lettura
     */
    public void setCondizioneLavorativa(String condizioneLavorativa) {
        this.condizioneLavorativa = condizioneLavorativa;
    }

    /**
     * Metodo che prende il parametro tipoContratto
     * @return tipoContratto il parametro inserito
     */
    public String getTipoContratto() {
        return tipoContratto;
    }

    /**
     * Metodo che setta il campo tipoContratto
     * @param tipoContratto è settato dopo la lettura
     */
    public void setTipoContratto(String tipoContratto) {
        this.tipoContratto = tipoContratto;
    }
    
    
    
    
    
    
    
    
}
