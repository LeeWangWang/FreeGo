package dao.impl;

import dao.TravelNoteInfoDao;
import domain.*;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import java.util.ArrayList;
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
        //总共搜索出50条数据，5种偏好，数量分别是(15,12,10,8,5)
        List<TravelNoteInfo> list;
        if (userId == -1) {
        } else {
            // 1.首先获取用户的所有偏好信息(按照偏好权重由高到低)
            String sql1 = "select * from userprefer where userId = ? order by preferWeight desc";
            List<UserPrefer> userPrefers = template.queryForList(sql1, UserPrefer.class, userId);
            // 2.根据标签Id，查询相对应的游记信息
            List<Integer> noteIdList = null;
            for (int i = 0; i < 4; i++) {
                List<Integer> idList;
                String sql2 = "select linkId from taglink where tagId = ? and type = '0' ";
                idList = template.queryForList(sql2, Integer.class, userPrefers.get(i).getTagId() );
                noteIdList.addAll(idList);
            }
        }
        return null;
    }

    @Override
    public List<String> getLocate() {
        //1.定义sql语句
        String sql = "select locateName from locate";
        //2.执行
        return template.queryForList(sql, String.class);
    }

    @Override
    public int checkLocate(String locateName) {
        //1.定义sql语句
        String sql = "select locateId from locate where locateName = ?";
        //2.执行
        return template.queryForObject(sql,Integer.class, locateName);
    }

    @Override
    public String matchLocate(int locateId) {
        //1.定义sql语句
        String sql = "select locateName from locate where locateId = ?";
        //2.执行
        return template.queryForObject(sql,String.class, locateId);
    }

    @Override
    public String matchPeople(int peopleId) {
        //1.定义sql语句
        String sql = "select tagName from tag where tagId = ?";
        //2.执行
        return template.queryForObject(sql,String.class, peopleId);
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
     * @Date:    2021/3/31 20:34
     * @param:   [search]
     * @Description: 系统根据搜索内容search查询游记信息表（TravelNoteList）、游记图片关系表（TravelNotePictureList），
     *               查询成功返回游记信息实例集合List<TravelNoteInfo>,若查询失败，返回 null。`
     */
    @Override
    public List<TravelNoteInfo> queryTravelNoteInfoBySearch(String search) {
        return null;
    }

    @Override
    public TravelNoteInfo queryTravelNoteInfoById(int travelNoteId) {
        //1.定义sql语句
        String sql = "select * from travelnote where travelNoteId = ?";
        //2.执行
        TravelNoteInfo noteInfo = template.queryForObject(sql, new BeanPropertyRowMapper<TravelNoteInfo>(TravelNoteInfo.class), travelNoteId);
        System.out.println("根据游记Id查询游记信息：" + noteInfo.getTravelNoteTitle());
        return noteInfo;
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

    @Override
    public Boolean updateTravelNoteCollect(int userId, int travelNoteId) {
        //1.定义sql语句
        String sql1 = "select count(*) from travelnotecollection where userId = ? and travelNoteId = ?";
        //2.执行
        int result1 =  template.queryForObject(sql1, Integer.class, userId, travelNoteId);
        if (result1 == 1){
            String sql2 = "delete from travelnotecollection where userId = ? and travelNoteId = ?";
            int result2 = template.update(sql2, userId, travelNoteId);
            if (result2 == 1){
                return true;
            }
            return false;
        } else {
            String sql2 = "insert into travelnotecollection (userId, travelNoteId) values (?,?)";
            int result2 = template.update(sql2, userId, travelNoteId);
            if (result2 == 1){
                return true;
            }
            return false;
        }
    }

    @Override
    public Boolean updateTravelNoteLike(int userId, int travelNoteId) {
        //1.定义sql语句
        String sql1 = "select count(*) from travelnotelike where userId = ? and travelNoteId = ?";
        //2.执行
        int result1 =  template.queryForObject(sql1, Integer.class, userId, travelNoteId);
        if (result1 == 1){
            String sql2 = "delete from travelnotelike where userId = ? and travelNoteId = ?";
            int result2 = template.update(sql2, userId, travelNoteId);
            if (result2 == 1){
                return true;
            }
            return false;
        } else {
            String sql2 = "insert into travelnotelike (userId, travelNoteId) values (?,?)";
            int result2 = template.update(sql2, userId, travelNoteId);
            if (result2 == 1){
                return true;
            }
            return false;
        }
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

    @Override
    public Boolean isUserFollowedByTravelNoteId(int userId, int noteId) {
        //1.定义sql语句
        String sql = "SELECT COUNT(*) FROM userconcern WHERE userId = ? AND followId = (SELECT userId FROM travelnotelist WHERE travelnoteId = ?);";
        //2.执行
        int result =  template.queryForObject(sql, Integer.class, userId, noteId);
        if (result == 1){
            return true;
        }
        return false;
    }

    @Override
    public Boolean isTravelNoteCollect(int userId, int noteId) {
        //1.定义sql语句
        String sql = "select count(*) from travelnotecollection where userId = ? and travelNoteId = ?";
        //2.执行
        int result =  template.queryForObject(sql, Integer.class, userId, noteId);
        if (result == 1){
            return true;
        }
        return false;
    }

    @Override
    public Boolean isTravelNoteLike(int userId, int noteId) {
        //1.定义sql语句
        String sql = "select count(*) from travelnotelike where userId = ? and travelNoteId = ?";
        //2.执行
        int result =  template.queryForObject(sql, Integer.class, userId, noteId);
        if (result == 1){
            return true;
        }
        return false;
    }

    @Override
    public Boolean updateUserFollowByTravelNoteId(int userId, int noteId) {
        //1.定义sql语句
        String sql = "SELECT COUNT(*) FROM userconcern WHERE userId = ? AND followId = (SELECT userId FROM travelnotelist WHERE travelnoteId = ?);";
        //2.执行
        int result =  template.queryForObject(sql, Integer.class, userId, noteId);
        if (result == 1){
            String sql2 = "delete from userconcern WHERE userId = ? AND followId = (SELECT userId FROM travelnotelist WHERE travelnoteId = ?);";
            int result2 = template.update(sql2, userId, noteId);
            if (result2 == 1){
                return true;
            }
            return false;
        } else {
            String sql2 = "insert into userconcern (userId, followId) values ( ? , (SELECT userId FROM travelnotelist WHERE travelnoteId = ?) );";
            int result2 = template.update(sql2, userId, noteId);
            if (result2 == 1) {
                return true;
            }
            return false;
        }
    }

    @Override
    public int queryTravelNoteCollectionNum(int noteId) {
        //1.定义sql语句
        String sql = "SELECT COUNT(*) FROM travelnotecollection WHERE travelNoteId = ?;";
        //2.执行
        return template.queryForObject(sql, Integer.class, noteId);
    }

    @Override
    public int queryTravelNoteLikeNum(int noteId) {
        //1.定义sql语句
        String sql = "SELECT COUNT(*) FROM travelnotelike WHERE travelNoteId = ?;";
        //2.执行
        return template.queryForObject(sql, Integer.class, noteId);
    }

    @Override
    public Boolean updateTravelNoteView(int noteId) {
        //1.定义sql语句
        String sql = "update travelnote set pageViews=pageViews+1 where travelNoteId = ?";
        //2.执行
        int result = template.update(sql, noteId);
        if (result == 1){
            return true;
        }
        return false;
    }
}
