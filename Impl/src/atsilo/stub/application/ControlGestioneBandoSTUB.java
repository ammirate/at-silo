/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlGestioneBandoSTUB.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Luca, 05/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.stub.application;

import atsilo.entity.Bando;


/**
 * Classe ControlGestioneBandoSTUB
 * <Descrizione classe>
 * 
 * @author Luca
 * 
 */
public class ControlGestioneBandoSTUB {
    
    private static final ControlGestioneBandoSTUB INSTANCE = new ControlGestioneBandoSTUB();
    private Bando b;
    private ControlGestioneBandoSTUB() 
    {
        this.b = new Bando(1, "2010", "2012");
    } 
    

    
    public static ControlGestioneBandoSTUB getIstance() {
        return INSTANCE;
    }
    public Bando getBando(){
        return b;
    }
    public boolean modificaBando(String inizio, String fine){
        if(getBando() != null){
            getBando().setDataFine(fine);
            getBando().setDataInizio(inizio);
            System.out.println(getBando().getDataInizio()+" "+getBando().getDataFine());
            return true;
        }
        else{
            Bando b = new Bando(1,inizio,fine);
            System.out.println(b.getDataInizio()+" "+b.getDataFine());
            return true;
        }
    }
}