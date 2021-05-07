package service;

import domain.PageBean;
import domain.TravelNoteInfo;
import domain.UserInfo;

import java.util.List;

public interface TravelNoteInfoService {

    /**
     * 系统根据用户编号userId查询用户偏好表,获取到用户偏好信息,通过用户偏好信息查询标签关联表、游记信息表（TravelNoteList）,查询成功返回游记信息实例集合List<TravelNoteInfo>,若查询失败，返回 null。
     */
    List<TravelNoteInfo> recommendTravelNoteInfo(int userId);

    /**
     * 根据输入内容搜索游记
     */
    List<TravelNoteInfo> queryTravelNoteInfoBySearch(String search);

    /**
    * 获取所有地址信息
    */
    List<String> getLocate();

    /**
    * 保存游记信息
    */
    TravelNoteInfo addTravelNote(TravelNoteInfo travelNote, int userId);

    /**
    * 根据位置名称查询位置编号
    */
    int checkLocate(String locateName);

    /**
    * 根据游记Id查询游记信息
    */
    TravelNoteInfo queryTravelNoteInfoById(int noteId);

    /**
    * 根据位置编号查询位置名称
    */
    String matchLocate(int locateId);

    /**
     * 根据人物编号查询人物名称
     */
    String matchPeople(int peopleId);

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
    * 获取游记收藏量
    */
    int queryTravelNoteCollectionNum(int noteId);

    /**
    * 查询游记点赞数量
    */
    int queryTravelNoteLikeNum(int noteId);

    /**
     * 更新关注信息
     */
    Boolean updateUserFollowByTravelNoteId(int userId, int noteId);

    /**
    * 更新收藏信息
    */
    Boolean updateTravelNoteCollect(int userId, int noteId);

    /**
    * 更新点赞信息
    */
    Boolean updateTravelNoteLike(int userId, int noteId);

    /**
    * 更新浏览量
    */
    Boolean updateTravelNoteView(int noteId);

}
