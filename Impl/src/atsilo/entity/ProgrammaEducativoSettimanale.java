package atsilo.entity;
import java.util.List;

public class ProgrammaEducativoSettimanale {

    private String settimana;
    private String descrizione;
    private String obiettivi;
    
    /**
     * La variabile psicopedagogo è nulla c'è bisogno di una lettura della classe Psicopedagogo
     */
    private Psicopedagogo psicopedagogo;
    private int id;

    /**
     * La variabile listaAttivita è nulla c'è bisogno di una lettura della classe Attivita
     */
    private List<Attivita> listaAttivita;

    /**
     * Costruttore vuoto
     */
    public ProgrammaEducativoSettimanale() {
    }
    
    /**
     * @param settimana il paramentro è fissato
     * @param descrizione il paramentro è fissato
     * @param obiettivi il paramentro è fissato
     * @param psicopedagogo è settato dopo la lettura 
     * @param id il paramentro è fissato
     * @param listaAttivita è settato dopo la lettura 
     */
    public ProgrammaEducativoSettimanale(String settimana, String descrizione,
            String obiettivi, Psicopedagogo psicopedagogo, int id,
            List<Attivita> listaAttivita) {
        super();
        this.settimana = settimana;
        this.descrizione = descrizione;
        this.obiettivi = obiettivi;
        this.psicopedagogo = psicopedagogo;
        this.id = id;
        this.listaAttivita = listaAttivita;
    }

    /**
     * Metodo che prende il campo settimana
     * @return Settimana il parametro inserito
     */
    public String getSettimana() {
        return settimana;
    }
    
    /**
     * Metodo che setta il campo settimana
     * @param settimana il parametro fissato
     */
    public void setSettimana(String settimana) {
        this.settimana = settimana;
        }
    
    /**
     * Metodo che prende il campo Descrizione
     * @return descrizione il parametro inserito
     */
    public String getDescrizione() {
        return descrizione;
        }
    
    /**
     * Metodo che setta il campo descrizione
     * @param descrizione il parametro fissato
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
        }
    
    /**
     * Metodo che prende il campo obiettivi
     * @return obiettivi il parametro inserito
     */
    public String getObiettivi() {
        return obiettivi;
        }
    
    /**
     * Metodo che setta il campo obiettivi
     * @param obiettivi il parametro fissato
     */
    public void setObiettivi(String obiettivi) {
        this.obiettivi = obiettivi;
        }
    
    /**
     * Metodo che prende il campo id
     * @return Id il parametro inserito
     */
    public int getId() {
        return id;
        }
    
    /**
     * Metodo che setta il campo id
     * @param id il parametro fissato
     */
    public void setId(int id) {
        this.id = id;
        }
    
    /**
     * Metodo che setta il parametro letto dalla classe Psicopedagogo
     * @param psicopedagogo è settato dopo la lettura
     */
    public void setPsicopedagogo(Psicopedagogo psicopedagogo) {
        this.psicopedagogo = psicopedagogo;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Psicopedagogo
     * @return psicopedagogo preso dalla lettura
     */
    public Psicopedagogo getPsicopedagogo() {
        return psicopedagogo;
    }
    
    /**
     * Metodo che setta il parametro letto dalla classe Attivita
     * @param listaAttivita è settato dopo la lettura
     */
    public void setlistaAttivita(List<Attivita> listaAttivita) {
        this.listaAttivita = listaAttivita;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Attivita
     * @return listaAttivita parametro preso dalla lettura
     */
    public List<Attivita> getlistaAttivita() {
        return listaAttivita;
    }
}
