package service;

import domain.UserInfo;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:28
 * @Description:
 */
public interface UserInfoService {

    /**
    * @author:  李旺旺
    * @date:    2021/5/1 12:01
    * @param:   [userInfo]
    * @return:  domain.UserInfo
    * @exception:
    * @description: 用户注册，不存在返回true，存在返回false
    */
    UserInfo register(UserInfo userInfo);

    /**
    * @author:  李旺旺
    * @date:    2021/5/1 12:00
    * @param:   [account, password]
    * @return:  domain.UserInfo
    * @exception:
    * @description: 用户登录，登陆成功返回UserInfo实例对象，失败返回null
    */
    UserInfo login(String account, String password);
}
