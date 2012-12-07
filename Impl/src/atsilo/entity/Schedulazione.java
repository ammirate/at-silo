/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Schedulazione.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Andrea Micco, 07/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.entity;

import java.sql.Date;
import java.util.List;


public class Schedulazione {
   private int id;
   private Date data;
   
   /**
    * La variabile listaTirocinante> avrà il valore della variabile di List<Tirocinante> 
    * @attribute listaTirocinante La variabile è nulla c'è bisogno di una lettura della classe List<Tirocinante>
    */
   private List<Tirocinante> listaTirocinante;
   
   /**
    * La variabile massimo avrà il valore della variabile di Massimo
    * @attribute massimo La variabile è nulla c'è bisogno di una lettura della classe Tirocinante
    */
   private Massimo massimo;
   
   /**
    * Costruttore vuoto
    */
   public Schedulazione() {
   }
   
   /**
    * @param id il parametro fissato
    * @param data il parametro fissato
    */
   public Schedulazione(int id, Date data){
       this.id = id;
       this.data = data;
       this.listaTirocinante = null;
       this.massimo = null;
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
    * Metodo che setta il parametro data
    * @param data il parametro settato
    */
   public void setData(Date data) {
       this.data = data;
   }

   /**
    * Metodo che prende il campo data
    * @return data il parametro inserito
    */
   public Date getData() {
       return data;
   }
   
   /**
    * Metodo che setta il parametro letto dalla classe List<Tirocinante>
    * @param listaTirocinante è settato dopo la lettura
    */    
   public void setListaTirocinante(List<Tirocinante> listaTirocinante) {
       this.listaTirocinante = listaTirocinante;
   }

   /**
    * Metodo che prende il parametro letto dalla classe List<Tirocinante>
    * @return listaTirocinante parametro preso dalla lettura
    */
   public List<Tirocinante> getListaTirocinante() {
       return listaTirocinante;
   }
   
   /**
    * Metodo che setta il parametro letto dalla classe Massimo
    * @param massimo è settato dopo la lettura
    */    
   public void setMassimo(Massimo massimo) {
       this.massimo = massimo;
   }

   /**
    * Metodo che prende il parametro letto dalla classe Massimo
    * @return massimo parametro preso dalla lettura
    */
   public Massimo getMassimo() {
       return massimo;
   }
   
}
