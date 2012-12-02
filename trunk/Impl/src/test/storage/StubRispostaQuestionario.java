package test.storage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import atsilo.entity.*;

public class StubRispostaQuestionario {
    public StubRispostaQuestionario() {
        super();
    }
    
    public List <RispostaQuestionario> getRisposteQuestionarioPerGenitore(Genitore g,String idDomanda) throws SQLException{
        List<RispostaQuestionario> l =new ArrayList<RispostaQuestionario>();
        RispostaQuestionario r=new RispostaQuestionario("1","30 anni",new DomandaQuestionario(),new Genitore());
        
        if(r.getGenitore().getCodiceFiscale() == g.getCodiceFiscale())
            if(r.getDomanda().getId() == idDomanda)
                l.add(r);
        return l;
        
    }
    
    
    /**
     * Restituisce la lista delle risposte date da tutti i genitori
     * ad una specifica domanda di un questionario
     * @param d domandaQuestionario di cui vogliamo le risposte
     * @return lista di RisposteQuestionario o null
     * @throws SQLException
     */    
    public List<RispostaQuestionario> getRisposteDomandaSpecifica(DomandaQuestionario d) throws SQLException{        
        
        List<RispostaQuestionario> l =new ArrayList<RispostaQuestionario>();
        RispostaQuestionario r=new RispostaQuestionario("1","30 anni",new DomandaQuestionario(),new Genitore());
        l.add(r);
        return l;
    }
}
