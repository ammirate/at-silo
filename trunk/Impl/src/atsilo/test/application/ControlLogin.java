package atsilo.test.application;


/**
 *  STUB per il Control Login (che tra l'altro non può funzionare così come è)
 *  
 *  @author Alfonso Murolo
 */
public class ControlLogin {
    /**
     * Questa variabile verrà inizializzata quando la classe sarà caricata per la prima volta.
     * Singleton vuol dire una sola istanza di questa classe, e sarà memorizzata in INSTANCE.
     */
    private static final ControlLogin INSTANCE = new ControlLogin();

    /**
     * Username e passwords per il funzionamento stub
     */
    private static final String[] usernames = {"genitore", "impiegato", "educatore","psicopedagogo","scienzeformazione","delegatorettore" }; 
    private static final String[] passwords = {"genitore", "impiegato", "educatore","psicopedagogo","scienzeformazione","delegatorettore" };
    private static final String[] tipology =  {"genitore", "impiegato", "educatore","psicopedagogo","delegato_scfm","delegato_rettore" };
    ControlLogin() {
       
         
    }

    public Boolean getValoreLogin(String username, String password, String tipologia) {

        String passwordCheFacciamoFintaInInput = username;
        String usernameCheFacciamoFintaInInput = password;
        String tipologiaCheFacciamoFintaInInput = tipologia;
        int i=0;
        for(String corrente : usernames)
        {
            if (usernameCheFacciamoFintaInInput.equals(corrente))//username trovato in posizione i
            {
                //controllo (nella posizione i dell'array password) se la password e la tipologia corrispondono
                    String pwd=passwords[i];
                    String tipologia_temp=tipology[i];
                    if (passwordCheFacciamoFintaInInput.equals(pwd) && tipologiaCheFacciamoFintaInInput.equals(tipologia_temp))
                    return true;

            }
            i++;
        }
        
       return false;
    }

    public static ControlLogin getInstance() {
        /**
         * Questa è una vera implementazione di un singleton.
         * Vedete anche l'inizializzazione di INSTANCE all'inizio del file..
         */
         return INSTANCE;
    }
}
