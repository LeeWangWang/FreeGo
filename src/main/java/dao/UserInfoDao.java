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
     * 根据手机号（userTele）在用户信息表（UserList）中进行查询，若不存在该手机号（userTele）返回true，若存在返回false。
     */
    Boolean isUserCellnumberExist(String userTele);

    /**
     * 将用户手机号userTele、昵称nickname、密码password存到用户信息表（UserList），如果存储失败返回false，如果存储成功，返回true。
     */
    UserInfo saveUserInfo(UserInfo userInfo);

    /**
     * 根据账号（手机号/邮箱）和密码password匹配用户信息表（userList），若匹配成功返回true,若匹配不成功，返回 false。
     */
    UserInfo isAccountRight(String account, String password);

    /**
     * 根据游记编号travelNoteId查询游记信息表获取到关注用户编号userId，根据自己的用户编号userId和关注用户编号userId查询用户关注表，若查询到结果返回true,若查询不到，返回 false。
     */
    Boolean isUserFollowed(int userId, int travelNoteId);

    /**
     * 根据游记编号travelNoteId查询游记信息表，将查询到的关注用户编号userId和自己的用户编号userId更新用户关注表，若更新成功返回true,若更新失败，返回 false。
     */
    Boolean updateUserFollowByTravelNoteId(int userId, int travelNoteId);

    /**
     * 根据用户id、标签d和偏好权重写入偏好信息表（UserPerfer），若写入成功返回true，若返回失败返回false。
     */
    Boolean updateUserPrefer(int userId, int tagId, float preferWeight);

    /**
     * 根据游记编号travleNoteId查询标签关联表得到标签编号tagId，再根据用户编号userId、标签编号tagId和偏好权重preferWeight更新用户偏好表，更新成功返回true,若更新失败，返回false。
     */
    Boolean updateUserPreferByTravelNote(int userId, int travelNoteId, float preferWeight);

    /**
     * 根据游记编号hotelId查询标签关联表得到标签编号tagId，再根据用户编号userId、标签编号tagId和偏好权重preferWeight更新用户偏好表，更新成功返回true,若更新失败，返回false。
     */
    Boolean updateUserPreferByHotel(int userId, int hotelId, float preferWeight);

    /**
     * 根据游记编号scenicId查询标签关联表得到标签编号tagId，再根据用户编号userId、标签编号tagId和偏好权重preferWeight更新用户偏好表，更新成功返回true,若更新失败，返回false。
     */
    Boolean updateUserPreferByScenic(int userId, int scenicId, float preferWeight);

    /**
     * 系统根据用户id，在用户信息表（UserInfoInterface）中更新相对应的用户信息，若更新成功，返回true，若更新失败，返回false。
     */
    Boolean updateUserInfo(UserInfo userInfo);

    /**
     * 系统根据用户编号userId查询用户关注表，查询该用户的关注的用户，查询成功返回用户信息实例集合List<UserInfo>,若查询失败，返回 null。
     */
    List<UserInfo> queryConcernInfo(int userId);

    /**
     * 系统根据用户编号userId查询用户关注表，查询该用户的粉丝，查询成功返回List<UserInfo>,若查询失败，返回 null。
     */
    List<UserInfo> queryFollowInfo(int userId);

    /**
     * 根据游记Id查询用户信息
     */
    UserInfo queryUserInfoByTravelNoteId(int noteId);

}
