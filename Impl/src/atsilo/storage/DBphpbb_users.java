package atsilo.storage;

import atsilo.entity.Account;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.EducatoreDidattico;
import atsilo.entity.Genitore;
import atsilo.entity.Psicopedagogo;
import atsilo.entity.ResponsabileQuestionario;
import atsilo.entity.Utente;
import atsilo.entity.phpbb_user;
import atsilo.storage.DBBeans.Assegnazione;
import atsilo.entity.Tirocinante;
import atsilo.entity.PersonaleAsilo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Collections;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: DBphpbb_users.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 */

public class DBphpbb_users extends DBBeans<phpbb_user> 
{
    /**
     * Crea un gestore per il bean phpbb_user
     * @param nomeTabella nome reale della tabella nel database
     * @param db database con relativa connessione
     */
    
    private static final Map<String,String> MAPPINGS=creaMapping();
    private static final List<String> CHIAVE=creaChiave(); 
    
    
     /**
     * Costruttore
     * @param nomeTabella
     * @param db
     */
    public DBphpbb_users(Database db){super("phpbb_users",db); }
    
    
    /**
     * metodo creaMapping
     * @return 
     */
    private static Map<String,String> creaMapping()
    {
        Map<String,String> res= new HashMap<String,String>();
        res.put("userId", "user_id");
        res.put("userType", "user_type");
        res.put("groupId","group_id");
        res.put("userPermissions","user_permissions");
        res.put("userPermFrom", "user_perm_from");
        res.put("userIp","user_ip");
        res.put("userRegdate","user_regdate");
        res.put("username","username");
        res.put("usernameClean", "username_clean");
        res.put("password","user_password");
        res.put("userPasschg", "user_passchg");
        res.put("userPassConvert","user_pass_convert");
        res.put("email", "user_email");
        res.put("userEmailHash","user_email_hash");
        res.put("userBirthday","user_birthday");
        res.put("userLastvisit","user_lastvisit");
        res.put("userLastmark","user_lastmark");
        res.put("userLastpostTime", "user_lastpost_time");
        res.put("userLastpage","user_lastpage");
        res.put("userLastConfirmKey","user_last_confirm_key");
        res.put("userLastSearch","user_last_search");
        res.put("userWarnings","user_warnings");
        res.put("userLastWarning", "user_last_warning");
        res.put("userLoginAttempts","user_login_attempts");
        res.put("userInactiveReason","user_inactive_reason");
        res.put("userInactiveTime", "user_inactive_time");
        res.put("userPosts", "user_posts");
        res.put("userLang","user_lang");
        res.put("userTimezone", "user_timezone");
        res.put("userDst","user_dst");
        res.put("userDateFormat","user_dateformat");
        res.put("userStyle","user_style");
        res.put("userRank","user_rank");
        res.put("userColour","user_colour");
        res.put("userNewPrivmsg","user_new_privmsg");
        res.put("userUnreadPrivmsg", "user_unread_privmsg");
        res.put("userLastPrivMsg", "user_last_privmsg");
        res.put("userMessageRules", "user_message_rules");
        res.put("userFullFolder", "user_full_folder");
        res.put("userEmailtime","user_emailtime");
        res.put("userTopicShowDays","user_topic_show_days");
        res.put("userTopicSortbyType","user_topic_sortby_type");
        res.put("userTopicSortbyDir","user_topic_sortby_dir");
        res.put("userPostShowDays", "user_post_show_days");
        res.put("userPostSortbyType","user_post_sortby_type");
        res.put("userPostSortbyDir", "user_post_sortby_dir");
        res.put("userNotify","user_notify");
        res.put("userNotifyPm", "user_notify_pm");
        res.put("userNotifyType","user_notify_type");
        res.put("userAllowPm", "user_allow_pm");
        res.put("userAllowViewonline", "user_allow_viewonline");
        res.put("userAllowViewemail","user_allow_viewemail");
        res.put("userAllowMassemail","user_allow_massemail");
        res.put("userOptions","user_options");
        res.put("userAvatar", "user_avatar");
        res.put("userAvatarType","user_avatar_type");
        res.put("userAvatarWidth","user_avatar_width");
        res.put("userAvatarHeight","user_avatar_height");
        res.put("userSig","user_sig");
        res.put("userSigBbcodeUid","user_sig_bbcode_uid");
        res.put("userSigBbcodeBitfield","user_sig_bbcode_bitfield");
        res.put("userFrom","user_from");
        res.put("userIcq","user_icq");
        res.put("userAim","user_aim");
        res.put("userYim","user_yim");
        res.put("userMsnm","user_msnm");
        res.put("userJabber","user_jabber");
        res.put("userWebsite","user_website");
        res.put("userOcc","user_occ");
        res.put("userInterests","user_interests");
        res.put("userActkey","user_actkey");
        res.put("userNewpasswd","user_newpasswd");
        res.put("userFormSalt","user_form_salt");
        res.put("userNew","user_new");
        res.put("userReminded","user_reminded");
        res.put("userRemindedTime","user_reminded_time");
        
        
        
        
        return Collections.unmodifiableMap(res);
    }
    
    
    /**
     * Metodo che crea una chiave
     * @return 
     */
    private static List<String> creaChiave()
    {
        List<String> res=  Arrays.asList("user_id");
        
        return Collections.unmodifiableList(res);
    }
   
    
    /*
     * @see atsilo.storage.DBBeans#getMappingFields()
     */
    protected Map<String,String> getMappingFields(){return MAPPINGS;}
    
    
    /**
     * @see atsilo.storage.DBBeans#getKeyFields()
     */
    protected List<String> getKeyFields() {return CHIAVE;}


    /**We will never read from here
     * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
     */
    @Override
    protected phpbb_user creaBean(ResultSet r) throws SQLException {
        // TODO Scheletro generato automaticamente
        return null;
    }
    

    
       
    
    
}


