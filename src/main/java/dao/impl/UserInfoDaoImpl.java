package dao.impl;

import dao.UserInfoDao;
import domain.UserInfo;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/5 16:12
 * @Description: 用户信息
 */
public class UserInfoDaoImpl implements UserInfoDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    /**
     * 检查手机号是否已经存在，不存在返回true，存在返回false
     */
    @Override
    public Boolean isUserCellnumberExist(String userTele) {
        String sql = null;
        UserInfo user = null;
        try {
            //1.定义sql语句
            sql = "select * from user where userTele = ?";
            //2.执行
            user = template.queryForObject(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), userTele);
        } catch (Exception e){
            System.out.println("根据用户手机号查询用户信息失败");
        }
        if (user != null){
            //根据手机号查询到用户
            return false;
        }
        return true;
    }

    /**
     * 将用户手机号、昵称、密码存到用户信息表，如果存储失败返回false，如果存储成功，返回true。
     */
    @Override
    public UserInfo saveUserInfo(UserInfo userInfo) {
        //1.定义sql语句
        String sql1 = "insert into user (userTele,userEmail,userNickName,userPassword,userSex,userIntroduce,userHeadPicturePath,flag) values(?,?,?,?,?,?,?,?)";
        //2.执行
        int result = template.update(sql1,
                userInfo.getUserTele(),
                userInfo.getUserEmail(),
                userInfo.getUserNickName(),
                userInfo.getUserPassword(),
                userInfo.getUserSex(),
                userInfo.getUserIntroduce(),
                userInfo.getUserHeadPicturePath(),
                userInfo.getFlag() );
        if (result == 1){
            UserInfo user = null;
            String sql2 = "select * from user where userTele = ?";
            user = template.queryForObject(sql2, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), userInfo.getUserTele());
            return user;
        }
        return null;
    }

    /**
     * 检查用户登录的账号、密码是否正确
     */
    @Override
    public UserInfo isAccountRight(String account, String password) {
        String sql = null;
        UserInfo userInfo = null;
        try {
            if (account.equals("@")){
                sql = "select * from user where userEmail = ? and userPassword = ?";
                userInfo = template.queryForObject(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), account, password);
            } else {
                sql = "select * from user where userTele = ? and userPassword = ?";
                userInfo = template.queryForObject(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), account, password);
            }
        } catch (Exception e) {
            System.out.println("根据用户手机号/邮箱+密码查询用户信息失败");
        }
        if (userInfo != null) {
            return userInfo;
        }
        return null;
    }

    /**
     * 通过游记编号来判断是否关注了该用户
     */
    @Override
    public Boolean isUserFollowed(int userId, int travelNoteId) {
        String sql;
        int result = 0;
        //1.定义sql语句
        sql = "select count(*) from userconcern where userId = ? and followId = (select userId from travelnotelist where travelNoteId = ?)";
        //2.执行
        result = template.queryForObject(sql, Integer.class, userId, travelNoteId);
        System.out.println(result);
        if (result != 0) {
            return true;
        }
        return false;
    }

    /**
     * 通过游记编号更新用户关注信息
     */
    @Override
    public Boolean updateUserFollowByTravelNoteId(int userId, int travelNoteId) {
        String sql = null;
        //1.定义sql语句
        sql = "insert into userconcern values(?, (select userId from travelnotelist where travelNoteId = ?))";
        //2.执行
        int result = template.update(sql, userId, travelNoteId);
        if (result != 0) {
            return true;
        }
        return false;
    }

    /**
     * 更新用户偏好
     */
    @Override
    public Boolean updateUserPrefer(int userId, int tagId, float preferWeight) {
        String sql = null;
        //1.定义sql语句
        sql = "update userprefer set preferWeight = ? WHERE userId = ? and tagId = ?;";
        //2.执行
        int result = template.update(sql, preferWeight, userId, tagId);
        if (result != 0) {
            return true;
        }
        return false;
    }

    /**
     * 根据游记更新用户偏好
     */
    @Override
    public Boolean updateUserPreferByTravelNote(int userId, int travelNoteId, float preferWeight) {
        //1.定义sql语句
        //2.执行
        return null;
    }

    /**
     * 根据酒店更新用户偏好
     */
    @Override
    public Boolean updateUserPreferByHotel(int userId, int hotelId, float preferWeight) {
        //1.定义sql语句
        //2.执行
        return null;
    }

    /**
     * 根据景点更新用户偏好
     */
    @Override
    public Boolean updateUserPreferByScenic(int userId, int scenicId, float preferWeight) {
        //1.定义sql语句
        //2.执行
        return null;
    }

    /**
     * 用户修改个人信息
     */
    @Override
    public Boolean updateUserInfo(UserInfo userInfo) {
        String sql = null;
        //1.定义sql语句
        sql = "update user set userTele = ?, userEmail = ?, userNickName = ?, userPassword = ?, userSex = ?, " +
                "userIntroduce = ?, userHeadPicturePath = ? where userId = ?";
        //2.执行
        int result = template.update(sql,
                userInfo.getUserTele(),
                userInfo.getUserEmail(),
                userInfo.getUserNickName(),
                userInfo.getUserPassword(),
                userInfo.getUserSex(),
                userInfo.getUserIntroduce(),
                userInfo.getUserHeadPicturePath(),
                userInfo.getUserId());
        if (result == 1) {
            return true;
        }
        return false;
    }

    /**
     * 查询用户关注信息
     */
    @Override
    public List<UserInfo> queryConcernInfo(int userId) {
        String sql = null;
        //1.定义sql语句
        sql = "select * from user where userId in (select userconcern.`followId` from userconcern where userId = ?)";
        //2.执行
        return  template.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), userId);
    }

    /**
     * 查询用户粉丝信息
     */
    @Override
    public List<UserInfo> queryFollowInfo(int userId) {
        String sql = null;
        //1.定义sql语句
        sql = "select * from user where userId in (select userconcern.`userId` from userconcern where followId = ?)";
        //2.执行
        return  template.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), userId);
    }
}
