/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DriverControlRegistro.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio, 04/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.application;

import atsilo.entity.Classe;
import atsilo.entity.Registro;
import atsilo.exception.DBConnectionException;
import atsilo.exception.RegistroException;

/**
 * Classe DriverControlRegistro
 * <Descrizione classe>
 * 
 * @author Antonio
 * 
 */
public class DriverControlRegistro {
    
    static ControlRegistroTest cr;

    public static void main(String[] args) throws DBConnectionException, RegistroException{
        
        //test1
        cr = ControlRegistroTest.getIstance();
        Classe classe = new Classe(1,"primaA",null);
        
        Registro r1 = cr.getRegistro(classe);
        System.out.println("Prova #1: "+r1);
    }
    
    
    
    
}
