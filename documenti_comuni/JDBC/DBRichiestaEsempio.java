
import Stub.*;
import java.sql.*;
import java.util.ArrayList;
/**
 * La classe DBRichiesta permette di effettuare query alla tabella richiesta del database
 * @author Linda Di Geronimo
 * @version 1
 *  @data 27/12/2010
 * @copyright 2010 CBUnisa project. All rights reserved.
 */
public class DBRichiesta {

/**
 * costruttore DBRichiesta
 * precondizione : con non può essere null
 * 
 * @param con : Connection
 */
    public DBRichiesta(Connection con)
    {
        icon=con;
    }
/**
 * permette di inserire una nuova richiesta al database
 * precondizioni : richiesta non deve esistere nel database e non deve essere null
 * 
 * @param richiesta : Richiesta
 */
    public void inserisci(Richiesta richiesta)
    {
        try{
                    Date dat=new Date(0000-00-00);
					//icon è la connessione al database, variabile creata proprio dopo aver effettuato la connessione
					//per dettagli vedere DBConnectionEsempio.java dove viene spiegata tale connessione
                    stmt=icon.prepareStatement("insert into richiesta (CodiceRichiesta,datarichiesta,descrizione,titoloLibro,autorelibro,isbnlibro,richiestaInterbibliotecaria,statorichiesta,codicefiscale) values (?,?,?,?,?,?,?,?,?)");
                    //la query di insert è un semplice inserimento nel database Richiesta di una nuova tupla nel database
					//i ? interrogativi indicano che i valori da inserire bisognerà indicarli nelle righe di codice che seguono.
					stmt.setInt(1,richiesta.getCodiceRichiesta());
					//come si vede nella query 'insert into richiesta (CodiceRichiesta,...)' il primo parametro da inserire nel db è Codice Richiesta, il codice richiesta è un intero
					//e proprio per questo si farà stmt.setInt se fosse stata una stringa (come si vede nelle prossime righe di codice) sarebbe stato stmt.setString
					//il primo numero indica l'ordine in cui è presente CodiceRichiesta nella query, in questo caso è all'inizio e quindi sarà 1
					//il secondo parametro da proprio il valore che si vuole inserire nel DB
                    stmt.setDate(2,dat.valueOf(richiesta.getDataRichiesta()));
                    stmt.setString(3,richiesta.getDescrizione());
                    stmt.setString(4,richiesta.getTitoloLibro());
                    stmt.setString(5,richiesta.getAutori());
                    stmt.setString(6,richiesta.getIsbnLibro());
                    stmt.setBoolean(7, richiesta.isRichiestaInterbibliotecaria());
                    stmt.setString(8,richiesta.getStatoRichiesta());
                    stmt.setString(9,richiesta.getCliente().getCodiceFiscale());
                    stmt.execute();
                    stmt.close();//chiudere SEMPRE l'stmt dopo aver finito di utilizzarlo 

             }
              catch(SQLException e)
                 {
                     String fallimento="inserimento richiesta fallito";
                     StubException errore=new StubException();
                     errore.stampaException(fallimento);

                 }
    }
/**
 * permette di cancellare una richiesta dal database
 * precondizione : richiesta deve esistere nel database e non deve essere null
 * @param richiesta : Richiesta
 */
    public void cancella(Richiesta richiesta)
    {
            try{
                    stmt=icon.prepareStatement("DELETE from richiesta WHERE CodiceRichiesta=?" );
                    stmt.setInt(1,richiesta.getCodiceRichiesta());
                    stmt.execute();
                    stmt.close();

                }
              catch(SQLException e)
                 {
                     String fallimento="cancellazione richiesta fallita";
                     StubException errore=new StubException();
                     errore.stampaException(fallimento);

                 }
    }
/**
 * permette di ricercare tutte le richieste di cliente con username pari al parametro indicato in input
 * precondizione : username non può essere null
 * postcondizione : se non esistono richieste di quel cliente o se non esiste quel cliente restituisce un arraylist vuoto (senza elementi)
 * @param username
 * @return ArrayList Richiesta
 */
    public ArrayList<Richiesta> ricercaRichieste(String username)
    {
       ArrayList<Richiesta> lista =new ArrayList<Richiesta>();
       
        try
        {   DBCliente c=new DBCliente(icon);
            Cliente cliente_richiesta=c.ricercaCliente(username);

            if(cliente_richiesta!=null)
            {
                stmt = icon.prepareStatement("SELECT CodiceRichiesta,datarichiesta,descrizione,titoloLibro,autorelibro,isbnlibro,richiestaInterbibliotecaria,statorichiesta,codicefiscale FROM richiesta WHERE codicefiscale=?");
                stmt.setString(1, cliente_richiesta.getCodiceFiscale());
            
                ResultSet rs=stmt.executeQuery();

                         while(rs.next())
                                {
                
                                     Richiesta ricerca_richiesta=new Richiesta(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getBoolean(6), rs.getString(7), rs.getString(8), cliente_richiesta );
                                     lista.add(ricerca_richiesta);
                                }
            }


        }
         catch (SQLException e)
        {
                     String fallimento="ricerca richieste fallita";
                     StubException errore=new StubException();
                     errore.stampaException(fallimento);

        }
        return lista;
    }
/**
 * permette di ricercare tutte le richieste presenti nella base dati
 * postcondizione : se non vi sono richieste restituisce un arraylist vuoto
 * @return ArrayList Richiesta
 */
    public ArrayList<Richiesta> ricercaRichieste()
    {
        ArrayList<Richiesta> lista =new ArrayList<Richiesta>();
        try
        {
            stmt=icon.prepareStatement("SELECT CodiceRichiesta,datarichiesta,descrizione,titoloLibro,autorelibro,isbnlibro,richiestaInterbibliotecaria,statorichiesta,codicefiscale FROM richiesta");
            ResultSet rs=stmt.executeQuery();

            while(rs.next())
            {
                DBCliente cliente=new DBCliente(icon);
                Cliente nuovo=cliente.ricercaClientePerCodiceFiscale(rs.getString(9));
                Richiesta ricerca_richiesta=new Richiesta(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getBoolean(6), rs.getString(7), rs.getString(8), nuovo );
                if(nuovo!=null)
                {lista.add(ricerca_richiesta);}
            }

         
        
        }
         catch (SQLException e)
        {
                     String fallimento="ricerca richieste fallita";
                     StubException errore=new StubException();
                     errore.stampaException(fallimento);

        }
        return lista;
    }

}