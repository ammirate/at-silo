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
 * Mariella Ferrara, 7/12/2012
 * D'Eugenio Elisa, 15/12/2012
 *-----------------------------------------------------------------
 */

public class DomandaIscrizione implements Cloneable{
    
    private Date dataPresentazione;
    private int id;
    private String notaEsclusione;
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
    private String stato_convalidazione;
    private Genitore genitoreNonRichiedente;
    private String vaccinazioni;
    private String malattieInfettive;
    
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
     * @param stato_convalidazione è fissato
     */
    public DomandaIscrizione(Date dataPresentazione, int iD, int punteggio,
           int posizione, Genitore genitore, Bambino bambino, String statoDomanda,
            String certificatoMalattie, String certificatoVaccinazioni, String certificatoPrivacy,
            boolean bambinoDisabile, boolean genitoreInvalido, boolean genitoreSolo,
            boolean genitoreVedovo, boolean genitoreNubile, boolean genitoreSeparato,
            boolean figlioNonRiconosciuto, boolean affidoEsclusivo, boolean altriComponentiDisabili,
            String condizioniCalcoloPunteggio, float isee, Servizio servizio, String stato_convalidazione) {
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
        this.stato_convalidazione=stato_convalidazione;
    }
    
    /**
     * @param dataPresentazione il parametro è fissato
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
     * @param stato_convalidazione è fissato
     */
    public DomandaIscrizione(Date dataPresentazione, int punteggio,
           int posizione, Genitore genitore, Bambino bambino, String statoDomanda,
            String certificatoMalattie, String certificatoVaccinazioni, String certificatoPrivacy,
            boolean bambinoDisabile, boolean genitoreInvalido, boolean genitoreSolo,
            boolean genitoreVedovo, boolean genitoreNubile, boolean genitoreSeparato,
            boolean figlioNonRiconosciuto, boolean affidoEsclusivo, boolean altriComponentiDisabili,
            String condizioniCalcoloPunteggio, float isee, Servizio servizio, String stato_convalidazione) {
        super();
        this.dataPresentazione = dataPresentazione;
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
        this.stato_convalidazione=stato_convalidazione;
    }
 
    
    /**
     * @param dataPresentazione il parametro è fissato
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
     */
    public DomandaIscrizione(Date dataPresentazione, boolean bambinoDisabile, boolean genitoreInvalido,
            boolean genitoreSolo, boolean genitoreVedovo, boolean genitoreNubile, boolean genitoreSeparato, 
            boolean figlioNonRiconosciuto, boolean affidoEsclusivo, boolean altriComponentiDisabili,
            String condizioniCalcoloPunteggio, float isee){
        super();
        this.dataPresentazione = dataPresentazione;
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

    /**
     * Metodo che prende il campo stato_convalidazione
     * @return stato_convalidazione il parametro inserito
     */
    public String getStato_convalidazione() {
        return stato_convalidazione;
    }

    /**
     * Metodo che setta il campo stato_convalidazione
     * @param stato_convalidazione il parametro fissato
     */
    public void setStato_convalidazione(String stato_convalidazione) {
        this.stato_convalidazione = stato_convalidazione;
    }
    
    public String getNotaEsclusione() {
        return notaEsclusione;
    }

    public void setNotaEsclusione(String notaEsclusione) {
        this.notaEsclusione = notaEsclusione;
    }
    

    public String getVaccinazioni() {
        return vaccinazioni;
    }

    public void setVaccinazioni(String vaccinazioni) {
        this.vaccinazioni = vaccinazioni;
    }

    public String getMalattieInfettive() {
        return malattieInfettive;
    }

    public void setMalattieInfettive(String malattieInfettive) {
        this.malattieInfettive = malattieInfettive;
    }

    public Genitore getGenitoreNonRichiedente() {
        return genitoreNonRichiedente;
    }

    public void setGenitoreNonRichiedente(Genitore genitoreNonRichiedente) {
        this.genitoreNonRichiedente = genitoreNonRichiedente;
    }

    /**
     * Metodo di sovrascrizione del metodo clone della classe Object
     * @return DomandaIscrizione clonata
     */
    public Object clone()
    {
        DomandaIscrizione domanda = new DomandaIscrizione();
        domanda.dataPresentazione = this.dataPresentazione;
        domanda.id = this.id;
        domanda.notaEsclusione=this.notaEsclusione;
        domanda.punteggio = this.punteggio;
        domanda.posizione = this.posizione;
        domanda.genitore = this.genitore;
        domanda.bambino = this.bambino;
        domanda.statoDomanda = this.statoDomanda;
        domanda.certificatoMalattie = this.certificatoMalattie;
        domanda.certificatoVaccinazioni = this.certificatoVaccinazioni;
        domanda.certificatoPrivacy = this.certificatoPrivacy;
        domanda.bambinoDisabile = this.bambinoDisabile;
        domanda.genitoreInvalido = this.genitoreInvalido;
        domanda.genitoreSolo = this.genitoreSolo;
        domanda.genitoreVedovo = this.genitoreVedovo;
        domanda.genitoreNubile = this.genitoreNubile;
        domanda.genitoreSeparato = this.genitoreSeparato;
        domanda.figlioNonRiconosciuto = this.figlioNonRiconosciuto;
        domanda.affidoEsclusivo = this.affidoEsclusivo;
        domanda.altriComponentiDisabili = this.altriComponentiDisabili;
        domanda.condizioniCalcoloPunteggio = this.condizioniCalcoloPunteggio;
        domanda.isee = this.isee;
        domanda.servizio = this.servizio;
        domanda.stato_convalidazione= this.stato_convalidazione;
        domanda.genitoreNonRichiedente=this.genitoreNonRichiedente;
        domanda.vaccinazioni=this.vaccinazioni;
        domanda.malattieInfettive=this.malattieInfettive;
        return domanda;
    }
    
}
