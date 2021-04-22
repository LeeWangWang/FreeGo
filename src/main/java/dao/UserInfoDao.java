package dao;

import domain.UserInfo;
import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:28
 * @Description:
 */
public interface UserInfoDao {
    /**
    * @Author:  李旺旺
    * @Date:    2021/3/31 19:04
    * @param:   [userTele]
    * @Description: 系统根据手机号（userTele）在用户信息表（UserList）中进行查询，若不存在该手机号（userTele）返回true，若存在返回false。
    */
    Boolean isUserCellnumberExist(String userTele);

    /**
    * @Author:  李旺旺
    * @Date:    2021/3/31 19:06
    * @param:   [userTele, nickName, Password]
    * @Description: 系统将用户手机号userTele、昵称nickname、密码password存到用户信息表（UserList），如果存储失败返回false，如果存储成功，返回true。
    */
    UserInfo saveUserInfo(UserInfo userInfo);
    
    /**
    * @Author:  李旺旺
    * @Date:    2021/3/31 19:19
    * @param:   [account, password]
    * @Description: 系统根据账号（手机号/邮箱）和密码password匹配用户信息表（userList），若匹配成功返回true,若匹配不成功，返回 false。
    */
    UserInfo isAccountRight(String account, String password);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 15:18
    * @param:   [userId, travelNoteId]
    * @Description: 系统根据游记编号travelNoteId查询游记信息表(TravelNoteList)获取到关注用户编号userId，根据自己的用户编号userId和关注用户编号userId
    *               查询用户关注表（UserConcernList），若查询到结果返回true,若查询不到，返回 false。
    */
    Boolean isUserFollowed(int userId, int travelNoteId);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 15:19
    * @param:   [userId, travelNoteId]
    * @Description: 系统根据游记编号travelNoteId查询游记信息表(TravelNoteList)，将查询到的关注用户编号userId和自己的用户编号userId更新用户关注表（UserConcernList），
    *               若更新成功返回true,若更新失败，返回 false。
    */
    Boolean updateUserFollowByTravelNoteId(int userId, int travelNoteId);

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 15:33
     * @param:   [userId, tagId, preferWeight]
     * @Description: 根据用户id、标签d和偏好权重写入偏好信息表（UserPerfer），若写入成功返回true，若返回失败返回false。
     */
    Boolean updateUserPrefer(int userId, int tagId, float preferWeight);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 15:43
    * @param:   [userId, travelNoteId, preferWeight]
    * @Description: 系统根据游记编号travleNoteId查询标签关联表（TagLinkList）得到标签编号tagId，再根据用户编号userId、标签编号tagId和偏好权重preferWeight
    *               更新用户偏好表（UserPreferList），更新成功返回true,若更新失败，返回false。
    */
    Boolean updateUserPreferByTravelNote(int userId, int travelNoteId, float preferWeight);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 15:35
    * @param:   [userId, hotelId, preferWeight]
    * @Description: 系统根据游记编号hotelId查询标签关联表（TagLinkList）得到标签编号tagId，再根据用户编号userId、标签编号tagId和偏好权重preferWeight
    *               更新用户偏好表（UserPreferList），更新成功返回true,若更新失败，返回false。
    */
    Boolean updateUserPreferByHotel(int userId, int hotelId, float preferWeight);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 15:54
    * @param:   [userId, scenicId, preferWeight]
    * @Description: 系统根据游记编号scenicId查询标签关联表（TagLinkList）得到标签编号tagId，再根据用户编号userId、标签编号tagId和偏好权重preferWeight
    *               更新用户偏好表（UserPreferList），更新成功返回true,若更新失败，返回false。
    */
    Boolean updateUserPreferByScenic(int userId, int scenicId, float preferWeight);

    /**
    * @Author:  李旺旺
    * @Date:    2021/3/31 19:35
    * @param:   [userInfo]
    * @Description: 系统根据用户id，在用户信息表（UserInfoInterface）中更新相对应的用户信息，若更新成功，返回true，若更新失败，返回false。
    */
    Boolean updateUserInfo(UserInfo userInfo);

    /**
    * @Author:  李旺旺
    * @Date:    2021/3/31 19:42
    * @param:   [userId]
    * @Description: 系统根据用户编号userId查询用户关注表（UserConcernList），查询该用户的关注的用户，查询成功返回用户信息实例集合List<UserInfo>,若查询失败，返回 null。
    */
    List<UserInfo> queryConcernInfo(int userId);

    /**
    * @Author:  李旺旺
    * @Date:    2021/3/31 19:43
    * @param:   [userId]
    * @Description: 系统根据用户编号userId查询用户关注表（UserConcernList），查询该用户的粉丝，查询成功返回List<UserInfo>,若查询失败，返回 null。
    */
    List<UserInfo> queryFollowInfo(int userId);

}
