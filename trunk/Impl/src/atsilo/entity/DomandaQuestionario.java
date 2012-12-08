package atsilo.entity;

import java.util.ArrayList;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DomandaQuestionario.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 16/11/2012 (non responsabile)
 * REVISION
 * Andrea Micco, 5/12/2012
 *-----------------------------------------------------------------
 */

public class DomandaQuestionario {
    
    private int id;
    private String descrizione;
    private List<CampoDomandaQuestionario> campi;
    private int idQuestionario;

    /**
     * La variabile questionario avrà il valore della variabile di Questionario
     * La variabile questionario è nulla c'è bisogno di una lettura della classe questionario
     */
    
    /**
     * Costruttore vuoto
     */
    public DomandaQuestionario(){    
    }

    /**
     * Costruttore
     * @param id il parametro è settato
     * @param descrizione il parametro è settato
     * @param campi è una lista contenente i campi della domanda
     * @param questionario è settato dopo la lettura
     */
    public DomandaQuestionario(int id, int idQuestionario, String descrizione, List<CampoDomandaQuestionario> campi){
        super();
        this.id = id;
        this.descrizione = descrizione;
        this.idQuestionario = idQuestionario;
        if(campi==null || campi.isEmpty())
            this.campi = new ArrayList<CampoDomandaQuestionario>();
    }
    
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Metodo che prende il campo Id
     * @return iD il parametro inserito
     */
    public int getId() {
        return id;
    }

    /**
     * Metodo che setta il campo Descrizione
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
     * @return campi
     */
    public List<CampoDomandaQuestionario> getCampi() {
        return campi;
    }

    /**
     * @param campi nuovo campi
     */
    public void setCampi(List<CampoDomandaQuestionario> campi) {
        for(CampoDomandaQuestionario c : campi)
            c.setIdDomandaQuestionario(id);
        this.campi = campi;
    }
    
    
    public void aggiungiCampo(CampoDomandaQuestionario c){
        c.setIdDomandaQuestionario(id);
        campi.add(c);
        
    }

 

    /**
     * @return idQuestionario
     */
    public int getIdQuestionario() {
        return idQuestionario;
    }

    /**
     * @param idQuestionario nuovo idQuestionario
     */
    public void setIdQuestionario(int idQuestionario) {
        this.idQuestionario = idQuestionario;
    }


    public String toString(){
        String campi;
        if(this.campi == null || this.campi.isEmpty())
            campi = "vuoto";
        else campi="lista di campi";
        return "DOMANDA      ID:"+id+ "  descrizione:"+descrizione+"  campi:"+campi;
    }

    
   
    
}


