package atsilo.storage;

import java.util.ArrayList;
import java.util.List;

/**
 * Interfaccia che deve essere implementata da tutte le classi
 * che operano sulle tabella del database
 *
 * @author Angelo G. Scafuro
 * @version 1.0
 */
public interface ManagerDB {
    
    /**
     * Ottiene il nome della tabella
     * @return nome della tabella
     */
    public String getNomeTabella();

    /**
     * Setta il nome della tabella
     * @param newNome nuovo nome della tabella
     */
    public void setNomeTabella(String newNome);
   
    /**
     *
     * @return
     */
    public List<String> getNomiAttributi();
    
    /**
     * Ottiene il tipo di dato di una lista di attributi
     * @param  nomeAttributi lista dei nomi di tutti gli attributi
     * @return lista contenente i tipi degli attributi dati in input
     */
    public List<String> getTipoColonne(List<String> nomeAttributi);
    
    /**
     *
     * @return
     */
    public ArrayList<String> getChiaviPrimarie();
    
    /**
     * Inserisci dei valori nella tabella
     * @param  valori da inserire nella tabella
     * @return true in caso di inserimento riuscito
     *         false altrimenti
     */
    public boolean insert(List<String> valori);

     /**
      * Esegue una selezione di tutte le tuple che soddisfano la condidione "where" specificata dagli attributi passati in input
      * 
      * @param nomeAttributo Lista di attributi su cui effettuare la selezione delle tuple
      * @param nomeAttributi Lista di attributi su cui effettuare la ricerca
      * @param valoriAttributi Lista dei valori dei corrispondenti attributi
      * 
      * @return Restituisce la matrice delle tuple ottenute dalla selezione
      */
    public List<ArrayList<String>> selezione(List<String> nomeAttributo ,List<String> nomiAttributo, List<String> valoriAttributi);

    /**
     * Modifica una tupla di valori nella tabella
     * 
     * @param nomeAttributi Nomi degli attributi da aggiornare
     * @param valoriAttributi Valori da inserire nella tabella
     * @param chiavi attriubuti che identificano la tupla da modificare
     * @param valoriChiavi Valori degli attributi che identificano la tupla da modificare
     * 
     * @return Restituisce true se la modifica si verifica correttamente, false altrimenti
     */
    public boolean update(ArrayList<String> nomeAttributi,ArrayList<String> valoreAttributi, ArrayList<String> chiavi, ArrayList<String> valoriChiavi);
    
    /**
     * 
     */
    public boolean rimuovi(ArrayList<String> chiavi, ArrayList<String> valChiavi) ;
    
    /**
     * 
     */
    public ArrayList<ArrayList<String>> eseguiQuerySpecifica(String query);
}
