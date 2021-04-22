package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 20:17
 * @Description: 管理员信息实体类
 */
public class AdministratorInfo {

    private String account;     //管理员账号
    private String password;    //管理员密码

    public AdministratorInfo() {}

    public AdministratorInfo(String account, String password) {
        this.account = account;
        this.password = password;
    }

    @Override
    public String toString() {
        return "管理员信息实体类{" +
                "管理员账号='" + account + '\'' +
                ", 管理员密码='" + password + '\'' +
                '}';
    }
}
