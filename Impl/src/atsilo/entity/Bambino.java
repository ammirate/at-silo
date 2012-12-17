package atsilo.entity;
import java.sql.Date;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Bambino.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 * REVISION
 * Andrea Micco, 6/12/2012
 * Mariella Ferrara, 7/12/2012
 * Andrea Micco, 17/12/2012
 *-----------------------------------------------------------------
 */

public class Bambino {
    
    
    private Date dataNascita;
    private String nome;
    private String cognome;
    private String codiceFiscale;
    private String comuneNascita;
    private String cittadinanza;
    private String indirizzoResidenza;
    private String numeroCivicoResidenza;
    private String capResidenza;
    private String comuneResidenza;
    private String provinciaResidenza;
    private String indirizzoDomicilio;
    private String numeroCivicoDomicilio;
    private String capDomicilio;
    private String comuneDomicilio;
    private String provinciaDomicilio;
    private String categoriaAppartenenza;
    private int classe;
    private String iscrizioneClasse;

    /**
     *  La variabile genitore avrà il valore della variabile di Genitore
     * La variabile Genitore è nulla c'è bisogno di una lettura della classe genitore
     */
    private Genitore genitore;

    
    /**
     *  La variabile genitoreNonRichiedente avrà il valore della variabile di Genitore
     * La variabile genitoreNonRichiedente è nulla c'è bisogno di una lettura della classe genitore
     */
    private Genitore genitoreNonRichiedente;

    

    /**
     *  La variabile assenza avrà i valore della lista Assenza
     * La variabile assenze è nulla c'è bisogno di una lettura della classe Assenza
     */
    private List<Assenza> assenze;

    /**
     * Costruttore vuoto
     */
    public Bambino() {}
    
    /**
     * @param dataNascita il paramentro è fissato
     * @param nome il paramentro è fissato
     * @param cognome il paramentro è fissato
     * @param codiceFiscale il paramentro è fissato
     * @param comuneNascita il paramentro è fissato
     * @param indirizzoResidenza  il paramentro è fissato
     * @param cittadinanza il parametro è fissato
     * @param numeroCivicoResidenza il parametro è fissato
     * @param capResidenza il parametro è fissato
     * @param comuneResidenza il parametro è fissato
     * @param provinciaResidenza il parametro è fissato
     * @param indirizzoDomicilio il parametro è fissato
     * @param numeroCivicoDomicilio il parametro è fissato
     * @param capDomicilio il parametro è fissato
     * @param comuneDomicilio il parametro è fissato
     * @param provinciaDomicilio il parametro è fissato
     * @param categoriaAppartenenza il parametro fissato
     * @param classe il parametro fissato
     * @param genitore è settato dopo la lettura
     * @param assenze è settato dopo la lettura
     * @param iscrizioneClasse parametro fissato
     */
    public Bambino(Date dataNascita, String nome, String cognome,
            String codiceFiscale,  String comuneNascita,
            String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, String categoriaAppartenenza, int classe, Genitore genitore, Genitore genitoreNonRichiedente,List<Assenza> assenze, String iscrizioneClasse) {
        super();
        this.dataNascita = dataNascita;
        this.nome = nome;
        this.cognome = cognome;
        this.codiceFiscale = codiceFiscale;
        this.comuneNascita = comuneNascita;
        this.indirizzoResidenza = indirizzoResidenza;
        this.cittadinanza = cittadinanza;
        this.numeroCivicoResidenza = numeroCivicoResidenza;
        this.capResidenza = capResidenza;
        this.comuneResidenza = comuneResidenza;
        this.provinciaResidenza = provinciaResidenza;
        this.indirizzoDomicilio = indirizzoDomicilio;
        this.numeroCivicoDomicilio = numeroCivicoDomicilio;
        this.capDomicilio = capDomicilio;
        this.comuneDomicilio = comuneDomicilio;
        this.provinciaDomicilio = provinciaDomicilio;
        this.categoriaAppartenenza = categoriaAppartenenza;
        this.classe = classe;
        this.genitore = genitore;
        this.assenze = assenze;
        this.genitoreNonRichiedente=genitoreNonRichiedente;
        this.iscrizioneClasse=iscrizioneClasse;
    }
    
    /**
     * Metodo che prende il campo dataNascita
     * @param dataNascita il parametro inserito
     */
    public void setDataNascita(Date dataNascita) {
        this.dataNascita = dataNascita;
    }

