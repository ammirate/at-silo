/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: StubBambino.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Elisa, 28/nov/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.stub.application;

import java.util.ArrayList;
import java.util.List;

import atsilo.entity.Bambino;
import atsilo.entity.DomandaIscrizione;
import atsilo.storage.Database;



public class StubBambino
{
    Bambino b;
    Database database;
    List<Bambino> lb =new ArrayList<Bambino>();
    List<String> cf =new ArrayList<String>();
    
    public StubBambino(Database db){
        database=db;
        b = new Bambino();
        lb.add(b);
        cf.add("DLIK57HWS35GTYM7");
    }
        
    public Bambino ricercaBambino(String cf){
        return b;
    }
    
    public Bambino rimuoviIscritto(Bambino b){
        return b;
    }
    
    public Boolean delete(Bambino b){
        return true;
    }
    
    public Boolean inserisci(Bambino b){
        return true;
    }
    
    public List<Bambino> ricercaBambiniIdonei(){
        return lb;
    }
    
    public List<Bambino> ricercaBambiniNonIdonei(){
        return lb;
    }
    
    public List<Bambino> ricercaBambiniRichiestaPrimoAnno(){
        return lb;
    }
    
    public List<Bambino> ricercaBambiniAnniPrecedenti(){
        return lb;
    }
    
    public List<Bambino> ricercaBambiniFineCicloScolastico(){
        return lb;
    }
    
    public List<Bambino> ricercaBambiniRinunciatari(){
        return lb;
    }
    
    public List<Bambino> ricercaBambiniServizioMensa(){
        return lb;
    }
    
    public List<Bambino> ricercaBambiniServizioPartTime(){
        return lb;
    }
    
    public List<Bambino> ricercaBambiniServizioFullTime(){
        return lb;
    }
    
    public List<Bambino> ricercaBambiniServizioDisabili(){
        return lb;
    }
    
    public List<String> ricercaCfBambiniPerUsername(String username){
        return cf;
    }
    
    

}