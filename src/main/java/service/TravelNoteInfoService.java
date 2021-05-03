package service;

import domain.TravelNoteInfo;

import java.util.List;

public interface TravelNoteInfoService {

    /**
    * @author:  李旺旺
    * @date:    2021/5/1 12:02
    * @param:   [userId]
    * @return:  java.util.List<domain.TravelNoteInfo>
    * @exception:
     * @Description: 系统根据用户编号userId查询用户偏好表（UserPreferList）和用户关注表（UserConcernList）,获取到用户偏好信息和用户关注信息,
     *               通过用户偏好信息和用户关注信息查询标签关联表（TagLinkList）、游记信息表（TravelNoteList）、游记图片关系表(TravelNotePictureList),
     *               查询成功返回游记信息实例集合List<TravelNoteInfo>,若查询失败，返回 null。
    */
    List<TravelNoteInfo> recommendTravelNoteInfoNote(String userId);

    /**
    * @author:  李旺旺
    * @date:    2021/5/1 12:02
    * @param:   []
    * @return:  java.util.List<java.lang.String>
    * @exception:
    * @description: 获取所有地址信息
    */
    List<String> getLocate();

    /**
    * @author:  李旺旺
    * @date:    2021/5/1 15:11
    * @param:   [travelNote]
    * @return:  java.lang.Boolean
    * @exception:
    * @description: 保存游记信息
    */
    TravelNoteInfo addTravelNote(TravelNoteInfo travelNote);

    /**
    * @author:  李旺旺
    * @date:    2021/5/1 16:55
    * @param:   [locateName]
    * @return:  int
    * @exception:
    * @description: 根据位置名称查询位置编号
    */
    int checkLocate(String locateName);

    /**
    * @author:  李旺旺
    * @date:    2021/5/2 20:11
    * @param:   [noteId]
    * @return:  domain.TravelNoteInfo
    * @exception:
    * @description: 根据游记Id查询游记信息
    */
    TravelNoteInfo queryTravelNoteInfoById(int noteId);

    /**
    * @author:  李旺旺
    * @date:    2021/5/2 20:11
    * @param:   [locateId]
    * @return:  java.lang.String
    * @exception:
    * @description: 根据位置编号查询位置名称
    */
    String matchLocate(int locateId);

    /**
     * @author:  李旺旺
     * @date:    2021/5/2 20:11
     * @param:   [locateId]
     * @return:  java.lang.String
     * @exception:
     * @description: 根据人物编号查询人物名称
     */
    String matchPeople(int peopleId);

    /**
    * @author:  李旺旺
    * @date:    2021/5/3 15:01
    * @param:   [userId, noteId]
    * @return:  java.lang.Boolean
    * @exception:
    * @description: 判断是否关注
    */
    Boolean isUserFollowedByTravelNoteId(int userId, int noteId);

    /**
     * @author:  李旺旺
     * @date:    2021/5/3 13:33
     * @param:   [userId, noteId]
     * @return:  java.lang.Boolean
     * @exception:
     * @description: 判断是否收藏
     */
    Boolean isTravelNoteCollect(int userId, int noteId);

    /**
    * @author:  李旺旺
    * @date:    2021/5/3 13:33
    * @param:   [userId, noteId]
    * @return:  java.lang.Boolean
    * @exception:
    * @description: 判断是否点赞
    */
    Boolean isTravelNoteLike(int userId, int noteId);

    /**
    * @author:  李旺旺
    * @date:    2021/5/3 15:14
    * @param:   [userId, noteId]
    * @return:  int
    * @exception:
    * @description: 获取游记收藏量
    */
    int queryTravelNoteCollectionNum(int noteId);

    /**
    * @author:  李旺旺
    * @date:    2021/5/3 15:14
    * @param:   [userId, noteId]
    * @return:  int
    * @exception:
    * @description: 查询游记点赞数量
    */
    int queryTravelNoteLikeNum(int noteId);

    /**
     * @author:  李旺旺
     * @date:    2021/5/3 16:48
     * @param:   [userId, noteId]
     * @return:  java.lang.Boolean
     * @exception:
     * @description: 更新关注信息
     */
    Boolean updateUserFollowByTravelNoteId(int userId, int noteId);

    /**
    * @author:  李旺旺
    * @date:    2021/5/3 16:02
    * @param:   [userId, noteId]
    * @return:  java.lang.Boolean
    * @exception:
    * @description: 更新收藏信息
    */
    Boolean updateTravelNoteCollect(int userId, int noteId);

    /**
    * @author:  李旺旺
    * @date:    2021/5/3 16:03
    * @param:   [userId, noteId]
    * @return:  java.lang.Boolean
    * @exception:
    * @description: 更新点赞信息
    */
    Boolean updateTravelNoteLike(int userId, int noteId);

    /**
    * @author:  李旺旺
    * @date:    2021/5/3 19:47
    * @param:   [noteId]
    * @return:  java.lang.Boolean
    * @exception:
    * @description: 更新浏览量
    */
    Boolean updateTravelNoteView(int noteId);
}
