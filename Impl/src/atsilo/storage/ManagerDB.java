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
     * Costruttore della classe
     */
    public ManagerDB();
    
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
    public List<String> getChiavi();
    
    /**
     * Inserisci dei valori nella tabella
     * @param  valori da inserire nella tabella
     * @return true in caso di inserimento riuscito
     *         false altrimenti
     */
    public boolean insert(List<String> valori);

     /**
      * Esegue una selezione di tutte le tuple che soddisfano le condidioni specificate dagli attributi passati in input
      * 
      * @param Lista di attributi su cui effettuare la selezione delle tuple
      * @param Lista di attributi su cui effettuare la ricerca
      * @param Lista dei valori dei corrispondenti attributi
      * 
      * @return Restituisce la matrice delle tuple ottenute dalla selezione
      */
    public List<ArrayList<String>> selezione(List<String> nomeAttributo ,List<String> nomiAttributo, List<String> valoriAttributi);

    /**
     *
     * @param valori
     * @param campi
     * @return
     */
    public boolean update(List<String> valori, List<String> campi);
    
    /**
     * 
     */
    public Boolean rimuovi(List<String> chiavi,List<String> valChiavi);
}
