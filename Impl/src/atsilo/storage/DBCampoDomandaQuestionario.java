package atsilo.storage;

import atsilo.entity.CampoDomandaQuestionario;

public class DBCampoDomandaQuestionario extends DBBeans {
    
    /**
     * Costruttore
     * @param db
     */
    public DBCampoDomandaQuestionario(Database db){ super("CampoDomandaQuestionario",db);}
    
    
    public List<CampoDomandaQuestionario> ricercaPerTipo(String tipo){} //aggiunto
    
    public List<String> ricercaDomandaQuestionarioAppartenenza(CampoDomandaQuestionario c){}//aggiunto
    
    public List<String> ricercaRispostaQuestionarioAppartenenza(CampoDomandaQuestionario c){}//aggiunto

}