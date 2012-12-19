/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlForum.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Alfonso, 19/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.application.forum;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import atsilo.application.ControlDatiPersonali;

/**
 * Classe ControlForum
 * <Descrizione classe>
 * 
 * @author Alfonso
 * 
 */
public class ControlForum {
    private static final ControlForum INSTANCE = new ControlForum();
    private static final Logger LOG = Logger.getLogger("global");
    /**
     * 
     */
    public ControlForum() {
        // TODO Scheletro di costruttore autogenerato
    }
    
    public String getForumURL()
    {
        
        Properties prop = new Properties();
        
        try {
            prop.load(ControlForum.class.getResourceAsStream("forum.properties"));
        } catch (FileNotFoundException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Impossibile leggere le proprietà del forum", e);
        } catch (IOException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Errore di IO nella lettura del forum", e);
        }
                String urlforum = "http://"+prop.getProperty("atsilo.forum.host") +"/"+prop.getProperty("atsilo.forum.internal_url");
                
                return urlforum;
    }
    public static ControlForum getInstance() {
        return INSTANCE;
    }
    //Logger
    /*
     * private static final java.util.Logger LOG
     *         = Logger.getLogger(ControlForum.class.getName());
     */
    
    
    //Variabili di istanza
    
    
    //Costruttori
    
    
    //Metodi
}
