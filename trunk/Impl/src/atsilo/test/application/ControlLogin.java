package atsilo.test.application;


/**
 *  STUB per il Control Login (che tra l'altro non pu� funzionare cos� come �)
 *  
 *  @author Alfonso Murolo
 */
public class ControlLogin {
    /**
     * Questa variabile verr� inizializzata quando la classe sar� caricata per la prima volta.
     * Singleton vuol dire una sola istanza di questa classe, e sar� memorizzata in INSTANCE.
     */
    private static final ControlLogin INSTANCE = new ControlLogin();

    /**
     * Username e passwords per il funzionamento stub
     */
    private static final String[] usernames = {"genitore", "impiegato", "educatore","psicopedagogo","scienzeformazione","delegatorettore" }; 
    private static final String[] passwords = {"genitore", "impiegato", "educatore","psicopedagogo","scienzeformazione","delegatorettore" };
     
    ControlLogin() {
       
         
    }

    Boolean getValoreLogin(String username, String password) {

        String passwordCheFacciamoFintaInInput = username;
        String usernameCheFacciamoFintaInInput = password;
        int i=0;
        for(String corrente : usernames)
        {
            if (usernameCheFacciamoFintaInInput.equals(corrente))//username trovato in posizione i
            {
                //controllo (nella posizione i dell'array password) se la password corrisponde
                    String pwd=passwords[i];
                    passwordCheFacciamoFintaInInput.equals(pwd);
                    return true;

            }
            i++;
        }
        
       return false;
    }

    public static ControlLogin getInstance() {
        /**
         * Questa � una vera implementazione di un singleton.
         * Vedete anche l'inizializzazione di INSTANCE all'inizio del file..
         */
         return INSTANCE;
    }
}
