package atsilo.storage;

import atsilo.entity.Feedback;
import atsilo.entity.MenuMensa;

import atsilo.entity.Tirocinante;

import java.sql.Date;

import java.util.List;

public class DBMenuMensa extends DBBeans {
    
    public DBMenuMensa(Database db){
        super("MenuMensa",db);
    }
    
    public List<MenuMensa> ricercaMenuMensaPerCategoriaBambino(String categoria){
        List<MenuMensa> menu;
        return menu;   
    }
    public List<MenuMensa> ricercaMenuMensaPerTipologia(String Tipologia){
        List<MenuMensa> menu;
        return menu;   
        }
    
    public List<MenuMensa> ricercaMenuMensaPerPrimoPasto(String primoPasto){
        List<MenuMensa> menu;
        return menu;   
        }
    
    public List<MenuMensa> ricercaMenuMensaPerSecondoPasto(String secondoPasto){
        List<MenuMensa> menu;
        return menu;   
        }
    
    public List<MenuMensa> ricercaMenuMensaPerContorno(String contorno){
        List<MenuMensa> menu;
        return menu;   
        }
    
     public List<MenuMensa> ricercaMenuMensaPerFrutta(String frutta){
        List<MenuMensa> menu;
        return menu;   
        }
     
    public List<MenuMensa> ricercaMenuMensaPerData(Date data){
         List<MenuMensa> menu;
        return menu;   
        }
                                            
    
    
    }