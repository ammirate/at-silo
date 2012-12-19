/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: phpbb_user.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Alfonso, 19/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.entity;

/**
 * Classe phpbb_user
 * <Descrizione classe>
 * 
 * @author Alfonso
 * 
 */
public class phpbb_user {
    
    private int id;
    public int getId() {
        return id;
    }



    public void setId(int id) {
        this.id = id;
    }



    private int userId;
    private int userType=0;
    private int groupId=2;
    private String userPermissions="";
    private int userPermFrom=0;
    private String userIp="";
    private long userRegdate;
    private String username;
    private String usernameClean;
    private String password;
    private int userPasschg=0;
    private int userPassConvert=0;
    private String email;
    private long userEmailHash=0;
    private String userBirthday="";
    private int userLastvisit=0;
    private int userLastmark=0;
    private int userLastpostTime=0;
    private String userLastpage="";
    private String userLastConfirmKey="";
    private int userLastSearch=0;
    private int userWarnings=0;
    private int userLastWarning=0;
    private int userLoginAttempts=0;
    private int userInactiveReason=0;
    private int userInactiveTime=0;
    private int userPosts=0;
    private String userLang="it";
    private float userTimezone=1;
    private boolean userDst=true;
    private String userDateFormat="|d/m/Y|, G:i";
    private int userStyle=0;
    private int userRank=0;
    private String userColour="";
    private int userNewPrivmsg=0;
    private int userUnreadPrivmsg=0;
    private int userLastPrivMsg=0;
    private int userMessageRules=0;
    private int userFullFolder=-3;
    private int userEmailtime=0;
    private int userTopicShowDays=0;
    private String userTopicSortbyType="t";
    private String userTopicSortbyDir="d";
    private int userPostShowDays=0;
    private String userPostSortbyType="t";
    private String userPostSortbyDir="a";
    private boolean userNotify=false;
    private boolean userNotifyPm=true;
    private int userNotifyType=0;
    private boolean userAllowPm=true;
    private boolean userAllowViewonline=true;
    private int userAllowViewemail=1;
    private boolean userAllowMassemail=true;
    private int userOptions=230271;
    private String userAvatar="";
    private int userAvatarType=0;
    private int userAvatarWidth=0;
    private int userAvatarHeight=0;
    private String userSig="";
    private String userSigBbcodeUid="";
    private String userSigBbcodeBitfield="";
    private String userFrom="";
    private String userIcq="";
    private String userAim="";
    private String userYim="";
    private String userMsnm="";
    private String userJabber="";
    private String userWebsite="";
    private String userOcc="";
    private String userInterests="";
    private String userActkey="";
    private String userNewpasswd="";
    private String userFormSalt="";
    private boolean userNew=true;
    private int userReminded=0;
    private int userRemindedTime=0;
    
    

    public phpbb_user(String username, String password, String email,
            long userRegdate) {
        
        this.username = username;
        this.usernameClean=username.toLowerCase();
        this.password = password;
        this.email = email;
        this.userRegdate = userRegdate;
    }



    public int getUserId() {
        return userId;
    }



    public void setUserId(int userId) {
        this.userId = userId;
    }



    public int getUserType() {
        return userType;
    }



    public void setUserType(int userType) {
        this.userType = userType;
    }



