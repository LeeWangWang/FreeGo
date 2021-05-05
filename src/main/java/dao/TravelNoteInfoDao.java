package dao;

import domain.*;

import java.util.List;

public interface TravelNoteInfoDao {

    /**
     * 根据用户编号userId查询用户偏好表,获取到用户偏好信息,通过用户偏好信息查询标签关联表、游记信息表,查询成功返回游记信息实例集合List<TravelNoteInfo>,若查询失败，返回 null。
     */
    List<TravelNoteInfo> recommendTravelNoteInfo(int userId);

    /**
    * 获取游记地址信息
    */
    List<String> getLocate();

    /**
    * 根据位置名称查询位置编号
    */
    int checkLocate(String locateName);

    /**
    * 根据位置编号查询位置名称
    */
    String matchLocate(int locateId);

    /**
     * 根据人物编号查询人物名称
     */
    String matchPeople(int peopleId);

    /**
     * 系统根据搜索内容search查询游记信息表,查询成功返回游记信息实例集合List<TravelNoteInfo>,若查询失败，返回 null。`
     */
    List<TravelNoteInfo> queryTravelNoteInfoBySearch(String search);

    /**
     * 系统根据游记编号travelNoteId查询游记信息表，查询成功返回游记信息实例TravelNoteInfo,若查询失败，返回 null。
     */
    TravelNoteInfo queryTravelNoteInfoById(int travelNoteId);

    /**
     * 系统根据游记编号travelNoteId游记评论表，若查询到结果返回该游记的评论信息实例集合List<TravelNoteCommentInfo>,若查询不到，返回null。
     */
    List<TravelNoteCommentInfo> queryTravelNoteComment(int travelNoteId);

    /**
     * 根据游记id从游记评论图片信息表中查询游记评论和图片关系，生成每个游记的TravelNoteCommentPictureInfo的实例集合。
     */
    List<TravelNoteCommentPictureInfo> queryTravelNoteCommentPicture(int travelNoteId);

    /**
     * 系统根据用户编号userId和游记编号travelNoteId更新游记收藏表(TravelNoteCollectionList)，若更新成功返回true,若更新失败，返回 false。
     */
    Boolean updateTravelNoteCollect(int userId, int travelNoteId);

    /**
     * 系统根据用户编号userId和游记编号travelNoteId更新游记点赞表(TravelNoteLikeList)，若更新成功返回true,若更新失败，返回 false。
     */
    Boolean updateTravelNoteLike(int userId, int travelNoteId);

    /**
     * 系统将游记评论对象保存在游记评论表（TravelNoteCommentList）中，若保存成功返回true,若保存失败，返回 false。
     */
    Boolean addTravelNoteComment(TravelNoteCommentInfo comment);

    /**
     * 系统将游记评论图片保存在游记评论图片关系表（TravelCommentPictureList）中，若保存成功返回true,若保存失败，返回 false。
     */
    Boolean addTravelNoteCommentPicture(TravelNoteCommentPictureInfo commentPicture);

    /**
     * 系统将游记举报对象保存在游记举报表（ReportTravelNoteList）中，若保存成功返回true,若保存失败，返回 false。
     */
    Boolean addReport(ReportTravelNoteInfo report);

    /**
     * 系统将游记对象保存在游记信息表（TravelNoteList）、游记图片关系表（TravelNotePictureList）中，若保存成功返回true,若保存失败，返回 false。
     */
    TravelNoteInfo addTravelNote(TravelNoteInfo travelNote, int userId);

    /**
     * 系统根据游记编号travelNoteId和标签编号tagId将游记的标签保存在标签关联表（TagLinkList）中，若保存成功返回true,若保存失败，返回 false。
     */
    Boolean addTravelNoteTag(int travelNoteId, int tagId);

    /**
     * 系统根据用户id查询游记收藏表,返回游记id列表，根据游记id查询游记信息表，返回TravelNoteInfo实例集合，若查询失败，返回null。
     */
    List<TravelNoteInfo> queryCollectedTravelNoteInfoByUserId(int userId);

    /**
     * 系统根据用户编号userId查询游记信息表中该用户所有游记，查询成功返回游记信息实例集合List<TravelNoteInfo>,若查询失败，返回 null。
     */
    List<TravelNoteInfo> queryAllTravelNoteInfo(int userId);

    /**
     * 判断游记是否属于自己
     */
    Boolean isMyTravelNote(int userId, int noteId);

    /**
    * 判断是否关注
    */
    Boolean isUserFollowedByTravelNoteId(int userId, int noteId);

    /**
    * 判断是否收藏
    */
    Boolean isTravelNoteCollect(int userId, int noteId);

    /**
    * 判断是否点赞
    */
    Boolean isTravelNoteLike(int userId, int noteId);

    /**
    * 更新关注信息
    */
    Boolean updateUserFollowByTravelNoteId(int userId, int noteId);

    /**
    * 获取游记收藏量
    */
    int queryTravelNoteCollectionNum(int noteId);

    /**
    * 获取游记点赞量
    */
    int queryTravelNoteLikeNum(int noteId);

    /**
    * 更新浏览量
    */
    Boolean updateTravelNoteView(int noteId);
}
