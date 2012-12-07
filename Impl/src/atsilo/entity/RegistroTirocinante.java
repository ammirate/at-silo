/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: RegistroTirocinante.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Andrea Micco, 07/dic/2012
 * REVISION
 * Mariella Ferrara 07/dic/2012
 *-----------------------------------------------------------------
 */

package atsilo.entity;

import java.util.List;

public class RegistroTirocinante {
    //id, descrizione, oretotali, valutazione,attivitatirocinante
    private int id;
    private String descrizione;
    private String oreTotali;
    private String valutazione;
    
    /**
     * La variabile listaTirocinante avrà il valore della variabile di List<Tirocinante> 
     * @attribute listaTirocinante La variabile è nulla c'è bisogno di una lettura della classe List<Tirocinante>
     */
    private List<Tirocinante> listaTirocinante;

    /**
     * La variabile listaAttivitaTirocinante avrà il valore della variabile di List<AttivitaTirocinante> 
     * @attribute listaAttivitaTirocinante La variabile è nulla c'è bisogno di una lettura della classe List<AttivitaTirocinante>
     */
    private List<AttivitaTirocinante> listaAttivitaTirocinante;
    
    /**
     * Costruttore vuoto
     */
    public RegistroTirocinante() {
    }
    
    /**
     * @param id il parametro fissato
     * @param descrizione il parametro fissato
     * @param oreTotali il parametro fissato
     * @param valutazione il parametro fissato
     */
    public RegistroTirocinante(int id, String descrizione, String oreTotali, String valutazione) {
        this.id = id;
        this.descrizione = descrizione;
        this.oreTotali = oreTotali;
        this.valutazione = valutazione;
        this.listaAttivitaTirocinante = null;
        this.listaTirocinante = null;
    }
    
    /**
     * Metodo che setta il parametro id
     * @param id il parametro settato
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Metodo che prende il campo id
     * @return id il parametro inserito
     */
    public int getId() {
        return id;
    }
    
    /**
     * Metodo che setta il parametro descrizione
     * @param descrizione il parametro settato
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
     * Metodo che setta il parametro oreTotali
     * @param oreTotali il parametro settato
     */
    public void setOreTotali(String oreTotali) {
        this.oreTotali = oreTotali;
    }

    /**
     * Metodo che prende il campo oreTotali
     * @return oreTotali il parametro inserito
     */
    public String oreTotali() {
        return oreTotali;
    }
    
    /**
     * Metodo che setta il parametro valutazione
     * @param valutazione il parametro settato
     */
    public void setValutazione(String valutazione) {
        this.valutazione = valutazione;
    }

    /**
     * Metodo che prende il campo valutazione
     * @return valutazione il parametro inserito
     */
    public String getValutazione() {
        return valutazione;
    }
    
    /**
     * Metodo che setta il parametro letto dalla classe List<AttivitaTirocinante>
     * @param listaAttivitaTirocinante è settato dopo la lettura
     */    
    public void setListaAttivitaTirocinante(List<AttivitaTirocinante> listaAttivitaTirocinante) {
        this.listaAttivitaTirocinante = listaAttivitaTirocinante;
    }

    /**
     * Metodo che prende il parametro letto dalla classe List<AttivitaTirocinante>
     * @return listaAttivitatirocinante parametro preso dalla lettura
     */
    public List<AttivitaTirocinante> getListaAttivitaTirocinante() {
        return listaAttivitaTirocinante;
    }

    /**
     * Metodo che prende il parametro letto dalla classe List<Tirocinante>
     * @return listaTirocinante parametro preso dalla lettura
     */
    public List<Tirocinante> getListaTirocinante() {
        return listaTirocinante;
    }

    /**
     * Metodo che setta il parametro letto dalla classe List<Tirocinante>
     * @param listaTirocinante è settato dopo la lettura
     */
    public void setListaTirocinante(List<Tirocinante> listaTirocinante) {
        this.listaTirocinante = listaTirocinante;
    }
    
}
