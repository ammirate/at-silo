/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBBeansInterface.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Alfonso Murolo <funforums@gmail.com>, 19/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.storage;

/**
 * Classe DBBeansInterface
 * <Descrizione classe>
 * 
 * @author Alfonso Murolo <funforums@gmail.com>
 * 
 */
public interface DBBeansInterface<E> {
    
    public boolean inserisci(E realBean);
    
    public boolean replace(E realBean, E newRealBean);
    
    public boolean delete(E realBean);
    
    public Iterable<E> getAll();
    
}
