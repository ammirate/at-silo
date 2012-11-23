package atsilo.storage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import atsilo.entity.Account;
import atsilo.entity.Bando;

/**
 * 
 * Classe DBBando
 * <Descrizione classe>
 * 
 * @author 
 *
 */
public class DBBando extends DBBeans<Bando> {
    /**
     * 
     * @param db
     */
    public DBBando(String nomeTabella,Database db){
        super(nomeTabella,db);
    }
    
    /**
     * 
     * @param id
     * @return
     */
    public Bando cercaBandoPerId (String id) 
    {
        Bando ObjBando = null;
       return ObjBando; 
    }
    
    /**
     * 
     * @param dataInizio
     * @return
     */
    public Bando cercaPerDataInizio (String dataInizio) 
    {
        Bando ObjBando = null;
        return ObjBando;
     }
    
    /**
     * 
     * @param dataFine
     * @return
     */
    public Bando cercaPerDataFine (String dataFine) 
    {
        Bando ObjBando = null;
        return ObjBando;
    }

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    @Override
    public HashMap getMappingFields() {
        HashMap<String,String> toReturn = new LinkedHashMap<String,String>();
        toReturn.put("id", "id");
        toReturn.put("dataInizio","data_inizio");
        toReturn.put("dataFine","data_fine");
        return toReturn;
    }

    /* (non-Javadoc)
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    @Override
    public List getKeyFields() {
        ArrayList<String> toReturn = new ArrayList<String>();
        toReturn.add("id");
        return toReturn;
    }
}