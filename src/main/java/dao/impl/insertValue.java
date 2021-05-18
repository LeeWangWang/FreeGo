package dao.impl;/**
 * 一些声明信息
 * Description: <br/>
 * date: 2021/4/27 21:07<br/>
 *
 * @author hp<br />
 * @version
 * @since JDK 1.8
 */


import domain.*;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import java.util.ArrayList;
import java.util.List;

import static java.lang.Math.random;

/**
 * ClassName: insertValue <br/>
 * Description: <br/>
 * date: 2021/4/27 21:07<br/>
 * @author hp<br />
 */
public class insertValue {

    /*插入酒店*/
    public static void insertValue() {
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        List<HotelInfo> hotelInfoList = new ArrayList<HotelInfo>();
        //获得所有hotelInfo
        try {
            //1.定义sql语句
            String sql = "select * from hotel";
            hotelInfoList = template.query(sql, new BeanPropertyRowMapper<HotelInfo>(HotelInfo.class));
        } catch (Exception e) {
            System.out.println("失败");
        }

        for (int i = 0; i < hotelInfoList.size(); i++) {
            //准备17个标签
            List<Integer> suiji = new ArrayList<Integer>();
            suiji.add(3);
            suiji.add(5);
            suiji.add(6);
            suiji.add(7);
            suiji.add(8);
            suiji.add(9);
            suiji.add(10);
            suiji.add(11);
            suiji.add(12);
            suiji.add(13);
            suiji.add(14);
            suiji.add(18);
            suiji.add(19);
            suiji.add(20);
            suiji.add(21);
            suiji.add(22);
            suiji.add(23);
            suiji.add(24);
            suiji.add(25);
            suiji.add(26);
            //随机去掉几个
            /*想让标签少就把suiji.size()*?的倍数加大 */
            for (int k = 0; k < suiji.size()*8; k++) {
                int value = (int) (random() * 26)+1;
                System.out.println("随机数为:" + value);
                for (int l = 0; l < suiji.size(); l++) {
                    if (value == suiji.get(l)) {
                        suiji.remove(l);
                    }
                }
            }
            //到这里 上面的suiji(list)就是该酒店的标签
            for (int j = 0; j < suiji.size(); j++) {
                try {
                    String sql = "insert into taglink(linkId,tagId,type) values(?,?,?)";
                    template.update(sql, hotelInfoList.get(i).getHotelId(), suiji.get(j), "酒店");
                } catch (Exception e) {
                    System.out.println("插入失败");
                }
            }
        }
    }

