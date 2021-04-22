package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/29 20:50
 * @Description: 用户信息实体类
 */
public class UserInfo {
    private int userId;                     //用户id
    private String userTele;                //电话
    private String userEmail;               //邮箱
    private String userNickName;            //昵称
    private String userPassword;            //密码
    private String userSex;                 //性别
    private String userIntroduce;           //个人介绍
    private String userHeadPicturePath;     //头像
    private Boolean flag;                   //是否注销(1注销,0未注销)

    public UserInfo() {
    }

    public UserInfo(String userTele, String userNickName, String userPassword, String userSex, Boolean flag) {
        this.userTele = userTele;
        this.userNickName = userNickName;
        this.userPassword = userPassword;
        this.userSex = userSex;
        this.flag = flag;
    }

    public UserInfo(String userTele, String userEmail, String userNickName, String userPassword, String userSex,
                    String userIntroduce, String userHeadPicturePath, Boolean flag) {
        this.userTele = userTele;
        this.userEmail = userEmail;
        this.userNickName = userNickName;
        this.userPassword = userPassword;
        this.userSex = userSex;
        this.userIntroduce = userIntroduce;
        this.userHeadPicturePath = userHeadPicturePath;
        this.flag = flag;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserTele() {
        return userTele;
    }

    public void setUserTele(String userTele) {
        this.userTele = userTele;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getUserIntroduce() {
        return userIntroduce;
    }

    public void setUserIntroduce(String userIntroduce) {
        this.userIntroduce = userIntroduce;
    }

    public String getUserHeadPicturePath() {
        return userHeadPicturePath;
    }

    public void setUserHeadPicturePath(String userHeadPicturePath) {
        this.userHeadPicturePath = userHeadPicturePath;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "用户信息{" +
                "用户id=" + userId +
                ", 电话='" + userTele + '\'' +
                ", 邮箱='" + userEmail + '\'' +
                ", 昵称='" + userNickName + '\'' +
                ", 密码='" + userPassword + '\'' +
                ", 性别='" + userSex + '\'' +
                ", 个人介绍='" + userIntroduce + '\'' +
                ", 头像='" + userHeadPicturePath + '\'' +
                ", 是否注销=" + flag +
                '}';
    }
}