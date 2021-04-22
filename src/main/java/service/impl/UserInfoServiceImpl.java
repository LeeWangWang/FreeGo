package service.impl;

import com.sun.org.apache.xpath.internal.operations.Bool;
import dao.UserInfoDao;
import dao.impl.UserInfoDaoImpl;
import domain.UserInfo;
import service.UserInfoService;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:28
 * @Description: 处理用户信息
 */
public class UserInfoServiceImpl implements UserInfoService {

    private UserInfoDao userDao = new UserInfoDaoImpl();

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/18 16:01
    * @param:   [userInfo]
    * @Return:  boolean
    * @Description: 用户注册，不存在返回true，存在返回false
    */
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
}
