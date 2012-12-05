package atsilo.application;

import atsilo.entity.MenuMensa;
import java.sql.Date;

import java.util.List;

//TODO scrivere javadoc per classe e metodi

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlMenu.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 27/11/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

public class ControlMenu {
    
private static final ControlMenu cm;

    private ControlMenu(){
        
    }
    public static ControlMenu getIstance(){
        return cm;         
     }
    
     public boolean inserisciMenuMensa (MenuMensa m){
          return false;
          
      }
          
     public boolean modificaMenuMensa (MenuMensa m, MenuMensa newM){
         return false;
         
     }
     public MenuMensa eliminaMenu(MenuMensa m){
       return null;  
     }
     public List<MenuMensa> ricercaMenu (MenuMensa m){
         return null;
     }
     
     
     public List<MenuMensa> getElencoMenu(){
         return null;
     }
     public List<MenuMensa> getMenuPerTitolo(String titolo){
         return null;
     }

    public List<MenuMensa> getMenuPerId(String id){
        return null;
    }
    public List<MenuMensa> getMenuPerCategoriaBambino(String categoriaB){
        return null;
    }

    public List<MenuMensa> getMenuPerData(Date d){
        return null;
    }
    public List<MenuMensa> getMenuPerTipologia(String tipologia){
        return null;
    }





















}
