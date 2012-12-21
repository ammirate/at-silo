/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlData.java
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

import java.sql.SQLException;
import java.util.List;

import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.RispostaQuestionario;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBCampoDomandaQuestionario;
import atsilo.storage.DBDomandaQuestionario;
import atsilo.storage.DBRispostaQuestionario;
import atsilo.storage.Database;


/**
 * Classe ControlData
 * <Descrizione classe>
 * 
 * @author Lindig
 * 
 */
public class ControlData {
    
   public ControlData()
   {
   
   }
   
   public boolean isEqual(DomandaQuestionario d, List<RispostaQuestionario> r) throws SQLException, DBConnectionException
   {
      
       ControlQuestionario controlQ = ControlQuestionario.getIstance();
       for(RispostaQuestionario risposta : r)
       {
           if(controlQ.domandaIsEqual(d.getId(), controlQ.getDomanda(risposta.getIdDomanda())))
           {
               return true;
           }
       }
      
       
       return false;
   }
   
   public String isEqualCampo(CampoDomandaQuestionario c, List<RispostaQuestionario> r) throws SQLException
   { 
       ControlQuestionario controlQ = ControlQuestionario.getIstance();
     
       Database db = new Database();
       db.apriConnessione();
     for(RispostaQuestionario risposta : r)
      {
           
           
           
           
           DBDomandaQuestionario campoD = new DBDomandaQuestionario(db);
           DomandaQuestionario domanda=  campoD.getDomanda(c.getIdDomandaQuestionario());
           
           DomandaQuestionario dom_ris=campoD.getDomanda(risposta.getIdDomanda());
           
           if((controlQ.domandaIsEqual(dom_ris.getId(), domanda)))
           {
               String risposta_valore= risposta.getValore();
               String risposta_val_spazi= new String(risposta.getValore());
               String c_valore= c.getValore();
               if(risposta_valore.contains(" "))
               {
                   risposta_val_spazi=risposta_valore.replaceAll(" ", "");
               }
               if(c_valore.contains(" "))
               {
                   c_valore.replaceAll(" ", "");
               }
               
               if(risposta_val_spazi.equals(c_valore))
               {   db.chiudiConnessione();
                   return risposta.getValore();
               
               }
              
          }
             
      }
     db.chiudiConnessione();
    
      return null;
   }
   

}
