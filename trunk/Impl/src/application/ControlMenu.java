package application;

import atsilo.entity.MenuMensa;
import java.sql.Date;

import java.util.List;


public class ControlMenu {
    
private static final ControlMenu cm;

    private ControlMenu(){
        
    }
    public static ControlMenu getIstance(){
        return cm;         
     }
    
     public void inserisciMenuMensa (MenuMensa m){
         
      }
          
     public void modificaMenuMensa (MenuMensa m, MenuMensa newM){
         
     }
     public MenuMensa eliminaMenù (MenuMensa m){
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
