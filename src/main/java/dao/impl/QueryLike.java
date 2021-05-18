package dao.impl;/**
 * 一些声明信息
 * Description: <br/>
 * date: 2021/5/1 21:20<br/>
 *
 * @author hp<br />
 * @version
 * @since JDK 1.8
 */

import domain.HotelInfo;
import domain.TagInfo;
import domain.UserInfo;
import domain.UserPreferInfo;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import java.text.ParseException;
import java.util.*;

import static dao.impl.HotelInfoDaoImpl.judgeNewUser;

/**
 * ClassName: QueryLike <br/>
 * Description: <br/>
 * date: 2021/5/1 21:20<br/>
 * @author hp<br />
 */
public class QueryLike {
    /*
        1.先判断该用户是不是新用户
            1.1若是新用户：随机推荐23个分类中的6个分类最高的6条
            1.2若不是新用户进入2.
        2.找出最相近的6个人
            2.1若喜欢的方向>=6 找出留个人中最喜欢的前6个方向
            2.2若喜欢的方向<6 找出当前已拥有的x个方向 并随机分配6-x个方向
        * */
    public static Map<String, List<HotelInfo>> queryLike(int userId){
            Boolean pd = judgeNewUser(userId);
            Map<String,List<HotelInfo>> listHotel = new HashMap<String,List<HotelInfo>>();
            if(pd == true){ //新用户
                listHotel = recommendNewUser();
            }else{//老用户
                listHotel = recommendOldUser(userId);
            }
            return listHotel;
    }

    public static Map<String,List<HotelInfo>> recommendNewUser(){
        return null;
    }

