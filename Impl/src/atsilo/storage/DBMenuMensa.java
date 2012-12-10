package atsilo.storage;

import atsilo.entity.Feedback;
import atsilo.entity.MenuMensa;

import atsilo.entity.Tirocinante;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;
import java.util.Map;
/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBEventoMenuMensa.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, Fabio Napoli, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */ //TODO da implementare priorità bassa
public class DBMenuMensa extends DBBeans {
    
    public DBMenuMensa(Database db){
        super("menu_mensa",db);
    }
    
    public List<MenuMensa> ricercaMenuMensaPerCategoriaBambino(String categoria){
        List<MenuMensa> menu = null;
        return menu;   
    }
    public List<MenuMensa> ricercaMenuMensaPerTipologia(String Tipologia){
        List<MenuMensa> menu = null;
        return menu;   
        }
    
    public List<MenuMensa> ricercaMenuMensaPerPrimoPasto(String primoPasto){
        List<MenuMensa> menu = null;
        return menu;   
        }
    
    public List<MenuMensa> ricercaMenuMensaPerSecondoPasto(String secondoPasto){
        List<MenuMensa> menu = null;
        return menu;   
        }
    
    public List<MenuMensa> ricercaMenuMensaPerContorno(String contorno){
        List<MenuMensa> menu = null;
        return menu;   
        }
    
     public List<MenuMensa> ricercaMenuMensaPerFrutta(String frutta){
        List<MenuMensa> menu = null;
        return menu;   
        }
     
    public List<MenuMensa> ricercaMenuMensaPerData(Date data){
         List<MenuMensa> menu = null;
        return menu;   
        }

    /**
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    protected Map getMappingFields() {
        // TODO Scheletro generato automaticamente
        return null;
    }

    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    protected List getKeyFields() {
        // TODO Scheletro generato automaticamente
        return null;
    }

    /**
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected Object creaBean(ResultSet r) throws SQLException {
        // TODO Scheletro generato automaticamente
        return null;
    }
                                            
    
    
    }