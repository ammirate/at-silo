package atsilo.test.application;

import java.util.ArrayList;

import atsilo.entity.Utente;
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
    private static final String[] usernames = {"tiberio.timperi", "mario.monti" };
    private static final String[] passwords = {"ilLottoAlle8", "imu" };
     
    ControlLogin() {
         
    }

    Boolean getValoreLogin(Utente utente) {
        /**
         * Questo � uno stub ma il control cos� scritto sappiate che non funzioner� mai.
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
         * Questa � una vera implementazione di un singleton.
         * Vedete anche l'inizializzazione di INSTANCE all'inizio del file..
         */
         return INSTANCE;
    }
}
