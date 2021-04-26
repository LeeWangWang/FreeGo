package dao;

import domain.UserInfo;
import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:28
 * @Description:
 */
public interface UserInfoDao {

    Boolean isUserCellnumberExist(String userTele);

    UserInfo saveUserInfo(UserInfo userInfo);

    UserInfo isAccountRight(String account, String password);

    Boolean isUserFollowed(int userId, int travelNoteId);

    Boolean updateUserFollowByTravelNoteId(int userId, int travelNoteId);

    Boolean updateUserPrefer(int userId, int tagId, float preferWeight);

    Boolean updateUserPreferByTravelNote(int userId, int travelNoteId, float preferWeight);

    Boolean updateUserPreferByHotel(int userId, int hotelId, float preferWeight);

    Boolean updateUserPreferByScenic(int userId, int scenicId, float preferWeight);

    Boolean updateUserInfo(UserInfo userInfo);

    List<UserInfo> queryConcernInfo(int userId);

    List<UserInfo> queryFollowInfo(int userId);

}
