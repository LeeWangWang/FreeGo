package service;

import domain.UserInfo;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:28
 * @Description:
 */
public interface UserInfoService {
    /**
     * 用户注册
     */
    UserInfo register(UserInfo userInfo);

    /**
     * 用户登录
     */
    UserInfo login(String account, String password);
}
