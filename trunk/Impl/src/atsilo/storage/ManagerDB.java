package atsilo.storage;

import java.util.ArrayList;
import java.util.List;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ManagerDB.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, 17/11/2012 (non responsabili)
 *-----------------------------------------------------------------
 */

/**
 * Interfaccia che deve essere implementata da tutte le classi
 * che operano sulle tabella del database
 */
public interface ManagerDB {
    
    /**
     * Ottiene il nome della tabella
     * @return nome della tabella
     */
    public String getNomeTabella();

    /**
     * Setta la tabella su cui eseguire le operazioni
     * @param newNome nuovo nome della tabella su cui eseguire le operazioni
     */
    public void setNomeTabella(String newNome);
   
    /**
     * Restituisce una lista con il nome di tutti gli attributi
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
     * Restituisce una lista con tutte le chiavi primarie
     * @return lista con chiavi primarie
     */
    public ArrayList<String> getChiaviPrimarie();
    
    /**
     * Inserisci i valori specificati nella tabella.Devono essere inseriti i valori per tutti i campi
     * @param  valori da inserire nella tabella
     * @return true in caso di inserimento riuscito
     *         false altrimenti
     */
    public boolean insert(List<String> valori);

     /**
      * Esegue una selezione di tutte le tuple che soddisfano la condidione "where" specificata dagli attributi passati in input
      * 
      * @param nomeAttributo Lista di attributi della select (null equivale a *)
      * @param nomiAttributo Lista di attributi su cui effettuare la ricerca (where) 
      * @param valoriAttributi Lista dei valori dei corrispondenti attributi (where)
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
    public boolean update(List<String> nomeAttributi,List<String> valoreAttributi, List<String> chiavi, List<String> valoriChiavi);
    
    /**
     * Rimuove dalla tabella i beans specificati dal valore dei loro attributi
     * @param chiavi lista delle chiavi dell'attributo da eliminare (condizione where)
     * @param valChiavi  valore delle chiavi dell'attributo da eliminare (condizione where)
     * @return true in caso di successo
     *         falso altrimenti
     */
    public boolean rimuovi(List<String> chiavi,List<String> valChiavi) ;
    
    /**
     * Esegue una query specifica passata in input
     * 
     * @param query Query da eseguire sul database
     * @return Lista con i risultati della query
     */
    public List<ArrayList<String>> eseguiQuerySpecifica(String query);
}
