package service;

import domain.UserInfo;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:28
 * @Description:
 */
public interface UserInfoService {

    /**
     * 用户注册，不存在返回true，存在返回false
     */
    UserInfo register(UserInfo userInfo);

    /**
     * 用户登录，登陆成功返回UserInfo实例对象，失败返回null
     */
    UserInfo login(String account, String password);

    /**
     * 根据游记Id查询用户信息
     */
    UserInfo queryUserInfoByTravelNoteId(int noteId);
}
