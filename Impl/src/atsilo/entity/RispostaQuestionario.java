package atsilo.entity;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: RispostaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 14/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class RispostaQuestionario {
    
    private int id;
    private String valore;
    private int idDomanda;
    private String CFgenitore;
    
    /**
     * Costruttore vuoto
     */
    public RispostaQuestionario() {
    }

    /**
     * @param id il paramentro è fissato
     * @param valore il paramentro è fissato
     * @param genitore è settato dopo la lettura
     */
    public RispostaQuestionario(int id, String valore,int idDomanda, String CodFiscGenitore) {
        super();
        this.id = id;
        this.valore = valore;
        this.idDomanda = idDomanda;
        this.CFgenitore = CodFiscGenitore;
    }

    /**
     * Metodo che prende il campo Id
     * @param id il parametro inserito
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
     * Metodo che prende il campo valore
     * @param valore il parametro inserito
     */
    public void setValore(String valore) {
        this.valore = valore;
    }

    /**
     * Metodo che prende il campo valore
     * @return valore il parametro inserito
     */
    public String getValore() {
        return valore;
    }

    /**
     * @return idDomanda
     */
    public int getIdDomanda() {
        return idDomanda;
    }

    /**
     * @param i nuovo idDomanda
     */
    public void setIdDomanda(int i) {
        this.idDomanda = i;
    }

    /**
     * @return cFgenitore
     */
    public String getCFgenitore() {
        return CFgenitore;
    }

    /**
     * @param cFgenitore nuovo cFgenitore
     */
    public void setCFgenitore(String cFgenitore) {
        CFgenitore = cFgenitore;
    }


    public String toString(){
        return "RISPOSTA     ID:"+id+ "  valore:"+valore+"  IDdomanda:"+idDomanda+" CFgenitore:"+CFgenitore;
    }

    
   
    
    
}