    /**
     * Metodo che prende il campo DataNascita
     * @return DataNascita il parametro inserito
     */
    public Date getDataNascita() {
        return dataNascita;
    }

    /**
     * Metodo che prende il campo nome
     * @param nome il parametro inserito
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * Metodo che prende il campo nome
     * @return nome il parametro inserito
     */
    public String getNome() {
        return nome;
    }

    /**
     * Metodo che prende il campo cognome
     * @param cognome il parametro inserito
     */
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    /**
     * Metodo che prende il campo cognome
     * @return cognome il parametro inserito
     */
    public String getCognome() {
        return cognome;
    }

    /**
     * Metodo che prende il campo codiceFiscale
     * @param codiceFiscale il parametro inserito
     */
    public void setCodiceFiscale(String codiceFiscale) {
        this.codiceFiscale = codiceFiscale;
    }

    /**
     * Metodo che prende il campo CodiceFiscale
     * @return CodiceFiscale il parametro inserito
     */
    public String getCodiceFiscale() {
        return codiceFiscale;
    }

    /**
     * Metodo che prende il campo comune nascita
     * @param comuneNascita il parametro inserito
     */
    public void setComuneNascita(String comuneNascita) {
        this.comuneNascita = comuneNascita;
    }

    /**
     * Metodo che prende il campo Comune di nascita
     * @return ComuneNascita il parametro inserito
     */
    public String getComuneNascita() {
        return comuneNascita;
    }

    /**
     * Metodo che prende il campo cittadinanza
     * @param cittadinanza il parametro inserito
     */
    public void setCittadinanza(String cittadinanza) {
        this.cittadinanza = cittadinanza;
    }

    /**
     * Metodo che prende il campo cittadinazna
     * @return cittadinanza il parametro inserito
     */
    public String getcittadinanza() {
        return cittadinanza;
    }
    
    /**
     * Metodo che prende il campo indirizzoResidenza
     * @param indirizzoResidenza il parametro inserito
     */
    public void setIndirizzoResidenza(String indirizzoResidenza) {
        this.indirizzoResidenza = indirizzoResidenza;
    }

    /**
     * Metodo che prende il campo indirizzoResidenza
     * @return indirizzoResidenza il parametro inserito
     */
    public String getIndirizzoResidenza() {
        return indirizzoResidenza;
    }
    
    /**
     * Metodo che prende il campo numeroCivicoResidenza
     * @param numeroCivicoResidenza il parametro inserito
     */
    public void setNumeroCivicoResidenza(String numeroCivicoResidenza) {
        this.numeroCivicoResidenza = numeroCivicoResidenza;
    }

    /**
     * Metodo che prende il campo numeroCivicoResidenza
     * @return numeroCivicoResidenza il parametro inserito
     */
    public String getNumeroCivicoResidenza() {
        return numeroCivicoResidenza;
    }
    
    /**
     * Metodo che prende il campo capResidenza
     * @param capResidenza il parametro inserito
     */
    public void setCapResidenza(String capResidenza) {
        this.capResidenza = capResidenza;
    }

    /**
     * Metodo che prende il campo capResidenza
     * @return capResidenza il parametro inserito
     */
    public String getCapResidenza() {
        return capResidenza;
    }
    
    /**
     * Metodo che prende il campo comuneResidenza
     * @param comuneResidenza il parametro inserito
     */
    public void setComuneResidenza(String comuneResidenza) {
        this.comuneResidenza = comuneResidenza;
    }

    /**
     * Metodo che prende il campo comuneResidenza
     * @return comuneResidenza il parametro inserito
     */
    public String getComuneResidenza() {
        return comuneResidenza;
    }
    
    /**
     * Metodo che prende il campo provinciaResidenza
     * @param provinciaResidenza il parametro inserito
     */
    public void setProvinciaResidenza(String provinciaResidenza) {
        this.provinciaResidenza = provinciaResidenza;
    }

    /**
     * Metodo che prende il campo provinciaResidenza
     * @return provinciaResidenza il parametro inserito
     */
    public String getProvinciaResidenza() {
        return provinciaResidenza;
    }
    
    /**
     * Metodo che prende il campo indirizzoDomicilio
     * @param indirizzoDomicilio il parametro inserito
     */
    public void setIndirizzoDomicilio(String indirizzoDomicilio) {
        this.indirizzoDomicilio = indirizzoDomicilio;
    }

    /**
     * Metodo che prende il campo indirizzoDomicilio
     * @return indirizzoDomicilio il parametro inserito
     */
    public String getIndirizzoDomicilio() {
        return indirizzoDomicilio;
    }
    
