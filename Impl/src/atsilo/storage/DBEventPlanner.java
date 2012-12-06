package atsilo.storage;

import atsilo.entity.EventPlanner;

public class DBEventPlanner extends DBBeans {
    
    public DBEventPlanner(Database db){
        super("EventPlanner",db);
    }

    /**
     * Mi serve questo metodo per il controlLogin by Parisi
     * @param codiceFiscale
     * @return
     */
    public Object ricercaEventPlannerPerCF(String codiceFiscale) {
        // TODO Scheletro generato automaticamente
        return null;
    }}