    public int getGroupId() {
        return groupId;
    }



    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }



    public String getUserPermissions() {
        return userPermissions;
    }



    public void setUserPermissions(String userPermissions) {
        this.userPermissions = userPermissions;
    }



    public int getUserPermFrom() {
        return userPermFrom;
    }



    public void setUserPermFrom(int userPermFrom) {
        this.userPermFrom = userPermFrom;
    }



    public String getUserIp() {
        return userIp;
    }



    public void setUserIp(String userIp) {
        this.userIp = userIp;
    }



    public long getUserRegdate() {
        return userRegdate;
    }



    public void setUserRegdate(long userRegdate) {
        this.userRegdate = userRegdate;
    }



    public String getUsername() {
        return username;
    }



    public void setUsername(String username) {
        this.username = username;
    }



    public String getUsernameClean() {
        return usernameClean;
    }



    public void setUsernameClean(String usernameClean) {
        this.usernameClean = usernameClean;
    }



    public String getPassword() {
        return password;
    }



    public void setPassword(String password) {
        this.password = password;
    }



    public int getUserPasschg() {
        return userPasschg;
    }



    public void setUserPasschg(int userPasschg) {
        this.userPasschg = userPasschg;
    }



    public int getUserPassConvert() {
        return userPassConvert;
    }



    public void setUserPassConvert(int userPassConvert) {
        this.userPassConvert = userPassConvert;
    }



    public String getEmail() {
        return email;
    }



    public void setEmail(String email) {
        this.email = email;
    }



    public long getUserEmailHash() {
        return userEmailHash;
    }



    public void setUserEmailHash(long userEmailHash) {
        this.userEmailHash = userEmailHash;
    }



    public String getUserBirthday() {
        return userBirthday;
    }



    public void setUserBirthday(String userBirthday) {
        this.userBirthday = userBirthday;
    }



    public int getUserLastvisit() {
        return userLastvisit;
    }



    public void setUserLastvisit(int userLastvisit) {
        this.userLastvisit = userLastvisit;
    }



    public int getUserLastmark() {
        return userLastmark;
    }



    public void setUserLastmark(int userLastmark) {
        this.userLastmark = userLastmark;
    }



    public int getUserLastpostTime() {
        return userLastpostTime;
    }



    public void setUserLastpostTime(int userLastpostTime) {
        this.userLastpostTime = userLastpostTime;
    }



    public String getUserLastpage() {
        return userLastpage;
    }



    public void setUserLastpage(String userLastpage) {
        this.userLastpage = userLastpage;
    }



    public String getUserLastConfirmKey() {
        return userLastConfirmKey;
    }



    public void setUserLastConfirmKey(String userLastConfirmKey) {
        this.userLastConfirmKey = userLastConfirmKey;
    }



    public int getUserLastSearch() {
        return userLastSearch;
    }



    public void setUserLastSearch(int userLastSearch) {
        this.userLastSearch = userLastSearch;
    }



    public int getUserWarnings() {
        return userWarnings;
    }



    public void setUserWarnings(int userWarnings) {
        this.userWarnings = userWarnings;
    }



    public int getUserLastWarning() {
        return userLastWarning;
    }



    public void setUserLastWarning(int userLastWarning) {
        this.userLastWarning = userLastWarning;
    }



    public int getUserLoginAttempts() {
        return userLoginAttempts;
    }



    public void setUserLoginAttempts(int userLoginAttempts) {
        this.userLoginAttempts = userLoginAttempts;
    }



    public int getUserInactiveReason() {
        return userInactiveReason;
    }



    public void setUserInactiveReason(int userInactiveReason) {
        this.userInactiveReason = userInactiveReason;
    }



    public int getUserInactiveTime() {
        return userInactiveTime;
    }



    public void setUserInactiveTime(int userInactiveTime) {
        this.userInactiveTime = userInactiveTime;
    }



    public int getUserPosts() {
        return userPosts;
    }



    public void setUserPosts(int userPosts) {
        this.userPosts = userPosts;
    }



    public String getUserLang() {
        return userLang;
    }



    public void setUserLang(String userLang) {
        this.userLang = userLang;
    }



    public float getUserTimezone() {
        return userTimezone;
    }



    public void setUserTimezone(float userTimezone) {
        this.userTimezone = userTimezone;
    }



    public boolean isUserDst() {
        return userDst;
    }



    public void setUserDst(boolean userDst) {
        this.userDst = userDst;
    }



    public String getUserDateFormat() {
        return userDateFormat;
    }



    public void setUserDateFormat(String userDateFormat) {
        this.userDateFormat = userDateFormat;
    }



    public int getUserStyle() {
        return userStyle;
    }



    public void setUserStyle(int userStyle) {
        this.userStyle = userStyle;
    }



    public int getUserRank() {
        return userRank;
    }



    public void setUserRank(int userRank) {
        this.userRank = userRank;
    }



    public String getUserColour() {
        return userColour;
    }



    public void setUserColour(String userColour) {
        this.userColour = userColour;
    }



    public int getUserNewPrivmsg() {
        return userNewPrivmsg;
    }



    public void setUserNewPrivmsg(int userNewPrivmsg) {
        this.userNewPrivmsg = userNewPrivmsg;
    }



    public int getUserUnreadPrivmsg() {
        return userUnreadPrivmsg;
    }



    public void setUserUnreadPrivmsg(int userUnreadPrivmsg) {
        this.userUnreadPrivmsg = userUnreadPrivmsg;
    }



    public int getUserLastPrivMsg() {
        return userLastPrivMsg;
    }



    public void setUserLastPrivMsg(int userLastPrivMsg) {
        this.userLastPrivMsg = userLastPrivMsg;
    }



    public int getUserMessageRules() {
        return userMessageRules;
    }



    public void setUserMessageRules(int userMessageRules) {
        this.userMessageRules = userMessageRules;
    }



    public int getUserFullFolder() {
        return userFullFolder;
    }



    public void setUserFullFolder(int userFullFolder) {
        this.userFullFolder = userFullFolder;
    }



    public int getUserEmailtime() {
        return userEmailtime;
    }



    public void setUserEmailtime(int userEmailtime) {
        this.userEmailtime = userEmailtime;
    }



    public int getUserTopicShowDays() {
        return userTopicShowDays;
    }



    public void setUserTopicShowDays(int userTopicShowDays) {
        this.userTopicShowDays = userTopicShowDays;
    }



    public String getUserTopicSortbyType() {
        return userTopicSortbyType;
    }



    public void setUserTopicSortbyType(String userTopicSortbyType) {
        this.userTopicSortbyType = userTopicSortbyType;
    }



    public String getUserTopicSortbyDir() {
        return userTopicSortbyDir;
    }



    public void setUserTopicSortbyDir(String userTopicSortbyDir) {
        this.userTopicSortbyDir = userTopicSortbyDir;
    }



    public int getUserPostShowDays() {
        return userPostShowDays;
    }



    public void setUserPostShowDays(int userPostShowDays) {
        this.userPostShowDays = userPostShowDays;
    }



    public String getUserPostSortbyType() {
        return userPostSortbyType;
    }



    public void setUserPostSortbyType(String userPostSortbyType) {
        this.userPostSortbyType = userPostSortbyType;
    }



    public String getUserPostSortbyDir() {
        return userPostSortbyDir;
    }



    public void setUserPostSortbyDir(String userPostSortbyDir) {
        this.userPostSortbyDir = userPostSortbyDir;
    }



    public boolean isUserNotify() {
        return userNotify;
    }



    public void setUserNotify(boolean userNotify) {
        this.userNotify = userNotify;
    }



    public boolean isUserNotifyPm() {
        return userNotifyPm;
    }



    public void setUserNotifyPm(boolean userNotifyPm) {
        this.userNotifyPm = userNotifyPm;
    }



    public int getUserNotifyType() {
        return userNotifyType;
    }



    public void setUserNotifyType(int userNotifyType) {
        this.userNotifyType = userNotifyType;
    }



    public boolean isUserAllowPm() {
        return userAllowPm;
    }



    public void setUserAllowPm(boolean userAllowPm) {
        this.userAllowPm = userAllowPm;
    }



    public boolean isUserAllowViewonline() {
        return userAllowViewonline;
    }



    public void setUserAllowViewonline(boolean userAllowViewonline) {
        this.userAllowViewonline = userAllowViewonline;
    }



    public int getUserAllowViewemail() {
        return userAllowViewemail;
    }



    public void setUserAllowViewemail(int userAllowViewemail) {
        this.userAllowViewemail = userAllowViewemail;
    }



    public boolean isUserAllowMassemail() {
        return userAllowMassemail;
    }



    public void setUserAllowMassemail(boolean userAllowMassemail) {
        this.userAllowMassemail = userAllowMassemail;
    }



    public int getUserOptions() {
        return userOptions;
    }



    public void setUserOptions(int userOptions) {
        this.userOptions = userOptions;
    }



    public String getUserAvatar() {
        return userAvatar;
    }



    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }



    public int getUserAvatarType() {
        return userAvatarType;
    }



    public void setUserAvatarType(int userAvatarType) {
        this.userAvatarType = userAvatarType;
    }



    public int getUserAvatarWidth() {
        return userAvatarWidth;
    }



    public void setUserAvatarWidth(int userAvatarWidth) {
        this.userAvatarWidth = userAvatarWidth;
    }



    public int getUserAvatarHeight() {
        return userAvatarHeight;
    }



    public void setUserAvatarHeight(int userAvatarHeight) {
        this.userAvatarHeight = userAvatarHeight;
    }



    public String getUserSig() {
        return userSig;
    }



    public void setUserSig(String userSig) {
        this.userSig = userSig;
    }



    public String getUserSigBbcodeUid() {
        return userSigBbcodeUid;
    }



    public void setUserSigBbcodeUid(String userSigBbcodeUid) {
        this.userSigBbcodeUid = userSigBbcodeUid;
    }



    public String getUserSigBbcodeBitfield() {
        return userSigBbcodeBitfield;
    }



    public void setUserSigBbcodeBitfield(String userSigBbcodeBitfield) {
        this.userSigBbcodeBitfield = userSigBbcodeBitfield;
    }



    public String getUserFrom() {
        return userFrom;
    }



    public void setUserFrom(String userFrom) {
        this.userFrom = userFrom;
    }



    public String getUserIcq() {
        return userIcq;
    }



    public void setUserIcq(String userIcq) {
        this.userIcq = userIcq;
    }



    public String getUserAim() {
        return userAim;
    }



    public void setUserAim(String userAim) {
        this.userAim = userAim;
    }



    public String getUserYim() {
        return userYim;
    }



    public void setUserYim(String userYim) {
        this.userYim = userYim;
    }



    public String getUserMsnm() {
        return userMsnm;
    }



    public void setUserMsnm(String userMsnm) {
        this.userMsnm = userMsnm;
    }



    public String getUserJabber() {
        return userJabber;
    }



    public void setUserJabber(String userJabber) {
        this.userJabber = userJabber;
    }



    public String getUserWebsite() {
        return userWebsite;
    }



    public void setUserWebsite(String userWebsite) {
        this.userWebsite = userWebsite;
    }



    public String getUserOcc() {
        return userOcc;
    }



    public void setUserOcc(String userOcc) {
        this.userOcc = userOcc;
    }



    public String getUserInterests() {
        return userInterests;
    }



    public void setUserInterests(String userInterests) {
        this.userInterests = userInterests;
    }



    public String getUserActkey() {
        return userActkey;
    }



    public void setUserActkey(String userActkey) {
        this.userActkey = userActkey;
    }



    public String getUserNewpasswd() {
        return userNewpasswd;
    }



    public void setUserNewpasswd(String userNewpasswd) {
        this.userNewpasswd = userNewpasswd;
    }



    public String getUserFormSalt() {
        return userFormSalt;
    }



    public void setUserFormSalt(String userFormSalt) {
        this.userFormSalt = userFormSalt;
    }



    public boolean isUserNew() {
        return userNew;
    }



    public void setUserNew(boolean userNew) {
        this.userNew = userNew;
    }



    public int getUserReminded() {
        return userReminded;
    }



    public void setUserReminded(int userReminded) {
        this.userReminded = userReminded;
    }



    public int getUserRemindedTime() {
        return userRemindedTime;
    }



    public void setUserRemindedTime(int userRemindedTime) {
        this.userRemindedTime = userRemindedTime;
    }
    
    
    
    
    /**
     * 
     */
    
    //Logger
    /*
     * private static final java.util.Logger LOG
     *         = Logger.getLogger(phpbb_user.class.getName());
     */
    
    //Variabili di istanza
    
    
    //Costruttori
    
    
    //Metodi
}