    /**
     * Metodo che prende il campo numeroCivicoDomicilio
     * @param numeroCivicoDomicilio il parametro inserito
     */
    public void setNumeroCivicoDomicilio(String numeroCivicoDomicilio) {
        this.numeroCivicoDomicilio = numeroCivicoDomicilio;
    }

    /**
     * Metodo che prende il campo numeroCivicoDomicilio
     * @return numeroCivicoDomicilio il parametro inserito
     */
    public String getNumeroCivicoDomicilio() {
        return numeroCivicoDomicilio;
    }
    
    /**
     * Metodo che prende il campo capDomicilio
     * @param capDomicilio il parametro inserito
     */
    public void setCapDomicilio(String capDomicilio) {
        this.capDomicilio = capDomicilio;
    }

    /**
     * Metodo che prende il campo capDomicilio
     * @return capDomicilio il parametro inserito
     */
    public String getCapDomicilio() {
        return capDomicilio;
    }
    
    /**
     * Metodo che prende il campo comuneDomicilio
     * @param comuneDomicilio il parametro inserito
     */
    public void setComuneDomicilio(String comuneDomicilio) {
        this.comuneDomicilio = comuneDomicilio;
    }

    /**
     * Metodo che prende il campo comuneDomicilio
     * @return comuneDomicilio il parametro inserito
     */
    public String getComuneDomicilio() {
        return comuneDomicilio;
    }
    
    /**
     * Metodo che prende il campo provinciaDomicilio
     * @param provinciaDomicilio il parametro inserito
     */
    public void setProvinciaDomicilio(String provinciaDomicilio) {
        this.provinciaDomicilio = provinciaDomicilio;
    }

    /**
     * Metodo che prende il campo provinciaDomicilio
     * @return provinciaDomicilio il parametro inserito
     */
    public String getProvinciaDomicilio() {
        return provinciaDomicilio;
    }
   
    /**
     * Metodo che setta il campo CategoriaAppartenenza
     * @param CategoriaAppartenenza il parametro fissato
     */    
    public void setCategoriaAppartenenza(String CategoriaAppartenenza) {
        this.categoriaAppartenenza = CategoriaAppartenenza;
    }

    /**
     * Metodo che prende il campo CategoriaAppartenenza
     * @return CategoriaAppartenenza il parametro inserito
     */
    public String getCategoriaAppartenenza() {
        return categoriaAppartenenza;
    }

   
    /**
     * Metodo che setta il valore Classe
     * @param Classe il parametro fissato
     */
    public void setClasse(int Classe) {
        this.classe = Classe;
    }

    /**
     * Metodo che prende il valore Classe
     * @return classe il parametro inserito
     */
    public int getClasse() {
        return classe;
    }
    
    /**
     * Metodo che setta il valore dell'iscrizione ad una classe
     * @param iscrizioneClasse il parametro fissato
     */
    public void setIscrizioneClasse(String iscrizioneClasse) {
        this.iscrizioneClasse = iscrizioneClasse;
    }

    /**
     * Metodo che prende il valore dell'iscrizione ad una classe
     * @return iscrizioneClasse il parametro inserito
     */
    public String getIscrizioneClasse() {
        return iscrizioneClasse;
    }

   

    /**
     * Metodo che setta il parametro letto dalla classe Genitore
     * @param Genitore è settato dopo la lettura
     */
    public void setGenitore(Genitore Genitore) {
        this.genitore = Genitore;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Genitore
     * @return Genitore parametro preso dalla lettura
     */
    public Genitore getGenitore() {
        return genitore;
    }

   

    /**
     * Metodo che setta il parametro letto dalla classe assenza
     * @param assenze è settato dopo la lettura
     */
    public void setAssenze(List<Assenza> assenze) {
        this.assenze = assenze;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Assenza
     * @return assenza preso dalla lettura
     */
    public List<Assenza> getAssenze() {
        return assenze;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Genitore
     * @return genitoreNonRichiedente preso dalla lettura
     */
    public Genitore getGenitoreNonRichiedente() {
        return genitoreNonRichiedente;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Genitore
     * @param genitoreNonRichiedente è settato dopo la lettura
     */
    public void setGenitoreNonRichiedente(Genitore genitoreNonRichiedente) {
        this.genitoreNonRichiedente = genitoreNonRichiedente;
    }
    
    
    
    
    
    
    
    
    
}
