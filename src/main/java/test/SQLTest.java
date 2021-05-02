package test;

import dao.impl.UserInfoDaoInfoImpl;
import domain.TravelNoteInfo;
import domain.UserInfo;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import utils.JDBCUtils;

import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/4 14:04
 * @Description: 数据库语句测试类
 */
public class SQLTest {

    public static void main(String[] args) {

        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

        UserInfoDaoInfoImpl userInfoDao = new UserInfoDaoInfoImpl();
        /*
        UserInfo userInfo = new UserInfo("15356145755","876213908@qq.com","Joshua Genter","123456789","男","湖人总冠军","",false);
        userInfo.setUserId(1055);

        Boolean result = userInfoDao.isUserCellnumberExist("11156145755");

        Boolean result = userInfoDao.saveUserInfo(userInfo);

        Boolean result = userInfoDao.isAccountRight("", "2458581048@qq.com", "123456789");

        Boolean result = userInfoDao.isUserFollowed(1001,5);
        Boolean result = userInfoDao.updateUserInfo(userInfo);
        System.out.println(result);


        String sql = null;
        //1.定义sql语句
        sql = "select * from user where userId in (select userconcern.`userId` from userconcern where followId = ?)";
        //2.执行
        List<UserInfo> list = null;
        list = template.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), 1051);

        Iterator<UserInfo> iter = list.iterator();
        while(iter.hasNext()) {
            System.out.println(iter.next());
        }*/

    /*
            String sql = null;
            List<String> list = null;
            //1.定义sql语句
            sql = "select locateName from locate";
            //2.执行
            list = template.queryForList(sql, String.class);
            String result = "{\"data\":[";
            for (String item : list) {
                result = result + "{\"title\":\"" + item + "\"},";
            }
            result = result.substring(0, result.length()-1);
            result = result + "]}";
            return result;
    */

       /* String sql = null;
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
        System.out.println(result);*/

/*
       TravelNoteInfo travelNote = new TravelNoteInfo("北纬18° | 三座岛屿，是关于海的浪漫。","/FreegoImg/li/travelnote/2384286bdf4a449ca3f840b8c",
               "<h2>借着夏天的名义，一起去看海吧</h2><p>“海里深处有家蓝色便利店，贩卖着深蓝和温柔本身”，抵挡不过大海的浪漫，抗拒不了蓝色毒药，让我一而再，再而三折返&nbsp;<a href=\"https://www.mafengwo.cn/travel-scenic-spot/mafengwo/12938.html\" target=\"_blank\">海南</a>&nbsp;。<br/><br/>都说，这世界上最美的海滩大多集中在北纬18°。从&nbsp;<a href=\"https://www.mafengwo.cn/travel-scenic-spot/mafengwo/11656.html\" target=\"_blank\">墨西哥</a>&nbsp;<a href=\"https://www.mafengwo.cn/travel-scenic-spot/mafengwo/15930.html\" target=\"_blank\">坎昆</a>&nbsp;，&nbsp;<a href=\"https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10062.html\" target=\"_blank\">美国</a>&nbsp;<a href=\"https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10927.html\" target=\"_blank\">夏威夷</a>&nbsp;，到印尼&nbsp;<a href=\"https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10460.html\" target=\"_blank\">巴厘岛</a>&nbsp;，&nbsp;<a href=\"https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10083.html\" target=\"_blank\">泰国</a>&nbsp;<a href=\"https://www.mafengwo.cn/travel-scenic-spot/mafengwo/11046.html\" target=\"_blank\">芭提雅</a>&nbsp;，独特的板块构造，湿润的海洋气候孕育了最适宜人们度假的浪漫海滩天堂，被誉为“黄金纬度”。<br/><br/>这次，我来&nbsp;<a href=\"https://www.mafengwo.cn/travel-scenic-spot/mafengwo/10030.html\" target=\"_blank\">三亚</a>&nbsp;，先后走的三个岛屿，都在这个纬度上。</p><p><img src=\"/FreegoImg/li/travelnote/cc6c2ad72a3c4e43bd8f98e3f8e51247.jpeg\" style=\"max-width:100%;\"/></p><p>我在这，光着脚踩过沙滩，感受过海水冲上岸的冰凉透彻。</p><p><img src=\"/FreegoImg/li/travelnote/5064468511c849438435d4ea29d74dc3.jpeg\" style=\"max-width:100%;\"/></p><p>我在这，沐浴过炙热阳光，吹过咸涩海风，因骑电瓶车而晒黑几度的胸口提醒我，忘记涂防晒。</p><p><img src=\"/FreegoImg/li/travelnote/158b393c82504e9eb6a6cc4ace7de9b5.jpeg\" style=\"max-width:100%;\"/></p><p>我在这，开过一边说着害怕一边手把油门转到底，被浪冲的快起飞翻转的摩托艇。</p><p><img src=\"/FreegoImg/li/travelnote/39ccceede06246fdb3998f35ae270403.jpeg\" style=\"max-width:100%;\"/></p><p>我在这，上过一万英尺高空，一跃而下，享受自由落体的时间，俯瞰整个海棠湾美景，耳边只有风声和自己心跳的声音。</p><p><br/></p>",
               Date.valueOf("2021-05-01"),Date.valueOf("2021-03-05"),12,26,10000,362);
       travelNote.toString();
        //travelNote.setPublishDate(Date.valueOf("2021-03-05"));
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
        if (result == 1) {
            System.out.println("插入成功");
        }
        if (result == 1) {
            TravelNoteInfo noteInfo = null;
            String sql2 = "select * from travelnote where travelNoteCover = ?";
            noteInfo = template.queryForObject(sql2, new BeanPropertyRowMapper<TravelNoteInfo>(TravelNoteInfo.class), travelNote.getTravelNoteCover());
            noteInfo.toString();
        }*/
        /*String sql = "select locateId from locate where locateName = ?";
        int result = template.queryForObject(sql,Integer.class, "上海市");
        System.out.println(result);*/
    }
}
