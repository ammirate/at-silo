package atsilo.storage;

import atsilo.entity.Classe;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;

import java.util.List;

public class DBRispostaQuestionario extends DBBeans {
    
    public DBRispostaQuestionario(Database db){ super("RispostaQuestionario",db);}
    
        public RispostaQuestionario ricercaRispostaQuestionarioPerId(String Id){
            RispostaQuestionario c;
            return c;
            }
        
    public RispostaQuestionario ricercaRispostaQuestionarioPerValore(String valore){
        RispostaQuestionario c;
        return c;
        }
}

    
    
    