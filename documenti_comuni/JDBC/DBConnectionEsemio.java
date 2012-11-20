public class DBConnection {


/**
 * il metodo connectionTODB permette di aprire la connessione con il database 
 * "nomedb".
 * Precondizione : il database nomedb deve esistere e i driver devono essere
 * caricati correttamente prima dell'avvio
 * postcondizioni : se il database esiste e se i driver sono stati caricati
 * correttamente ritorna la connessione altrimenti genera eccezzione:
 * ClassNotFoundException (errore nel caricamento dei driver)
 * SQLException (errore nell'aperture del Database)
 * @param nomeDb : String
 * @return Connection
 */
    public Connection connectionTODB(String nomeDb)
    {
        

        if((nomeDb==null)||(nomeDb.equals("")))
        {
            String fallimento="nome database non valido";
            StubException errore=new StubException();//StubException sarà l'eccezione che successivamente lancerà un interfaccia
            errore.stampaException(fallimento);
            return null;
        }
        
       try
       {
           Class.forName("com.mysql.jdbc.Driver");
           String url = "jdbc:mysql://localhost/";
           String url1=url+nomeDb+"?user=root&password=";
           con =DriverManager.getConnection(url1);
           
           return con;
           
       }

       catch( SQLException e)
         {
            
            String fallimento="connessione fallita";
            StubException errore=new StubException();//StubException sarà l'eccezione che successivamente lancerà un interfaccia
            errore.stampaException(fallimento);
            Connection c=null;
            return c;
            
         }

       catch( ClassNotFoundException e)
      {
             String fallimento="caricamento driver errato";
             StubException errore=new StubException();//StubException sarà l'eccezione che successivamente lancerà un interfaccia 
             errore.stampaException(fallimento);
            Connection c=null;
            return c;

      }

      
       
    }

/**
 * il metodo closeConnectionTODB permette di chiudere la connessione con del database
 * precondizione : con non deve essere null
 * postcondizione : se con non è null chiude la connessione al database altrimenti genera
 * eccezione:
 * SQLException;
 * @param con : Connection
 */
    public void closeConnectionTODB(Connection con)
    {
        try
        {
            con.close();
        }

        catch(SQLException e)
        {
              String fallimento="impossibile chiudere la connessione con il database";
              StubException errore=new StubException();//StubException sarà l'eccezione che successivamente lancerà un interfaccia
              errore.stampaException(fallimento);
        }

         catch(NullPointerException e)
        {
              String fallimento="connessione errata";
              StubException errore=new StubException();//StubException sarà l'eccezione che successivamente lancerà un interfaccia 
              errore.stampaException(fallimento);
        }
       
    }
    
      private Connection con;
  
}

