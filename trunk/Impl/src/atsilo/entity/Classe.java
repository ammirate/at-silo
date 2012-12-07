package atsilo.entity;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Classe.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 14/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class Classe {
    
    /**
     * @attribute id di tipo stringa
     * @attribute classe di tipo stringa
     */
    private String id;
    private String classe;
   
    /** 
     * La variabile educatori è settatta a Null quindi c'è bisogno di una lettura
     */
    private List<EducatoreDidattico> educatori;
    
    /**
     * La variabile eventi avrà i valore della lista Evento
     * La variabile eventi è nulla c'è bisogno di una lettura della classe Evento
     */
    private List<Bambino> bambini;

    /**
     * Costruttore vuoto
     */
    public Classe() {
    }

    /**
     * @param id il paramentro è fissato
     * @param educatori è settato dopo la lettura 
     * @param eventi è settato dopo la lettura
     */
    public Classe(String id, List<EducatoreDidattico> educatori) {
        this.id = id;
        this.educatori = educatori;
    }
    
    /**
     * Metodo che setta il campo Id
     * @param id il parametro fissato
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * Metodo che prende il campo Id
     * @return Id il paramentro inserito
     */
    public String getId() {
        return id;
    }

    /**
     * Metodo che setta il parametro letto dalla classe EducatoreDidattico
     * @param educatori è settato dopo la lettura
     */
    public void setEducatori(List<EducatoreDidattico> educatori) {
        this.educatori = educatori;
    }

    /**
     * Metodo che prende il parametro letto dalla classe EducatoreDidattico
     * @return educatori parametro preso dalla lettura
     */
    public List<EducatoreDidattico> getEducatori() {
        return educatori;
    }

    /**
     * @return bambino
     */
    public List<Bambino> getBambino() {
        return bambini;
    }

    /**
     * @param bambino nuovo bambino
     */
    public void setBambino(List<Bambino> bambino) {
        this.bambini = bambino;
    }

   public void aggiungiBambino(Bambino b){
       bambini.add(b);
   }

   /**
     * Metodo che prende il campo classe
     * @return classe il paramentro inserito
    */
   public String getClasse() {
       return classe;
   }

   /**
    * Metodo che setta il campo Classe
     * @param classe il parametro fissato
         */
   public void setClasse(String classe) {
       this.classe = classe;
   }
   
   
   
   
   
   
}
