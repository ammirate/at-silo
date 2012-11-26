package atsilo.test.application;

import java.util.ArrayList;

import atsilo.entity.Utente;
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
    private static final String[] usernames = {"tiberio.timperi", "mario.monti" };
    private static final String[] passwords = {"ilLottoAlle8", "imu" };
     
    ControlLogin() {
         
    }

    Boolean getValoreLogin(Utente utente) {
        /**
         * Questo è uno stub ma il control così scritto sappiate che non funzionerà mai.
         * Probabilmente gli passerete username e password, non un oggetto utente!
         */
        String passwordCheFacciamoFintaInInput = "sbagliata";
        String usernameCheFacciamoFintaInInput = "tiberio.timperi";
        for(String corrente : usernames)
        {
            if (usernameCheFacciamoFintaInInput.equals(corrente))
            {
                for(String pwd : passwords)
                {
                    passwordCheFacciamoFintaInInput.equals(pwd);
                    return true;
                }
            }
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
