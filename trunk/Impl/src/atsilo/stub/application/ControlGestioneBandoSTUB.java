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
    private ControlGestioneBandoSTUB(){
        this.b = new Bando(1, "2005", "2012", "2007", "2013", "2014", 15, null);
    } 
    

    
    public static ControlGestioneBandoSTUB getIstance() {
        return INSTANCE;
    }
    
    public Bando getBando(){
        return b;
    }

    public boolean modificaBando(String inizioBando, String fineBando,String inizioPresentazione, String finePresentazione,String fineRinuncia,int posti,String path){
        if(getBando() != null){
            getBando().setDataInizioBando(inizioBando);
            getBando().setDataFineBando(fineBando);
            getBando().setDataInizioPresentazioneRinuncia(inizioPresentazione);
            getBando().setDataFinePresentazioneRinuncia(finePresentazione);
            getBando().setDataFineRinuncia(fineRinuncia);
            getBando().setPostiDisponibili(posti);
            getBando().setPath(path);
            return true;
        }
        else{
            Bando b = new Bando(1,inizioBando,fineBando,inizioPresentazione,finePresentazione,fineRinuncia,posti,path);
            return true;
        }
    }
}