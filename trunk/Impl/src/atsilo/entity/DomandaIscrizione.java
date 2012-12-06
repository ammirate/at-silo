package atsilo.entity;

import java.sql.Date;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DomandaIscrizione.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 * REVISION
 * Andrea Micco, 6/12/2012
 *-----------------------------------------------------------------
 */

public class DomandaIscrizione {
    
    private Date dataPresentazione;
    private int id;
    private int punteggio;
    private int posizione;
    private String statoDomanda;
    private String certificatoMalattie;
    private String certificatoVaccinazioni;
    private String certificatoPrivacy;
    private boolean bambinoDisabile;
    private boolean genitoreInvalido;
    private boolean genitoreSolo;
    private boolean genitoreVedovo;
    private boolean genitoreNubile;
    private boolean genitoreSeparato;
    private boolean figlioNonRiconosciuto;
    private boolean affidoEsclusivo;
    private boolean altriComponentiDisabili;
    private String condizioniCalcoloPunteggio;
    private float isee;
    
    /**
     * La variabile genitore avrà il valore della variabile di Genitore
     * La variabile genitore è nulla c'è bisogno di una lettura della classe Genitore
     */
    private Genitore genitore;
    
    /**
     * La variabile bambino avrà il valore della variabile di Bambino
     * La variabile Bambino è nulla c'è bisogno di una lettura della classe Bambino
     */
    private Bambino bambino;
    
    /**
     * La variabile servizio avrà il valore della variabile di Servizio
     * La variabile Servizio è nulla c'è bisogno di una lettura della classe Servizioo
     */
    private Servizio servizio;
    
    /**
     * Costruttore vuoto
     */
    public DomandaIscrizione() {
    }

    /**
     * @param dataPresentazione il parametro è fissato
     * @param iD il parametro è fissato
     * @param punteggio il parametro è fissato
     * @param posizione il parametro è fissato
     * @param genitore è settato dopo la lettura
     * @param bambino è settato dopo la lettura
     * @param statoDomanda è fissato
     * @param certificatoMalattie è fissato
     * @param certificatoVaccinazioni è fissato
     * @param bambinoDisabile è fissato
     * @param genitoreInvalido è fissato
     * @param genitoreSolo è fissato
     * @param genitoreVedovo è fissato
     * @param genitoreNubile è fissato
     * @param genitoreSeparato è fissato
     * @param figlioNonRiconosciuto è fissato
     * @param affidoEsclusivo è fissato
     * @param altriComponentiDisabili è fissato
     * @param isee è fissato
     * @param servizio è fissato dopo la lettura
     */
    public DomandaIscrizione(Date dataPresentazione, int iD, int punteggio,
           int posizione, Genitore genitore, Bambino bambino, String statoDomanda,
            String certificatoMalattie, String certificatoVaccinazioni, String certificatoPrivacy,
            boolean bambinoDisabile, boolean genitoreInvalido, boolean genitoreSolo,
            boolean genitoreVedovo, boolean genitoreNubile, boolean genitoreSeparato,
            boolean figlioNonRiconosciuto, boolean affidoEsclusivo, boolean altriComponentiDisabili,
            String condizioniCalcoloPunteggio, float isee, Servizio servizio) {
        super();
        this.dataPresentazione = dataPresentazione;
        this.id = iD;
        this.punteggio = punteggio;
        this.posizione = posizione;
        this.genitore = genitore;
        this.bambino = bambino;
        this.statoDomanda = statoDomanda;
        this.certificatoMalattie = certificatoMalattie;
        this.certificatoVaccinazioni = certificatoVaccinazioni;
        this.certificatoPrivacy = certificatoPrivacy;
        this.bambinoDisabile = bambinoDisabile;
        this.genitoreInvalido = genitoreInvalido;
        this.genitoreSolo = genitoreSolo;
        this.genitoreVedovo = genitoreVedovo;
        this.genitoreNubile = genitoreNubile;
        this.genitoreSeparato = genitoreSeparato;
        this.figlioNonRiconosciuto = figlioNonRiconosciuto;
        this.affidoEsclusivo = affidoEsclusivo;
        this.altriComponentiDisabili = altriComponentiDisabili;
        this.condizioniCalcoloPunteggio = condizioniCalcoloPunteggio;
        this.isee = isee;
        this.servizio = servizio;
    }
    
    /**
     * Metodo che prende il campo DataPresentazione
     * @return DataPresentazione il paramentro inserito
     */
    public Date getDataPresentazione() {
            return dataPresentazione;
    }

