package service;

import domain.UserInfo;

import java.util.List;

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

    /**
     * 查询用户关注信息
     */
    List<UserInfo> queryConcernInfo(int userId);

    /**
     * 查询用户粉丝信息
     */
    List<UserInfo> queryFollowInfo(int userId);

    /**
     * 查询用户粉丝数量
     */
    int countFollowNum(int userId);
}
