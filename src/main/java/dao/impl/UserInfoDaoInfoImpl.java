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
public class UserInfoDaoInfoImpl implements UserInfoDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    /**
     * @Author:  李旺旺
     * @Date:    2021/3/31 19:04
     * @param:   [userTele]
     * @Description: 系统根据手机号（userTele）在用户信息表（UserList）中进行查询，若不存在该手机号（userTele）返回true，若存在返回false。
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
     * @Author:  李旺旺
     * @Date:    2021/3/31 19:06
     * @param:   [userTele, nickName, Password]
     * @Description: 系统将用户手机号userTele、昵称nickname、密码password存到用户信息表（UserList），如果存储失败返回false，如果存储成功，返回true。
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
     * @Author:  李旺旺
     * @Date:    2021/3/31 19:19
     * @param:   [account, password]
     * @Description: 系统根据账号（手机号/邮箱）和密码password匹配用户信息表（userList），若匹配成功返回true,若匹配不成功，返回 false。
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
     * @Author:  李旺旺
     * @Date:    2021/4/3 15:18
     * @param:   [userId, travelNoteId]
     * @Description: 系统根据游记编号travelNoteId查询游记信息表(TravelNoteList)获取到关注用户编号userId，根据自己的用户编号userId和关注用户编号userId
     *               查询用户关注表（UserConcernList），若查询到结果返回true,若查询不到，返回 false。
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
     * @Author:  李旺旺
     * @Date:    2021/4/3 15:19
     * @param:   [userId, travelNoteId]
     * @Description: 系统根据游记编号travelNoteId查询游记信息表(TravelNoteList)，将查询到的关注用户编号userId和自己的用户编号userId更新用户关注表（UserConcernList），
     *               若更新成功返回true,若更新失败，返回 false。
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
     * @Author:  李旺旺
     * @Date:    2021/4/3 15:33
     * @param:   [userId, tagId, preferWeight]
     * @Description: 根据用户id、标签d和偏好权重写入偏好信息表（UserPerfer），若写入成功返回true，若返回失败返回false。
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
     * @Author:  李旺旺
     * @Date:    2021/4/3 15:43
     * @param:   [userId, travelNoteId, preferWeight]
     * @Description: 系统根据游记编号travleNoteId查询标签关联表（TagLinkList）得到标签编号tagId，再根据用户编号userId、标签编号tagId和偏好权重preferWeight
     *               更新用户偏好表（UserPreferList），更新成功返回true,若更新失败，返回false。
     */
    @Override
    public Boolean updateUserPreferByTravelNote(int userId, int travelNoteId, float preferWeight) {
        //1.定义sql语句
        //2.执行
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 15:35
     * @param:   [userId, hotelId, preferWeight]
     * @Description: 系统根据游记编号hotelId查询标签关联表（TagLinkList）得到标签编号tagId，再根据用户编号userId、标签编号tagId和偏好权重preferWeight
     *               更新用户偏好表（UserPreferList），更新成功返回true,若更新失败，返回false。
     */
    @Override
    public Boolean updateUserPreferByHotel(int userId, int hotelId, float preferWeight) {
        //1.定义sql语句
        //2.执行
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 15:54
     * @param:   [userId, scenicId, preferWeight]
     * @Description: 系统根据游记编号scenicId查询标签关联表（TagLinkList）得到标签编号tagId，再根据用户编号userId、标签编号tagId和偏好权重preferWeight
     *               更新用户偏好表（UserPreferList），更新成功返回true,若更新失败，返回false。
     */
    @Override
    public Boolean updateUserPreferByScenic(int userId, int scenicId, float preferWeight) {
        //1.定义sql语句
        //2.执行
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/3/31 19:35
     * @param:   [userInfo]
     * @Description: 系统根据用户id，在用户信息表（UserInfoInterface）中更新相对应的用户信息，若更新成功，返回true，若更新失败，返回false。
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
     * @Author:  李旺旺
     * @Date:    2021/3/31 19:42
     * @param:   [userId]
     * @Description: 系统根据用户编号userId查询用户关注表（UserConcernList），查询该用户的关注的用户，查询成功返回用户信息实例集合List<UserInfo>,若查询失败，返回 null。
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
     * @Author:  李旺旺
     * @Date:    2021/3/31 19:43
     * @param:   [userId]
     * @Description: 系统根据用户编号userId查询用户关注表（UserConcernList），查询该用户的粉丝，查询成功返回List<UserInfo>,若查询失败，返回 null。
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
