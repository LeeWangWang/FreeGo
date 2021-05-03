package dao;

import domain.*;

import java.util.List;

public interface TravelNoteInfoDao {

    /**
     * @Author:  李旺旺
     * @Date:    2021/3/31 20:31
     * @param:   [userId]
     * @Description: 系统根据用户编号userId查询用户偏好表（UserPreferList）和用户关注表（UserConcernList）,获取到用户偏好信息和用户关注信息,
     *               通过用户偏好信息和用户关注信息查询标签关联表（TagLinkList）、游记信息表（TravelNoteList）、游记图片关系表(TravelNotePictureList),
     *               查询成功返回游记信息实例集合List<TravelNoteInfo>,若查询失败，返回 null。
     */
    List<TravelNoteInfo> recommendTravelNoteInfoNote(int userId);

    /**
    * @author:  李旺旺
    * @date:    2021/5/1 12:09
    * @param:   []
    * @return:  java.util.List<java.lang.String>
    * @exception:
    * @description: 获取游记地址信息
    */
    List<String> getLocate();

    /**
    * @author:  李旺旺
    * @date:    2021/5/1 16:56
    * @param:   [locateName]
    * @return:  int
    * @exception:
    * @description: 根据位置名称查询位置编号
    */
    int checkLocate(String locateName);

    /**
    * @author:  李旺旺
    * @date:    2021/5/2 20:12
    * @param:   [locateId]
    * @return:  java.lang.String
    * @exception:
    * @description: 根据位置编号查询位置名称
    */
    String matchLocate(int locateId);

    /**
     * @author:  李旺旺
     * @date:    2021/5/2 21:24
     * @param:   [peopleId]
     * @return:  java.lang.String
     * @exception:
     * @description: 根据人物编号查询人物名称
     */
    String matchPeople(int peopleId);

    List<TravelNotePictureInfo> queryTravelNotePicture(int travelNoteId);

    int queryTravelNoteLike(int userId, int travelNoteId);

    int queryTravelNoteCollection(int userId, int travelNoteId);

    List<TravelNoteInfo> queryTravelNoteInfoBySearch(String search);

    TravelNoteInfo queryTravelNoteInfoById(int travelNoteId);

    List<TravelNoteCommentInfo> queryTravelNoteComment(int travelNoteId);

    List<TravelNoteCommentPictureInfo> queryTravelNoteCommentPicture(int travelNoteId);

    Boolean updateTravelNoteLike(int userId, int travelNoteId);

    Boolean updateTravelNoteCollect(int userId, int travelNoteId);

    Boolean addTravelNoteComment(TravelNoteCommentInfo comment);

    Boolean addTravelNoteCommentPicture(TravelNoteCommentPictureInfo commentPicture);

    Boolean addReport(ReportTravelNoteInfo report);

    /**
     * @Author:  李旺旺
     * @Date:    2021/3/31 20:42
     * @param:   [travelNote]
     * @Description: 系统将游记对象保存在游记信息表（TravelNoteList）、游记图片关系表（TravelNotePictureList）中，若保存成功返回true,若保存失败，返回 false。
     */
    TravelNoteInfo addTravelNote(TravelNoteInfo travelNote);

    Boolean addTravelNotePicture(TravelNotePictureInfo travelNotePicture);

    Boolean addTravelNoteTag(int travelNoteId, int tagId);

    List<TravelNoteInfo> queryCollectedTravelNoteInfoByUserId(int userId);

    List<TravelNoteInfo> queryAllTravelNoteInfo(int userId);

    Boolean banShare(int travelNoteId);
}
