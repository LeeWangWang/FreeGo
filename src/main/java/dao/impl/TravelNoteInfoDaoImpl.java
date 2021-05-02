package dao.impl;

import dao.TravelNoteInfoDao;
import domain.*;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:32
 * @Description: 游记信息处理
 */
public class TravelNoteInfoDaoImpl implements TravelNoteInfoDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<TravelNoteInfo> recommendTravelNoteInfoNote(int userId) {
        return null;
    }

    @Override
    public String getLocate() {
        String sql = null;
        List<String> list = null;
        //1.定义sql语句
        sql = "select locateName from locate";
        //2.执行
        list = template.queryForList(sql, String.class);
        String result = "[";
        for (String item : list) {
            result = result + "{\"title\":\"" + item + "\"},";
        }
        result = result.substring(0, result.length()-1);
        result = result + "]";
        return result;
    }

    @Override
    public int checkLocate(String locateName) {
        //1.定义sql语句
        String sql = "select locateId from locate where locateName = ?";
        //2.执行
        return template.queryForObject(sql,Integer.class, locateName);
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 20:09
     * @param:   [travelNoteId]
     * @Description: 根据游记id从游记图片信息表（TravelNotePictureRelation）中查询游记和图片关系，生成每个游记的TravelNotePictureInfo的实例集合。
     */
    @Override
    public List<TravelNotePictureInfo> queryTravelNotePicture(int travelNoteId) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/3/31 20:32
     * @param:   [userId, travelNoteId]
     * @Description: 系统根据用户编号userId和游记编号travelNoteId查询游记点赞表(TravelNoteLikeList)，若查询到结果返回该游记的点赞量,若查询不到，返回-1。
     */
    @Override
    public int queryTravelNoteLike(int userId, int travelNoteId) {
        return 0;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/3/31 20:33
     * @param:   [userId, travelNoteId]
     * @Description: 系统根据用户编号userId和游记编号travelNoteId查询游记收藏表(TravelNoteCollectionList)，若查询到结果返回该游记的收藏量,若查询不到，返回-1。
     */
    @Override
    public int queryTravelNoteCollection(int userId, int travelNoteId) {
        return 0;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/3/31 20:34
     * @param:   [search]
     * @Description: 系统根据搜索内容search查询游记信息表（TravelNoteList）、游记图片关系表（TravelNotePictureList），
     *               查询成功返回游记信息实例集合List<TravelNoteInfo>,若查询失败，返回 null。`
     */
    @Override
    public List<TravelNoteInfo> queryTravelNoteInfoBySearch(String search) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/3/31 20:39
     * @param:   [travelNoteId]
     * @Description: 系统根据游记编号travelNoteId查询游记信息表（TravelNoteList）、游记图片关系表（TravelNotePictureList），
     *               查询成功返回游记信息实例TravelNoteInfo,若查询失败，返回 null。
     */
    @Override
    public TravelNoteInfo queryTravelNoteInfoById(int travelNoteId) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 16:46
     * @param:   [travelNoteId]
     * @Description: 系统根据游记编号travelNoteId游记评论表（TravelCommentList）、游记评论图片关系表（TravelCommentPictureList），
     *               若查询到结果返回该游记的评论信息实例集合List<TravelNoteCommentInfo>,若查询不到，返回null。
     */
    @Override
    public List<TravelNoteCommentInfo> queryTravelNoteComment(int travelNoteId) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 20:59
     * @param:   [travelNoteId]
     * @Description: 根据游记id从游记评论图片信息表（TravelNoteCommentPictureRelation）中查询游记评论和图片关系，生成每个游记的TravelNoteCommentPictureInfo的实例集合。
     */
    @Override
    public List<TravelNoteCommentPictureInfo> queryTravelNoteCommentPicture(int travelNoteId) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 16:47
     * @param:   [userId, travelNoteId]
     * @Description: 系统根据用户编号userId和游记编号travelNoteId更新游记点赞表(TravelNoteLikeList)，若更新成功返回true,若更新失败，返回 false。
     */
    @Override
    public Boolean updateTravelNoteLike(int userId, int travelNoteId) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 16:47
     * @param:   [userId, travelNoteId]
     * @Description: 系统根据用户编号userId和游记编号travelNoteId更新游记收藏表(TravelNoteCollectionList)，若更新成功返回true,若更新失败，返回 false。
     */
    @Override
    public Boolean updateTravelNoteCollect(int userId, int travelNoteId) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 21:02
     * @param:   [comment]
     * @Description: 系统将游记评论对象保存在游记评论表（TravelNoteCommentList）中，若保存成功返回true,若保存失败，返回 false。
     */
    @Override
    public Boolean addTravelNoteComment(TravelNoteCommentInfo comment) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 21:02
     * @param:   [commentPicture]
     * @Description: 系统将游记评论图片保存在游记评论图片关系表（TravelCommentPictureList）中，若保存成功返回true,若保存失败，返回 false。
     */
    @Override
    public Boolean addTravelNoteCommentPicture(TravelNoteCommentPictureInfo commentPicture) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 16:54
     * @param:   [report]
     * @Description: 系统将游记举报对象保存在游记举报表（ReportTravelNoteList）中，若保存成功返回true,若保存失败，返回 false。
     */
    @Override
    public Boolean addReport(ReportTravelNoteInfo report) {
        return null;
    }

    @Override
    public TravelNoteInfo addTravelNote(TravelNoteInfo travelNote) {
        //1.定义sql语句
        String sql1 = "insert into travelnote (travelNoteTitle,travelNoteCover,travelNoteText,publishDate,travelTime," +
                "travelDays,travelPerson,travelPrice,travelLocate) values(?,?,?,?,?,?,?,?,?)";
        //2.执行
        int result = template.update(sql1,
                travelNote.getTravelNoteTitle(),
                travelNote.getTravelNoteCover(),
                travelNote.getTravelNoteText(),
                travelNote.getPublishDate(),
                travelNote.getTravelTime(),
                travelNote.getTravelDays(),
                travelNote.getTravelPerson(),
                travelNote.getTravelPrice(),
                travelNote.getTravelLocate() );
        if (result == 1){
            TravelNoteInfo noteInfo = null;
            String sql2 = "select * from travelnote where travelNoteCover = ?";
            noteInfo = template.queryForObject(sql2, new BeanPropertyRowMapper<TravelNoteInfo>(TravelNoteInfo.class), travelNote.getTravelNoteCover());
            return noteInfo;
        }
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 21:03
     * @param:   [travelNotePicture]
     * @Description: 系统将游记图片保存在游记图片关系表（TravelNotePictureRelation）中，若保存成功返回true,若保存失败，返回 false。
     */
    @Override
    public Boolean addTravelNotePicture(TravelNotePictureInfo travelNotePicture) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 16:55
     * @param:   [travelNoteId, tagId]
     * @Description: 系统根据游记编号travelNoteId和标签编号tagId将游记的标签保存在标签关联表（TagLinkList）中，若保存成功返回true,若保存失败，返回 false。
     */
    @Override
    public Boolean addTravelNoteTag(int travelNoteId, int tagId) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/3/31 20:43
     * @param:   [userId]
     * @Description: 系统根据用户id查询游记收藏表（TravelNoteCollectionList）,返回游记id列表，根据游记id查询游记信息表（TravelNoteList），
     *               返回TravelNoteInfo实例集合，若查询失败，返回null。
     */
    @Override
    public List<TravelNoteInfo> queryCollectedTravelNoteInfoByUserId(int userId) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/3/31 20:44
     * @param:   [userId]
     * @Description: 系统根据用户编号userId查询游记信息表（TravelNoteList）、游记图片关系表（TravelNotePictureList）中该用户所有游记，
     *               查询成功返回游记信息实例集合List<TravelNoteInfo>,若查询失败，返回 null。
     */
    @Override
    public List<TravelNoteInfo> queryAllTravelNoteInfo(int userId) {
        return null;
    }

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 16:58
     * @param:   [travelNoteId]
     * @Description: 系统根据游记编号travelNoteId查询游记信息表（TravelNoteList），修改该游记状态为封禁状态，修改成功返回true，修改失败返回false。
     */
    @Override
    public Boolean banShare(int travelNoteId) {
        return null;
    }
}
