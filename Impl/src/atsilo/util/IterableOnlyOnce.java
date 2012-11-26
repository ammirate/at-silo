/**
 * Progetto \@silo
 * Copyleft
 */
package atsilo.util;

import java.util.Iterator;

/**
 * Classe IterableOnlyOnce
 * <Descrizione classe> * 
 */
public class IterableOnlyOnce<T> implements Iterable<T> {
    //Variabili di istanza
    private final Iterator<T> it;
    private boolean usato = false;
    
    //Costruttori
    /**
     * @param iterator iteratore da restituire
     */
    public IterableOnlyOnce(Iterator<T> iterator) {
        this.it = iterator;
    }
    
    //Metodi
    /**
     * @return Iteratore
     * @see java.lang.Iterable#iterator()
     */
    @Override
    public Iterator<T> iterator() {
        if (usato) {
            throw new IllegalStateException(
                    "Questo iteratore non si puo' usare due volte");
        } else {
            usato = true;
            return it;
        }
    }
    
    /**
     * Restituisce lo stato di utilizzo dell'iteratore
     * @return True se l'iteratore e' gia' stato usato,
     *          false altrimenti
     */
    public boolean usato() {
        return usato;
    }
}
