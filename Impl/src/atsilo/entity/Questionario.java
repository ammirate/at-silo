package atsilo.entity;

import java.sql.Date;
import java.util.List;

public class Questionario {
 
    private Date periodo_fine;
    private String descrizione;
    private String flag_rinuncia;
    private String nome;
    private int id;
    private Date periodo_inizio;
    private String pathname;
    private List<Genitore> listaGenitori;
    /**
     * Costruttore vuoto
     */
    public Questionario() {
    }
    /**
     * @param periodo_fine il paramentro è fissato
     * @param descrizione il paramentro è fissato
     * @param flag_rinuncia il paramentro è fissato
     * @param nome il paramentro è fissato
     * @param id il paramentro è fissato
     * @param periodo_inizio il paramentro è fissato
     * @param pathname il paramentro è fissato
     */
    public Questionario( String descrizione,
            String flag_rinuncia, String nome, int id, Date periodo_inizio,Date periodo_fine, List<Genitore> genitori,
            String pathname) {
        super();
        this.periodo_fine = periodo_fine;
        this.descrizione = descrizione;
        this.flag_rinuncia = flag_rinuncia;
        this.nome = nome;
        this.id = id;
        this.periodo_inizio = periodo_inizio;
        this.pathname = pathname;
        this.listaGenitori = genitori;
    }


    /**
     * @return chiCompilato
     */
   
    /**
     * @return listaGenitori
     */
    public List<Genitore> getListaGenitori() {
        return listaGenitori;
    }

    /**
     * @param listaGenitori nuovo listaGenitori
     */
    public void setListaGenitori(List<Genitore> listaGenitori) {
        this.listaGenitori = listaGenitori;
    }
    
    public void addGenitore(Genitore genitore){
        listaGenitori.add(genitore);
    }

    /**
     * Metodo che setta il campo periodo fine
     * @param periodo_fine il parametro fissato
     */
    public void setPeriodo_fine(Date periodo_fine) {
        this.periodo_fine = periodo_fine;
    }

    /**
     * Metodo che prende il campo periodo fine
     * @return periodo_fine il parametro inserito
     */
    public Date getPeriodo_fine() {
        return periodo_fine;
    }

    /**
     * Metodo che setta il campo descrizione
     * @param descrizione il parametro fissato
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    /**
     * Metodo che prende il campo descrizione
     * @return descrizione il parametro inserito
     */
    public String getDescrizione() {
        return descrizione;
    }

    /**
     * Metodo che setta il campo flag rinuncia
     * @param flag_rinuncia il parametro fissato
     */
    public void setFlag_rinuncia(String flag_rinuncia) {
        this.flag_rinuncia = flag_rinuncia;
    }

    /**
     * Metodo che prende il campo flag rinuncia
     * @return flag_rinuncia il parametro inserito
     */
    public String getFlag_rinuncia() {
        return flag_rinuncia;
    }

    /**
     * Metodo che setta il campo nome
     * @param nome il parametro fissato
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * Metodo che prende il campo mome
     * @return nome il parametro inserito
     */
    public String getNome() {
        return nome;
    }

    /**
     * Metodo che setta il valore id
     * @param id il parametro fissato
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Metodo che prende il valore Id
     * @return id il parametro inserito
     */
    public int getId() {
        return id;
    }

    /**
     * Metodo che setta il campo periodo inizio
     * @param periodo_inizio il parametro fissato
     */
    public void setPeriodo_inizio(Date periodo_inizio) {
        this.periodo_inizio = periodo_inizio;
    }

    /**
     * Metodo che prende il campo periodi inizio
     * @return periodo_inizio il parametro inserito
     */
    public Date getPeriodo_inizio() {
        return periodo_inizio;
    }

    /**
     * Metodo che setta il campo pathname
     * @param pathname il parametro fissato
     */
    public void setPathname(String pathname) {
        this.pathname = pathname;
    }

    /**
     * Metodo che prende il campo pathname
     * @return pathname il parametro inserito
     */
    public String getPathname() {
        return pathname;
    }
}
