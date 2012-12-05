package atsilo.application;

import atsilo.entity.MenuMensa;
import java.sql.Date;

import java.util.List;

//TODO scrivere javadoc per classe e metodi

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
