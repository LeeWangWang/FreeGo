package service.impl;

import dao.UserInfoDao;
import dao.impl.UserInfoDaoInfoImpl;
import domain.UserInfo;
import service.UserInfoService;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:28
 * @Description: 处理用户信息
 */
public class UserInfoServiceImpl implements UserInfoService {

    private UserInfoDao userDao = new UserInfoDaoInfoImpl();

    @Override
    public UserInfo register(UserInfo userInfo) {
        boolean teleFlag = userDao.isUserCellnumberExist(userInfo.getUserTele());
        if (!teleFlag) {
            System.out.println("手机号已存在");
            return null;
        }
        UserInfo user = userDao.saveUserInfo(userInfo);
        if (user != null) {
            return user;
        }
        System.out.println("保存用户信息失败");
        return null;
    }

    @Override
    public UserInfo login(String account, String password) {
        return  userDao.isAccountRight(account, password);
    }

    @Override
    public UserInfo queryUserInfoByTravelNoteId(int noteId) {
        return userDao.queryUserInfoByTravelNoteId(noteId);
    }

    @Override
    public List<UserInfo> queryConcernInfo(int userId) {
        return userDao.queryConcernInfo(userId);
    }

    @Override
    public List<UserInfo> queryFollowInfo(int userId) {
        return userDao.queryFollowInfo(userId);
    }

    @Override
    public int countFollowNum(int userId) {
        return userDao.countFollowNum(userId);
    }
}
