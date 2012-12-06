package atsilo.entity;

import java.sql.Date;
/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: PersonaleAsilo.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 * REVISION
 * Andrea Micco, 5/12/2012
 *-----------------------------------------------------------------
 */
import java.util.List;

public class PersonaleAsilo extends Utente implements EventPlanner{
    /**
     * @param categoriaAppartenenza è settato dopo la lettura 
     */
    private String categoriaAppartenenza;
    
    
    /**
     * La variabile listaRichiestaTirocinante è nulla c'è bisogno di una lettura della classe RichiestaTirocinante
     */
    private List<RichiestaTirocinante> listaRichiestaTirocinante;
    
    /**
     * La variabile listaRegistroTirocinante è nulla c'è bisogno di una lettura della classe RegistroTirocinante
     */
    private List<RegistroTirocinante> listaRegistroTirocinante;
    
    
    /**
     * Costruttore vuoto
     */
    public PersonaleAsilo(){}
    
 
    

    
    public PersonaleAsilo(Date dataNascita, String nome, String cognome,
            String codiceFiscale, String email, String comuneNascita,
            String telefono, String cittadinanza, String indirizzoResidenza,
            String numeroCivicoResidenza, String capResidenza, String comuneResidenza,
            String provinciaResidenza, String indirizzoDomicilio,
            String numeroCivicoDomicilio, String capDomicilio, String comuneDomicilio,
            String provinciaDomicilio, String categoriaAppartenenza) {
        super(dataNascita, nome, cognome,
                codiceFiscale, email, comuneNascita,
              telefono, cittadinanza, indirizzoResidenza,
                numeroCivicoResidenza, capResidenza, comuneResidenza,
                provinciaResidenza, indirizzoDomicilio,
               numeroCivicoDomicilio, capDomicilio,comuneDomicilio,
               provinciaDomicilio);
        this.categoriaAppartenenza = categoriaAppartenenza;
        this.listaRichiestaTirocinante = null;
        this.listaRegistroTirocinante = null;
    }

    /**
     * Metodo che setta il parametro categoriaAppartenenza
     * @param categoriaAppartenenza il parametro fissato
     */
    public void setCategoriaAppartenenza(String categoriaAppartenenza) {
        this.categoriaAppartenenza = categoriaAppartenenza;
    }

    /**
     * Metodo che prende il parametro CategoriaAppartenenz
     * @return CategoriaAppartenenz il parametro inserito
     */
    public String getCategoriaAppartenenza() {
        return categoriaAppartenenza;
    }
    
    /**
     * Metodo che setta il parametro letto dalla classe RichiestaTirocinante
     * @param listaRichiestaTirocinante è settato dopo la lettura
     */
    public void setListaRichiestaTirocinante(List<RichiestaTirocinante> listaRichiestaTirocinante) {
        this.listaRichiestaTirocinante = listaRichiestaTirocinante;
    }

    /**
     * Metodo che prende il parametro letto dalla classe RichiestaTirocinante
     * @return listaRichiestaTirocinante preso dalla lettura
     */
    public List<RichiestaTirocinante> getListaRichiestaTirocinante() {
        return listaRichiestaTirocinante;
    }
    
    /**
     * Metodo che setta il parametro letto dalla classe RegistroTirocinante
     * @param listaRegistroTirocinante è settato dopo la lettura
     */
    public void setListaRegistroTirocinante(List<RegistroTirocinante> listaRegistroTirocinante) {
        this.listaRegistroTirocinante = listaRegistroTirocinante;
    }

    /**
     * Metodo che prende il parametro letto dalla classe RegistroTirocinante
     * @return listaRegistroTirocinante preso dalla lettura
     */
    public List<RegistroTirocinante> getListaRegistroTirocinante() {
        return listaRegistroTirocinante;
    }
}
