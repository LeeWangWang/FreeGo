package dao.impl;

import dao.TravelNoteInfoDao;
import domain.*;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:32
 * @Description: 游记信息处理
 */
public class TravelNoteInfoDaoImpl implements TravelNoteInfoDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<TravelNoteInfo> recommendTravelNoteInfo(int userId) {
        //总共搜索出50条数据，5种偏好，数量分别是(15,12,10,8,5)
        List<TravelNoteInfo> travelNoteInfoList = new ArrayList<>();
        if (userId == 0) {
            // 1.首先获取所有游记编号Id
            String sql1 = "select travelNoteId from travelnote";
            List<Integer> noteIdList = template.queryForList(sql1, Integer.class);
            System.out.println("noteIdList---排序前查询所有的游记编号List:  " + noteIdList.size());
            System.out.println(noteIdList);
            // 2.根据游记Id的List推荐游记信息（按照游记热度）(收藏量、点赞量、浏览量)
            List<Integer> hotList = new ArrayList<>();
            for (int k : noteIdList) {
                //获取收藏量（List）
                String sql2 = "select count(*) from travelnotecollection where travelNoteId = ?";
                int countCollect = template.queryForObject(sql2, Integer.class, k);
                //获取点赞量（List）
                String sql3 = "select count(*) from travelnotelike where travelNoteId = ?";
                int countLike = template.queryForObject(sql3, Integer.class, k);
                //获取浏览量（List）
                String sql4 = "select pageViews from travelnote where travelNoteId = ?";
                int countPageView = template.queryForObject(sql4, Integer.class, k);
                int hot = countCollect*5 + countLike*2 + countPageView;
                hotList.add(hot);
            }
            System.out.println("hotList---排序前综合热度:  " + hotList.size());
            for (int i = 0; i < hotList.size(); i++) {
                System.out.print(hotList.get(i) + " ");
            }

            // 3.热度List排序
            int flag;
            List<Integer> rankList = new ArrayList<>();
            List<Integer> resultList = new ArrayList<>();
            while (hotList.size() > 0) {
                flag = 0;
                for (int j = 1; j < hotList.size(); j++) {
                    if (hotList.get(j) > hotList.get(flag)) {
                        flag = j;
                    }
                }
                rankList.add(hotList.get(flag));
                hotList.remove(flag);
                resultList.add(noteIdList.get(flag));
                noteIdList.remove(flag);
            }
            System.out.println();
            System.out.println("rankList---排序后综合热度:  " + rankList.size());
            for (int i = 0; i < rankList.size(); i++) {
                System.out.print(rankList.get(i) + " ");
            }
            System.out.println();
            System.out.println("resultList---排序后查询相对应的游记编号List:  " + resultList.size());
            System.out.println(resultList);

            // 4.按照热度查询游记信息
            String sql6 = "select * from travelnote where travelNoteId = ?";
            TravelNoteInfo noteInfo;
            for (int i = 0; i < 54; i++) {
                noteInfo = template.queryForObject(sql6, new BeanPropertyRowMapper<TravelNoteInfo>(TravelNoteInfo.class), resultList.get(i));
                travelNoteInfoList.add(noteInfo);
            }
            System.out.println("travelNoteInfoList---数据库查询---游记推荐结果 Id:  " + travelNoteInfoList.size());
            for (TravelNoteInfo note : travelNoteInfoList) {
                System.out.print(" " + note.getTravelNoteId());
            }
            return travelNoteInfoList;
        } else {
            int index = 0;
            // 1.首先获取用户的所有偏好信息List(按照偏好权重由高到低)
            String sql1 = "select * from userprefer where userId = ? order by preferWeight desc";
            List<UserPrefer> userPrefers = template.query(sql1, new BeanPropertyRowMapper<UserPrefer>(UserPrefer.class), userId);
            System.out.println("userPrefers---获取用户的所有偏好信息List:  " + userPrefers.size());
            for (int i = 0; i < userPrefers.size(); i++) {
                System.out.println(userPrefers.get(i).toString() + " ");
            }
            // 2.根据标签Id，查询相对应的游记编号List(去除重复的游记Id)
            List<Integer> noteIdList = new ArrayList<>();
            for (int i = 0; i < userPrefers.size(); i++) {
                List<Integer> idList;
                String sql2 = "select linkId from taglink where tagId = ? and type = '0';";
                idList = template.queryForList(sql2, Integer.class, userPrefers.get(i).getTagId() );
                for (int j : idList) {
                    if (!noteIdList.contains(j)) {
                        noteIdList.add(j);
                    }
                }
            }
            System.out.println("noteIdList---排序前查询相对应的游记编号List:  " + noteIdList.size());
            System.out.println(noteIdList);
            // 3.根据游记Id的List推荐游记信息（按照游记热度）(收藏量、点赞量、浏览量)
            List<Integer> hotList = new ArrayList<>();
            for (int k : noteIdList) {
                //获取收藏量（List）
                String sql3 = "select count(*) from travelnotecollection where travelNoteId = ?";
                int countCollect = template.queryForObject(sql3, Integer.class, k);
                //获取点赞量（List）
                String sql4 = "select count(*) from travelnotelike where travelNoteId = ?";
                int countLike = template.queryForObject(sql4, Integer.class, k);
                //获取浏览量（List）
                String sql5 = "select pageViews from travelnote where travelNoteId = ?";
                int countPageView = template.queryForObject(sql5, Integer.class, k);
                int hot = countCollect*5 + countLike*2 + countPageView;
                hotList.add(hot);
            }
            System.out.println("hotList---排序前综合热度:  " + hotList.size());
            for (int i = 0; i < hotList.size(); i++) {
                System.out.print(hotList.get(i) + " ");
            }

            // 4.热度List排序
            int flag;
            List<Integer> rankList = new ArrayList<>();
            List<Integer> resultList = new ArrayList<>();
            while (hotList.size() > 0) {
                flag = 0;
                for (int j = 1; j < hotList.size(); j++) {
                    if (hotList.get(j) > hotList.get(flag)) {
                        flag = j;
                    }
                }
                rankList.add(hotList.get(flag));
                hotList.remove(flag);
                resultList.add(noteIdList.get(flag));
                noteIdList.remove(flag);
            }

            System.out.println("rankList---排序后综合热度:  " + rankList.size());
            for (int i = 0; i < rankList.size(); i++) {
                System.out.print(rankList.get(i) + " ");
            }
            System.out.println("resultList---排序后查询相对应的游记编号List:  " + resultList.size());
            System.out.println(resultList);

            // 5.按照热度排行查询游记信息
            String sql6 = "select * from travelnote where travelNoteId = ?";
            TravelNoteInfo noteInfo;
            for (int i = 0; i < 54; i++) {
                noteInfo = template.queryForObject(sql6, new BeanPropertyRowMapper<TravelNoteInfo>(TravelNoteInfo.class), resultList.get(i));
                travelNoteInfoList.add(noteInfo);
            }
            System.out.println("travelNoteInfoList---数据库查询---游记推荐结果 Id:  " + travelNoteInfoList.size());
            for (TravelNoteInfo note : travelNoteInfoList) {
                System.out.print(" " + note.getTravelNoteId());
            }
        }
        return travelNoteInfoList;
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