    /**
     * Metodo che setta il campo DataPresentazione
     * @param dataPresentazione il parametro fissato
     */
    public void setDataPresentazione(Date dataPresentazione) {
            this.dataPresentazione = dataPresentazione;
    }

    /**
     * Metodo che prende il valore di Id
     * @return iD il paramentro inserito
     */
    public int getId() {
            return id;
    }

    /**
     * Metodo che setta il valore Id
     * @param iD il parametro fissato
     */
    public void setId(int iD) {
            this.id = iD;
    }

    /**
     * Metodo che prende il valore di punteggio
     * @return punteggio il paramentro inserito
     */
    public int getPunteggio() {
            return punteggio;
    }

    /**
     * Metodo che setta il valore punteggio
     * @param punteggio il parametro fissato
     */
    public void setPunteggio(int punteggio) {
            this.punteggio = punteggio;
    }

    /**
     * Metodo che prende il campo posizione
     * @return posizione il paramentro inserito
     */
    public int getPosizione() {
            return posizione;
    }

    /**
     * Metodo che setta il campo posizione
     * @param posizione il parametro fissato
     */
    public void setPosizione(int posizione) {
            this.posizione = posizione;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Genitore
     * @param genitore2 è settato dopo la lettura
     */
    public void setGenitore(Genitore genitore2) {
        this.genitore = genitore2;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Genitore
     * @return Genitore parametro preso dalla lettura
     */
    public Genitore getGenitore() {
        return genitore;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Bambino
     * @param bambino è settato dopo la lettura
     */
    public void setBambino(Bambino bambino) {
        this.bambino = bambino;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Bambino
     * @return bambino parametro preso dalla lettura
     */
    public Bambino getBambino() {
        return bambino;
    }
    
    /**
     * Metodo che prende il campo statoDomanda
     * @return statoDomanda il paramentro inserito
     */
    public String getStatoDomanda() {
            return statoDomanda;
    }

    /**
     * Metodo che setta il campo statoDomanda
     * @param statoDomanda il parametro fissato
     */
    public void setStatoDomanda(String statoDomanda) {
            this.statoDomanda = statoDomanda;
    }
    
    /**
     * Metodo che prende il campo certificatoMalattie
     * @return certificatoMalattie il paramentro inserito
     */
    public String getCertificatoMalattie() {
            return certificatoMalattie;
    }

    /**
     * Metodo che setta il campo certificatoMalattie
     * @param certificatoMalattie il parametro fissato
     */
    public void setCertificatoMalattie(String certificatoMalattie) {
            this.certificatoMalattie = certificatoMalattie;
    }
    
    /**
     * Metodo che prende il campo certificatoVaccinazioni
     * @return certificatoVaccinazioni il paramentro inserito
     */
    public String getCertificatoVaccinazioni() {
            return certificatoVaccinazioni;
    }

    /**
     * Metodo che setta il campo certificatoVaccinazioni
     * @param certificatoVaccinazioni il parametro fissato
     */
    public void setCertificatoVaccinazioni(String certificatoVaccinazioni) {
            this.certificatoVaccinazioni = certificatoVaccinazioni;
    }
    
    /**
     * Metodo che prende il campo certificatoPrivacy
     * @return certificatoPrivacy il paramentro inserito
     */
    public String getCertificatoPrivacy() {
            return certificatoPrivacy;
    }

    /**
     * Metodo che setta il campo certificatoPrivacy
     * @param certificatoPrivacy il parametro fissato
     */
    public void setCertificatoPrivacy(String certificatoPrivacy) {
            this.certificatoPrivacy = certificatoPrivacy;
    }
    
    /**
     * Metodo che prende il campo bambinoDisabile
     * @return bambinoDisabile il paramentro inserito
     */
    public boolean getBambinoDisabile() {
            return bambinoDisabile;
    }

    /**
     * Metodo che setta il campo bambinoDisabile
     * @param bambinoDisabile il parametro fissato
     */
    public void setBambinoDisabile(boolean bambinoDisabile) {
            this.bambinoDisabile = bambinoDisabile;
    }
    
    /**
     * Metodo che prende il campo genitoreInvalido
     * @return genitoreInvalido il paramentro inserito
     */
    public boolean getGenitoreInvalido() {
            return genitoreInvalido;
    }

    /**
     * Metodo che setta il campo genitoreInvalido
     * @param genitoreInvalido il parametro fissato
     */
    public void setGenitoreInvalido(boolean genitoreInvalido) {
            this.genitoreInvalido = genitoreInvalido;
    }
    
    /**
     * Metodo che prende il campo genitoreSolo
     * @return genitoreSolo il paramentro inserito
     */
    public boolean getGenitoreSolo() {
            return genitoreSolo;
    }

    /**
     * Metodo che setta il campo genitoreSolo
     * @param genitoreSolo il parametro fissato
     */
    public void setGenitoreSolo(boolean genitoreSolo) {
            this.genitoreSolo = genitoreSolo;
    }
    
    /**
     * Metodo che prende il campo genitoreVedovo
     * @return genitoreVedovo il paramentro inserito
     */
    public boolean getGenitoreVedovo() {
            return genitoreVedovo;
    }

    /**
     * Metodo che setta il campo genitoreVedovo
     * @param genitoreVedovo il parametro fissato
     */
    public void setGenitoreVedovo(boolean genitoreVedovo) {
            this.genitoreVedovo = genitoreVedovo;
    }
    
    /**
     * Metodo che prende il campo genitoreNubile
     * @return genitoreNubile il paramentro inserito
     */
    public boolean getGenitoreNubile() {
            return genitoreNubile;
    }

    /**
     * Metodo che setta il campo genitoreNubile
     * @param genitoreNubile il parametro fissato
     */
    public void setGenitoreNubile(boolean genitoreNubile) {
            this.genitoreNubile = genitoreNubile;
    }
    
    /**
     * Metodo che prende il campo genitoreSeparato
     * @return genitoreSeparato il paramentro inserito
     */
    public boolean getGenitoreSeparato() {
            return genitoreSeparato;
    }

    /**
     * Metodo che setta il campo genitoreSeparato
     * @param genitoreSeparato il parametro fissato
     */
    public void setGenitoreSeparato(boolean genitoreSeparato) {
            this.genitoreSeparato = genitoreSeparato;
    }
    
    /**
     * Metodo che prende il campo figlioNonRiconosciuto
     * @return figlioNonRiconosciuto il paramentro inserito
     */
    public boolean getFiglioNonRiconosciuto() {
            return figlioNonRiconosciuto;
    }

    /**
     * Metodo che setta il campo figlioNonRiconosciuto
     * @param figlioNonRiconosciuto il parametro fissato
     */
    public void setFiglioNonRiconosciuto(boolean figlioNonRiconosciuto) {
            this.figlioNonRiconosciuto = figlioNonRiconosciuto;
    }
    
    /**
     * Metodo che prende il campo affidoEsclusivo
     * @return affidoEsclusivo il paramentro inserito
     */
    public boolean getAffidoEsclusivo() {
            return affidoEsclusivo;
    }

    /**
     * Metodo che setta il campo affidoEsclusivo
     * @param affidoEsclusivo il parametro fissato
     */
    public void setAffidoEsclusivo(boolean affidoEsclusivo) {
            this.affidoEsclusivo = affidoEsclusivo;
    }
    
    /**
     * Metodo che prende il campo altriComponentiDisabili
     * @return altriComponentiDisabili il paramentro inserito
     */
    public boolean getAltriComponentiDisabili() {
            return altriComponentiDisabili;
    }

    /**
     * Metodo che setta il campo altriComponentiDisabili
     * @param altriComponentiDisabili il parametro fissato
     */
    public void setAltriComponentiDisabili(boolean altriComponentiDisabili) {
            this.altriComponentiDisabili = altriComponentiDisabili;
    }
    
    /**
     * Metodo che prende il campo condizioniCalcoloPunteggio
     * @return condizioniCalcoloPunteggio il paramentro inserito
     */
    public String getCondizioniCalcoloPunteggio() {
            return condizioniCalcoloPunteggio;
    }

    /**
     * Metodo che setta il campo condizioniCalcoloPunteggio
     * @param condizioniCalcoloPunteggio il parametro fissato
     */
    public void setCondizioniCalcoloPunteggio(String condizioniCalcoloPunteggio) {
            this.condizioniCalcoloPunteggio = condizioniCalcoloPunteggio;
    }
    
    /**
     * Metodo che prende il campo isee
     * @return isee il paramentro inserito
     */
    public float getIsee() {
            return isee;
    }

    /**
     * Metodo che setta il campo isee
     * @param isee il parametro fissato
     */
    public void setIsee(float isee) {
            this.isee = isee;
    }
    
    /**
     * Metodo che setta il parametro letto dalla classe Servizio
     * @param servizio è settato dopo la lettura
     */
    public void setServizio(Servizio servizio) {
        this.servizio = servizio;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Servizio
     * @return servizio parametro preso dalla lettura
     */
    public Servizio getServizio() {
        return servizio;
    }
}
