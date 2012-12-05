package atsilo.application;

import atsilo.entity.Servizio;

//TODO scrivere la javadoc

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlMensa.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class ControlMensa {
    
    private static final ControlMensa cme;
    
    private ControlMensa(){
        
    }
    public static final ControlMensa getInstance(){
        return null;
    }
    public boolean inserisciPianoPasto(Servizio s, String pianopasto){
        return false;
        
    }

    public boolean modificaPianoPasto(Servizio s, String pianopasto){
        
    }
    public boolean eliminaPianoPasto(Servizio s){
        return false;
        
    }

    public String ricercaPianoPasto(Servizio s){
        return null;
    }
    




    
    
    
    
    
}