    //找出6个与登录id相似的人
    public static List<Integer> likeUserSix(int userId){
        List<UserInfo> userList = new ArrayList<UserInfo>();  //除该用户外的所有用户
        List<UserPreferInfo> userNowPrefer = new ArrayList<UserPreferInfo>();//该用户的偏爱
        List<UserPreferInfo> userOtherPrefer = new ArrayList<UserPreferInfo>();//其他用户的偏爱
        List<Integer> userListSix = new ArrayList<Integer>();  //选出的6个人

        float NowUserGenfang = 0;
        float otherUserGenfang = 0;
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        Map<Integer,Float> suoyouList = new HashMap<Integer,Float>();
        //除了该用户以外的所有用户
        try{
            String sql = "select * from user where userId <> ?";
            //2.执行
            userList = template.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class),userId);
            //System.out.println("userList:"+userList.size()+"first"+userList.get(0).getUserId());
        }catch(Exception e){
            System.out.println("查询用户偏爱表失败");
        }
        try{
            String sql = "select * from userprefer where userId = ?";
            //2.执行
            userNowPrefer = template.query(sql, new BeanPropertyRowMapper<UserPreferInfo>(UserPreferInfo.class),userId);
        }catch(Exception e){
            System.out.println("查询用户偏爱表失败");
        }
        //获取登录用户的根方
        for(int i = 0;i < userNowPrefer.size();i++){
            NowUserGenfang += (userNowPrefer.get(i).getPreferWeight()*userNowPrefer.get(i).getPreferWeight());
        }
        NowUserGenfang = (float)Math.sqrt(NowUserGenfang);

        //计算登录用户与其他用户的
        for(int i = 0;i < userList.size();i++){
            try{
                String sql = "select * from userprefer where userId = ?";
                //2.执行
                userOtherPrefer = template.query(sql, new BeanPropertyRowMapper<UserPreferInfo>(UserPreferInfo.class),userList.get(i).getUserId());
            }catch(Exception e){
                System.out.println("查询用户偏爱表失败");
            }
            float jiazhi = 0;
            for(int j = 0;j < userNowPrefer.size();j++){
                for(int k = 0;k < userOtherPrefer.size();k++){
                    if(userNowPrefer.get(j).getTagId() == userOtherPrefer.get(k).getTagId()){
                        jiazhi += (userNowPrefer.get(j).getPreferWeight()*userOtherPrefer.get(k).getPreferWeight());
                        break;
                    }
                }
            }
            //获取其他用户的根方
            otherUserGenfang = 0;
            for(int l = 0;l < userNowPrefer.size();l++){
                otherUserGenfang += (userOtherPrefer.get(l).getPreferWeight()*userOtherPrefer.get(l).getPreferWeight());
                //System.out.println("otherUserGenfang:"+otherUserGenfang);
            }
            otherUserGenfang = (float) Math.sqrt(otherUserGenfang);
            suoyouList.put(userList.get(i).getUserId(),(jiazhi)/(NowUserGenfang*otherUserGenfang));
        }
        /*for(Integer key:suoyouList.keySet()) {
            System.out.println("key:" + key + " " + "Value:" + suoyouList.get(key));
        }*/
        ArrayList<Map.Entry<Integer, Float>> entryArrayList = new ArrayList<>(suoyouList.entrySet());
        Collections.sort(entryArrayList, new Comparator<Map.Entry<Integer, Float>>() {
            @Override
            public int compare(Map.Entry<Integer, Float> o1, Map.Entry<Integer, Float> o2) {
                return (int)((o2.getValue()-o1.getValue())*100000000);
            }
        });
        int pd = 0;
        for (Map.Entry<Integer, Float> entry : entryArrayList) {
            System.out.println("相似用户"+entry.getKey()+"="+entry.getValue()+"      ");
            pd++;
            userListSix.add(entry.getKey());
            if(pd == 6){
                break;
            }
        }
        return userListSix;
    }




    /*
    * 给老用户推荐酒店*/
    public static Map<String,List<HotelInfo>> recommendOldUser(int userId){
        List<Integer> userListSix = new ArrayList<Integer>();  //选出的6个人
        List<Integer> tagListSix = new ArrayList<Integer>();   //选出6个tag
        Map<String,List<HotelInfo>> returnMap = new HashMap<String,List<HotelInfo>>();
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        Map<Integer,Float> numMap = new HashMap<Integer,Float>();

        Integer num = 0;
        userListSix = likeUserSix(userId);
        try{
            for(int i = 0;i < userListSix.size();i++){
                List<UserPreferInfo> nowList = new ArrayList<UserPreferInfo>();
                String sql = "select * from userprefer where userId = ?";
                //2.执行
                nowList = template.query(sql, new BeanPropertyRowMapper<UserPreferInfo>(UserPreferInfo.class),
                        userListSix.get(i));
                for(int j = 0;j < nowList.size();j++){
                    if(numMap.containsKey(nowList.get(j).getTagId())){  //存在
                        //System.out.print("当前Tag是"+nowList.get(j).getTagId());
                        numMap.put(nowList.get(j).getTagId(),numMap.get(nowList.get(j).getTagId())+nowList.get(j).getPreferWeight());
                        //System.out.println("  tag:"+nowList.get(j).getTagId()+" value:"+numMap.get(nowList.get(j).getTagId()));
                    }else{
                        //System.out.println("!!");
                        numMap.put(nowList.get(j).getTagId(), nowList.get(j).getPreferWeight());
                    }
                }
            }
        }catch (Exception e) {
            System.out.println("查询tag数量失败");
        }
        ArrayList<Map.Entry<Integer, Float>> entryArrayList = new ArrayList<>(numMap.entrySet());
        Collections.sort(entryArrayList, new Comparator<Map.Entry<Integer, Float>>() {
            @Override
            public int compare(Map.Entry<Integer, Float> o1, Map.Entry<Integer, Float> o2) {
                return (int)((o2.getValue()-o1.getValue())*100000000);
            }
        });
        int pd = 0;
        for (Map.Entry<Integer, Float> entry : entryArrayList) {
            //System.out.println("tag:"+entry.getKey()+"="+entry.getValue()+"      ");
            pd++;
            tagListSix.add(entry.getKey());
            if(pd == 6){
                break;
            }
        }
        /////////////////////已经将6个用户喜欢的方向进行了排序
        //System.out.println("共有"+numMap.size()+"个tag");
        if(pd < 6){  //数量不够

        }else{  //数量够
            try{
                for(int i = 0;i < tagListSix.size();i++) {
                    List<HotelInfo> hotelList = new ArrayList<HotelInfo>();
                    List<HotelInfo> toHotelList = new ArrayList<HotelInfo>();
                    String sql = "select * from hotel where hotelId in (select hotelId from hotelcollect " +
                            "where userId in(?,?,?,?,?,?) and hotelId in(select linkid from taglink where tagId = ?))";
                    //2.执行
                    hotelList = template.query(sql, new BeanPropertyRowMapper<HotelInfo>(HotelInfo.class), userListSix.get(0),
                            userListSix.get(1),
                            userListSix.get(2),
                            userListSix.get(3),
                            userListSix.get(4),
                            userListSix.get(5),
                            tagListSix.get(i));
                    if(hotelList.size() > 6){
                        for(int k = 0;k < 6;k++){
                            toHotelList.add(hotelList.get(k));
                        }
                    }else{
                        toHotelList = hotelList;
                    }
                    sql = "select * from tag where tagId = ?";
                    //2.执行
                    TagInfo tag = template.queryForObject(sql, new BeanPropertyRowMapper<TagInfo>(TagInfo.class),tagListSix.get(i));
                    returnMap.put(tag.getTagName(),toHotelList);
                    //System.out.println(returnMap.size());
                    }
                }catch (Exception e) {
                System.out.println("for");
            }
        }
        return returnMap;
    }
    public static void main(String[] args) throws ParseException {
        Map<String,List<HotelInfo>> returnMap = queryLike(1006);
        //System.out.println(returnMap.size());
        Iterator<Map.Entry<String,List<HotelInfo>>> it = returnMap.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry<String,List<HotelInfo>> entry = it.next();
            //System.out.println("key:"+entry.getKey()+"  key:"+entry.getValue());
        }
    }
}

