/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlCampiRadioCheck.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Lindig, 21/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.application;

import java.util.List;

import atsilo.entity.CampoDomandaQuestionario;

/**
 * Classe ControlCampiRadioCheck
 * <Descrizione classe>
 * 
 * @author Lindig
 * 
 */
public class ControlCampiRadioCheck {
    public ControlCampiRadioCheck(List<CampoDomandaQuestionario> campi)
    {
        this.campi=campi;
    }
    
    public boolean isAllignableInRow()
    {
        if(campi.size()>5)
        {
            return false;
        }
        
        for(CampoDomandaQuestionario campo : campi)
        {
            if(campo.getTipo()=="text")
            {
                return false;
            }
            if(campo.getDescrizione().length()>15)
            {
                return false;
            }
        }
        return true;
    }
    
    List<CampoDomandaQuestionario> campi;
}
