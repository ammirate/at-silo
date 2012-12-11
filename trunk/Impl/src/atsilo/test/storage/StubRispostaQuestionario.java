package atsilo.test.storage;

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
    
    public List <RispostaQuestionario> getRisposteQuestionarioPerGenitore(Genitore g, int idDomanda) throws SQLException{
        List<RispostaQuestionario> l =new ArrayList<RispostaQuestionario>();
        RispostaQuestionario r=new RispostaQuestionario(1,"22 anni",1,"csrntn91l26c129j");
        
        if(r.getCFgenitore() == g.getCodiceFiscale())
            if(r.getIdDomanda() == idDomanda)
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
        RispostaQuestionario r=new RispostaQuestionario(1,"22 anni",1,"csrntn91l26c129j");
        RispostaQuestionario r1=new RispostaQuestionario(2,"3 figli",2,"csrntn91l26c129j");
        RispostaQuestionario r2=new RispostaQuestionario(3," gennaio 2009",3,"csrntn91l26c129j");
      
        l.add(r);
        l.add(r1);
        l.add(r2);
        return l;
    }
}
