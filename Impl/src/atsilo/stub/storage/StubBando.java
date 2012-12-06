/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: StubBando.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Frank, 05/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.stub.storage;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import atsilo.entity.Account;
import atsilo.entity.Bando;
import atsilo.entity.DomandaIscrizione;
import atsilo.storage.Database;

/**
 * Classe StubBando <Descrizione classe>
 * 
 * @author Frank
 * 
 */
public class StubBando {
    private Bando bando;
    
    
    public StubBando(Database db) 
    {
        bando =new Bando();  
    }


    /**
     * @param bando
     * @return
     */
    public boolean inserisciBando(Bando bando) throws SQLException
    {
        this.bando=bando;
        return true;
    }


    public boolean modificaPostiDisponibili( int postiDisponibili)
    {
        bando.setPostiDisponibili(postiDisponibili);
        return true;
    }
    public boolean modificaintervalli (String dataInizioBando, String dataFineBando, String dataInizioPresentazioneRinuncia, 
            String dataFinePresentazioneRinuncia, String dataFineRinuncia)
    {

        bando.setDataInizioBando(dataInizioBando);
        bando.setDataFineBando(dataFineBando);
        bando.setDataInizioPresentazioneRinuncia(dataInizioPresentazioneRinuncia);
        bando.setDataFinePresentazioneRinuncia(dataFinePresentazioneRinuncia);
        bando.setDataFineRinuncia(dataFineRinuncia);
        return true;
    }
    /**
     * @param getiD
     * @return
     */
    public void replace(Bando darimpazziare ,Bando rimpiazzo)
    {
        this.bando=rimpiazzo;
    }
    public Bando getBando() throws SQLException 
    {
        return bando;
    }


    
    
    
}
