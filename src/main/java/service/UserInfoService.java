package service;

import domain.UserInfo;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:28
 * @Description:
 */
public interface UserInfoService {

    UserInfo register(UserInfo userInfo);

    UserInfo login(String account, String password);
}