    @Override
    public List<TravelNoteCommentInfo> queryTravelNoteComment(int travelNoteId) {
        return null;
    }

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

    @Override
    public Boolean addTravelNoteComment(TravelNoteCommentInfo comment) {
        return null;
    }

    @Override
    public Boolean addTravelNoteCommentPicture(TravelNoteCommentPictureInfo commentPicture) {
        return null;
    }

    @Override
    public Boolean addReport(ReportTravelNoteInfo report) {
        return null;
    }

    @Override
    public TravelNoteInfo addTravelNote(TravelNoteInfo travelNote, int userId) {
        //1.定义sql语句
        String sql1 = "insert into travelnote (travelNoteTitle, travelNoteCover, travelNoteText, publishDate, travelTime," +
                " travelDays, travelPerson, travelPrice, travelLocate) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        //2.执行
        int result1 = template.update(sql1,
                travelNote.getTravelNoteTitle(),
                travelNote.getTravelNoteCover(),
                travelNote.getTravelNoteText(),
                travelNote.getPublishDate(),
                travelNote.getTravelTime(),
                travelNote.getTravelDays(),
                travelNote.getTravelPerson(),
                travelNote.getTravelPrice(),
                travelNote.getTravelLocate() );
        if (result1 == 1){
            System.out.println("保存游记成功");
            TravelNoteInfo noteInfo = null;
            String sql2 = "select * from travelnote where travelNoteCover = ?";
            noteInfo = template.queryForObject(sql2, new BeanPropertyRowMapper<TravelNoteInfo>(TravelNoteInfo.class), travelNote.getTravelNoteCover());
            if (noteInfo != null) {
                System.out.println("返回游记完整信息成功");
                String sql3 = "insert into travelnotelist (travelNoteId, userId) values(?, ?)";
                int result2 = template.update(sql3, noteInfo.getTravelNoteId(), userId);
                if (result2 == 1){
                    System.out.println("添加游记完整功能成功");
                    return noteInfo;
                }
            }
        }
        return null;
    }

    @Override
    public Boolean addTravelNoteTag(int travelNoteId, int tagId) {
        return null;
    }

    @Override
    public List<TravelNoteInfo> queryCollectedTravelNoteInfoByUserId(int userId) {
        return null;
    }

    @Override
    public List<TravelNoteInfo> queryAllTravelNoteInfo(int userId) {
        return null;
    }

    @Override
    public Boolean isMyTravelNote(int userId, int noteId) {
        //1.定义sql语句
        String sql = "select count(*) FROM travelnotelist WHERE userId = ? AND travelnoteId = ?;";
        //2.执行
        int result =  template.queryForObject(sql, Integer.class, userId, noteId);
        if (result == 1){
            return true;
        }
        return false;
    }

    @Override
    public Boolean isUserFollowedByTravelNoteId(int userId, int noteId) {
        //1.定义sql语句
        String sql = "select count(*) from userconcern where userId = ? and followId = (select userId from travelnotelist where travelnoteId = ?);";
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
        String sql = "select count(*) from travelnotecollection where travelNoteId = ?;";
        //2.执行
        return template.queryForObject(sql, Integer.class, noteId);
    }

    @Override
    public int queryTravelNoteLikeNum(int noteId) {
        //1.定义sql语句
        String sql = "select count(*) from travelnotelike where travelNoteId = ?;";
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