    /*添加用户收藏信息*/
    public static void insertCollect(){
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        List<HotelInfo> hotelInfoList = new ArrayList<HotelInfo>();
        List<UserInfo> userInfoList = new ArrayList<UserInfo>();
        //获得所有hotelInfo
        try {
            //1.定义sql语句
            String sql = "select * from hotel";
            hotelInfoList = template.query(sql, new BeanPropertyRowMapper<HotelInfo>(HotelInfo.class));
        } catch (Exception e) {
            System.out.println("失败");
        }
        try {
            //1.定义sql语句
            String sql = "select * from user";
            userInfoList = template.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class));
        } catch (Exception e) {
            System.out.println("失败");
        }

        /*随机收藏20-40个*/
        for (int i = 0; i < userInfoList.size(); i++) {
            List<Integer> collect = new ArrayList<Integer>();
            //收藏数量随机
            int suijiValue = (int) (random() * 20) + 20;
            for (int k = 0; k < suijiValue; k++) {
                int hotel = 1000+ (int) (random() * 999);
                int pd = 0;
                for(int j = 0;j < collect.size();j++){
                    if(hotel == collect.get(j)){
                        pd = 1;
                    }
                }
                if(pd != 1){
                    collect.add(hotel);
                }
            }
            /*System.out.print("user"+userInfoList.get(i).getUserId()+":");
            for(int mm = 0;mm < collect.size();mm++){
                System.out.print(collect.get(mm)+",");
            }
            System.out.println("");*/
            for(int nn = 0;nn < collect.size();nn++){
                try {
                    String sql = "insert into hotelcollect(hotelId,userId) values(?,?)";
                    template.update(sql,collect.get(nn),userInfoList.get(i).getUserId());
                } catch (Exception e) {
                    System.out.println("插入失败");
                }
            }
        }
    }
    /*设初值 就是全部标签设置成0*/
    public static void insertUserPreferFirstValue(){
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        List<UserInfo> userList = new ArrayList<UserInfo>();   //所有用户】
        try {
            //1.定义sql语句
            String sql = "select * from user";
            userList = template.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class));
        }catch (Exception e) {
            System.out.println("失败");
        }
        for(int i= 0;i < userList.size();i++){
            for(int j = 1;j <= 26;j++){
                try {
                    //1.定义sql语句
                    String sql = "insert into userprefer(userId,tagId,preferWeight) values(?,?,?)";
                    template.update(sql,userList.get(i).getUserId(),j,(float)(0));
                    System.out.println("user:"+userList.get(i).getUserId()+" tagId:"+j+" weight:"+0);
                }catch (Exception e) {
                    System.out.println("失败");
                }
            }
        }
    }
    public static void insertLikeWeigh(){
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        List<UserInfo> userList = new ArrayList<UserInfo>();   //所有用户
        List<TagLinkInfo> taglinkList = new ArrayList<TagLinkInfo>();   //所有用户
        List<HotelCollectInfo> hotelCollectList = new ArrayList<HotelCollectInfo>();   //所有用户

        /*用户信息*/
        try {
            //1.定义sql语句
            String sql = "select * from user";
            userList = template.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class));
        }catch (Exception e) {
            System.out.println("失败1");
        }
        /*tagLink信息*/
        try {
            //1.定义sql语句
            String sql = "select * from taglink";
            taglinkList = template.query(sql, new BeanPropertyRowMapper<TagLinkInfo>(TagLinkInfo.class));
        } catch (Exception e) {
            System.out.println("失败2");
        }
        try {
            //1.定义sql语句
            String sql = "select * from hotelcollect";
            hotelCollectList = template.query(sql, new BeanPropertyRowMapper<HotelCollectInfo>(HotelCollectInfo.class));
        } catch (Exception e) {
            System.out.println("失败3");
        }

        for(int i = 0;i < hotelCollectList.size();i++){  //所有用户
            List<TagInfo> tagList = new ArrayList<TagInfo>();
            String sql = "select * from taglink where linkId = ? and type = ?";
            //查出收藏的该酒店 所拥有的tag标签
            tagList = template.query(sql, new BeanPropertyRowMapper<TagInfo>(TagInfo.class),hotelCollectList.get(i).getHotelId(),"酒店");
            //System.out.println("数量"+tagList.size());
            for(int j = 0;j < tagList.size();j++){
                /*try{*/
                String sqll = "update userprefer set preferWeight = preferWeight + ? where tagId = ? and userId = ?";
                template.update(sqll,(float)(0.5),tagList.get(j).getTagId(),hotelCollectList.get(i).getUserId());
                /*}catch (Exception e) {
                    System.out.println("失败4");
                }*/
            }
        }
    }
    public static void main(String[] arge){
        //insertValue.insertValue();  //给所有酒店插入它的tag
        //insertValue.insertCollect();//给所有用户随机收藏20-40个酒店景点
        //insertValue.insertUserPreferFirstValue();//给所用用户的tag设置成0
        //insertValue.insertLikeWeigh();  //通过用户收藏更新用户对每个方向上的喜爱值

        //其余插入
        //insertValue.insertRoomPicture();
        //insertValue.insertHotelPicture();
    }
    /*插入每个房间对应的小图片*/
    public static void insertRoomPicture(){
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        List<RoomInfo> roomInfoList = new ArrayList<RoomInfo>();
        try {
            //1.定义sql语句
            String sql = "select * from room";
            roomInfoList = template.query(sql, new BeanPropertyRowMapper<RoomInfo>(RoomInfo.class));
        } catch (Exception e) {
            System.out.println("失败2");
        }

        for(int i = 0;i < roomInfoList.size();i++){
            List<Integer> pictureList = new ArrayList<Integer>();
            for(int j = 0;j < 6;j++){
                int pd = 0;
                while(pd != -1) {
                    pd = 0;
                    int a = (int)(random() * 79) + 1;
                    for (int k = 0; k < pictureList.size(); k++) {
                        if (pictureList.get(k) == a) {
                            pd++;
                        }
                    }
                    if (pd == 0) {
                        pictureList.add(a);
                        pd = -1;
                    }
                }
            }
            for(int kk = 0;kk < pictureList.size();kk++){
                try {
                    //1.定义sql语句
                    String sql = "insert into roompicturerelation(roomId,picturePath,pictureOrder) values(?,?,?)";
                    template.update(sql,roomInfoList.get(i).getRoomId(),pictureList.get(kk)+".jpeg",kk+1);
                }catch (Exception e) {
                    System.out.println("失败2");
                }
            }
        }

        /**/
    }

    /*插入每个酒店对应的小图片*/
    public static void insertHotelPicture(){
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        List<HotelInfo> hotelInfoList = new ArrayList<HotelInfo>();
        try {
            //1.定义sql语句
            String sql = "select * from Hotel";
            hotelInfoList = template.query(sql, new BeanPropertyRowMapper<HotelInfo>(HotelInfo.class));
        } catch (Exception e) {
            System.out.println("失败2");
        }

        for(int i = 0;i < hotelInfoList.size();i++){
            List<Integer> pictureList = new ArrayList<Integer>();
            for(int j = 0;j < 6;j++){
                int pd = 0;
                while(pd != -1) {
                    pd = 0;
                    int a = (int)(random() * 79) + 1;
                    for (int k = 0; k < pictureList.size(); k++) {
                        if (pictureList.get(k) == a) {
                            pd++;
                        }
                    }
                    if (pd == 0) {
                        pictureList.add(a);
                        pd = -1;
                    }
                }
            }
            for(int kk = 0;kk < pictureList.size();kk++){
                    //1.定义sql语句
                    String sql = "insert into hotelpicturerelation(hotelId,picturePath,pictureOrder) values(?,?,?)";
                    template.update(sql,hotelInfoList.get(i).getHotelId(),String.valueOf(pictureList.get(kk))+".jpeg",kk+1);
            }
        }
    }
}