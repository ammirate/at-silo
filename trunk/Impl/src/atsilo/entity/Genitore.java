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
 *-----------------------------------------------------------------
 */

public class Genitore extends Utente {

    private String tipo;
    
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
     */
    public Genitore(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String residenza, String tipo, List<Bambino> figli,
            List<Questionario> questionariCompilati) {
        super(dataNascita, nome, cognome, codiceFiscale, email, comuneNascita, telefono, residenza);
        this.tipo = tipo;
        this.figli = figli;
        this.questionariCompilati = questionariCompilati;
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
}
