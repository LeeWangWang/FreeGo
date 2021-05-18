package dao.impl;

import dao.HotelInfoDao;
import domain.*;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class HotelInfoDaoImpl implements HotelInfoDao {
    JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    /*查询酒店
    * */
    @Override
    public List<HotelInfo> queryHotelInfoByLocate(int locateId) {
        UserInfo user = null;
        try {
            //1.定义sql语句
            String sql = "select * from user where userId = ?";
            //2.执行
            user = template.queryForObject(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), 1000);
        } catch (Exception e){
            System.out.println("根据用户手机号查询用户信息失败");
        }
        if (user != null){
            System.out.println(user.getUserSex());
        }else{
            System.out.println("读取失败");
        }
        return null;
    }

    public List<RoomInfo> queryAllRoomByHotelId(int hotelId){
        List<RoomInfo> roomList = new ArrayList<RoomInfo>();
        try {
            //1.定义sql语句
            String sql = "select * from room where hotelId = ?";
            //2.执行
            //roomListOne中放了一个酒店id下面的所有房间号
            roomList = template.query(sql, new BeanPropertyRowMapper<RoomInfo>(RoomInfo.class), hotelId);
        } catch (Exception e) {
            System.out.println("失败");
        }
        return roomList;
    }

    public List<Integer> queryRoomNumByHotelId(int hotelId, Date ruzhu, Date likai){
        List<RoomInfo> roomListOne = new ArrayList<RoomInfo>(); //每个酒店下面的总房间数
        List<RoomInfo> roomListTwo = new ArrayList<RoomInfo>(); //还有余额的房间
        List<RoomInfo> roomListEnd = new ArrayList<RoomInfo>(); //最后查询的房间数量
       /* 2.根据酒店id找到该酒店下面的总房间*/
        try {
            //1.定义sql语句
            String sql = "select * from room where hotelId = ?";
            //2.执行
            //roomListOne中放了一个酒店id下面的所有房间号
            roomListOne = template.query(sql, new BeanPropertyRowMapper<RoomInfo>(RoomInfo.class), hotelId);
        } catch (Exception e) {
            System.out.println("失败");
        }
        //有入住离开时间
        /*3.根据房间id去查找对应的日子又多少房间*/
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String begin = sdf.format(ruzhu);
        String end = sdf.format(likai);
        DateCalculator dc = new DateCalculator();
        List<String> dateList = dc.process(begin, end);
        //System.out.println("date:"+dateList.size());
        //System.out.println("one:"+roomListOne.size());
        List<Integer> intList = new ArrayList<Integer>();

        for (int m = 0; m < roomListOne.size(); m++) {  //酒店所拥有的房间数量
            //System.out.println("roomId"+roomListOne.get(m).getRoomName());
            int min = 2147483647;
            for (int n = 0; n < dateList.size(); n++) {   //一天
                RoomDateInfo room = null;
                try {
                    //1.定义sql语句
                    String sql = "select * from roomDate where roomId = ? and roomdate = ? and roomNum > ?";

                    /*找出对应的房间日期关系*/
                    //System.out.println("roomId:"+roomListOne.get(m).getRoomId()+" roomDate:"+ dateList.get(n));
                    room = template.queryForObject(sql, new BeanPropertyRowMapper<RoomDateInfo>(RoomDateInfo.class), roomListOne.get(m).getRoomId(), dateList.get(n), 0);
                    //System.out.println(room.getRoomId());
                    if(room.getRoomNum() <= min){
                        min = room.getRoomNum();
                    }
                }catch (Exception e) {
                    System.out.println("查询酒店-某时间-房间数量余额失败");
                }
            }
            intList.add(min);
        }
        return intList;
    }

    /*查一个酒店在规定时间内的可用房间实体*/
    public List<RoomInfo> queryOneHotelofRoomByHotelId(int hotelId, Date ruzhu, Date likai){
        List<RoomInfo> roomListOne = new ArrayList<RoomInfo>(); //每个酒店下面的总房间数
        List<RoomInfo> roomListTwo = new ArrayList<RoomInfo>(); //还有余额的房间
        List<RoomInfo> roomListEnd = new ArrayList<RoomInfo>(); //最后查询的房间数量
        /*2.根据酒店id找到该酒店下面的总房间*/
        try {
            //1.定义sql语句
            String sql = "select * from room where hotelId = ?";
            //2.执行
            //roomListOne中放了一个酒店id下面的所有房间号
            roomListOne = template.query(sql, new BeanPropertyRowMapper<RoomInfo>(RoomInfo.class), hotelId);
        } catch (Exception e) {
            System.out.println("失败");
        }
        //有入住离开时间
        /*3.根据房间id去查找对应的日子又多少房间*/
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String begin = sdf.format(ruzhu);
        String end = sdf.format(likai);
        DateCalculator dc = new DateCalculator();
        List<String> dateList = dc.process(begin, end);
        /*System.out.println("date:"+dateList.size());
        System.out.println("one:"+roomListOne.size());*/
        for (int n = 0; n < dateList.size(); n++) {   //一天
            for (int m = 0; m < roomListOne.size(); m++) {  //酒店所拥有的房间数量
                RoomInfo room = null;
                try {
                //1.定义sql语句
                String sql = "select * from room where roomId in" +
                        "(select roomId from roomDate where roomId = ? and roomdate = ? and roomNum > ?)";

                /*找出对应的房间日期关系*/
                //System.out.println("roomId:"+roomListOne.get(m).getRoomId()+" roomDate:"+ dateList.get(n));
                room = template.queryForObject(sql, new BeanPropertyRowMapper<RoomInfo>(RoomInfo.class), roomListOne.get(m).getRoomId(), dateList.get(n), 0);
                //System.out.println(room.getRoomId());
                roomListTwo.add(room);
                }catch (Exception e) {
                    System.out.println("查询酒店-某时间-房间数量余额失败");
                }
            }
        }
        /*for(int i = 0;i < roomListTwo.size();i++){
            System.out.println(roomListTwo.get(i).getRoomId());
        }*/
        for(int i = 0;i < roomListOne.size();i++){
            int pd = 0;
            for (int k = 0;k < roomListTwo.size();k++){
                if(roomListTwo.get(k).getRoomId() == roomListOne.get(i).getRoomId()) {
                    pd++;
                }
            }
            if(pd == dateList.size()){
                roomListEnd.add(roomListOne.get(i));
            }
        }
        for(int i = 0;i < roomListEnd.size();i++){
            System.out.println(roomListEnd.get(i));
        }
        return roomListEnd;
    }

    /*通过酒店id查询酒店所属房间     查询酒店房间第1方法*/
    public Map<Integer,List<RoomInfo>> queryHotelofRoomByHotelId(List<HotelInfo> hotelList, Date ruzhu, Date likai){
        Map<Integer,List<RoomInfo>> MapRoomList = new HashMap<Integer, List<RoomInfo>>();
        int hotelId;
        for (int i = 0;i < hotelList.size();i++) {
            /*1.找到酒店id*/
            hotelId = hotelList.get(i).getHotelId();
            List<RoomInfo> roomListOne = new ArrayList<RoomInfo>(); //每个酒店下面的总房间数
            List<RoomInfo> roomListTwo = new ArrayList<RoomInfo>(); //还有余额的房间
            List<RoomInfo> roomListEnd = new ArrayList<RoomInfo>(); //最后查询的房间数量
            /*2.根据酒店id找到该酒店下面的总房间*/
            try {
                //1.定义sql语句
                String sql = "select * from room where hotelId = ?";
                //2.执行
                //roomListOne中放了一个酒店id下面的所有房间号
                roomListOne = template.query(sql, new BeanPropertyRowMapper<RoomInfo>(RoomInfo.class), hotelId);
            } catch (Exception e) {
                System.out.println("失败");
            }
            //有入住离开时间
            if (ruzhu != null && likai != null) {
                /*3.根据房间id去查找对应的日子又多少房间*/
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String begin = sdf.format(ruzhu);
                System.out.println("begin"+begin);

                String end = sdf.format(likai);
                System.out.println("end"+end);
                DateCalculator dc = new DateCalculator();
                List<String> dateList = dc.process(begin, end);
                //System.out.println(dateList.size());
                int n = 0;  //日期循环
                int m = 0;  //roomListOne 循环
                for(int ii = 0;ii < dateList.size();ii++){
                    System.out.println(dateList.get(ii));
                }
                for (n = 0; n < dateList.size(); n++) {   //一天
                    RoomInfo room = null;
                    for (m = 0; m < roomListOne.size(); m++) {  //酒店所拥有的房间数量
//                        try {
                            //1.定义sql语句
                            String sql = "select * from room where roomId in" +
                                    "(select roomId from roomDate where roomId = ? and roomdate = ? and roomNum > ?)";
                            //2.执行
                            int j = 0;
                            for (; j < roomListOne.size(); j++) {
                                /*找出对应的房间日期关系*/
                                //System.out.println("roomId:"+roomListOne.get(m).getRoomId()+" roomDate:"+ dateList.get(n));
                                room = template.queryForObject(sql, new BeanPropertyRowMapper<RoomInfo>(RoomInfo.class), roomListOne.get(m).getRoomId(), dateList.get(n), 0);
                                //System.out.println(room.getRoomId());
                                roomListTwo.add(room);
                            }
                            //System.out.println(roomListTwo.size());
                        /*} catch (Exception e) {
                            System.out.println("查询酒店-某时间-房间数量余额失败");
                        }*/
                    }
                }
                //System.out.println("id为" + hotelList.get(i).getHotelId() + "的酒店有" + roomListTwo.size() + "间可用房子");
                int leijia = 0;
                int pd = 0;
            /*for(leijia = 0;leijia < roomListTwo.size();leijia++){
                System.out.println(roomListTwo.get(leijia).getRoomId());
            }*/
                for (; leijia < roomListTwo.size(); leijia++) {
                    for (pd = leijia + 1; pd < roomListTwo.size(); pd++) {
                        if (roomListTwo.get(leijia).getRoomId() == -1) {
                            break;
                        }
                        if (roomListTwo.get(leijia).getRoomId() == roomListTwo.get(pd).getRoomId()) {
                            roomListTwo.get(pd).setRoomId(-1);
                        }
                    }
                }
                for (leijia = 0; leijia < roomListTwo.size(); leijia++) {
                    if (roomListTwo.get(leijia).getRoomId() != -1) {
                        roomListEnd.add(roomListTwo.get(leijia));
                    }
                }
                //System.out.println("当前roomList为" + roomListEnd.size());
                MapRoomList.put(hotelList.get(i).getHotelId(), roomListEnd);
            } else {  //有时间为空
                MapRoomList.put(hotelList.get(i).getHotelId(),roomListOne);
            }
        }
        return MapRoomList;
    }
    public Map<Integer,List<RoomInfo>> queryHotelofRoomByHotelId(List<HotelInfo> hotelList){
        Map<Integer,List<RoomInfo>> MapRoomList = new HashMap<Integer, List<RoomInfo>>();
        int hotelId;
        for (int i = 0;i < hotelList.size();i++) {
            /*1.找到酒店id*/
            hotelId = hotelList.get(i).getHotelId();
            List<RoomInfo> roomListOne = new ArrayList<RoomInfo>(); //每个酒店下面的总房间数
            /*2.根据酒店id找到该酒店下面的总房间*/
            try {
                //1.定义sql语句
                String sql = "select * from room where hotelId = ?";
                //2.执行
                roomListOne = template.query(sql, new BeanPropertyRowMapper<RoomInfo>(RoomInfo.class), hotelId);
            } catch (Exception e) {
                System.out.println("失败");
            }
             //有时间为空
                MapRoomList.put(hotelList.get(i).getHotelId(),roomListOne);
            }
        return MapRoomList;
    }
    /*下面是推荐所用到的算法*/
    public List<UserInfo> queryAllOtherUser(int userId){
        List<UserInfo> userInfoList= new ArrayList<UserInfo>();
        try {
            //1.定义sql语句
            String sql = "select * from userprefer where userId <> ?";
            //2.执行
            //roomListOne中放了一个酒店id下面的所有房间号
            userInfoList = template.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class),userId);
        } catch (Exception e) {
            System.out.println("失败");
        }
        return userInfoList;
    }
    public List<List<HotelInfo>> queryUserLikeHotel(int userId){
        List<UserInfo> userAllOtherList = new ArrayList<UserInfo>();
        //找出userPrefer表中除了当前用户外的所有用户
        userAllOtherList = queryAllOtherUser(userId);
        return null;
    }
    public static void main(String[] args){
        HotelInfoDaoImpl impl = new HotelInfoDaoImpl();
        impl.insertAllRoom();
        /*HotelInfoDaoImpl ss = new HotelInfoDaoImpl();
        List<HotelInfo> sa = new ArrayList<HotelInfo>();
        HotelInfo a = new HotelInfo();
        a.setHotelId(1000);
        sa.add(a);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date likaiDate = null;
        java.util.Date ruzhuDate = null;

        try {
            likaiDate = formatter.parse("2021-05-01");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try {
            ruzhuDate = formatter.parse("2021-04-29");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        List<Integer> roomList = ss.queryRoomNumByHotelId(sa.get(0).getHotelId(),ruzhuDate,likaiDate);
        for(int i = 0;i < roomList.size();i++){
            System.out.println(roomList.get(i));
        }*/
        HotelInfoDaoImpl ss = new HotelInfoDaoImpl();
        System.out.println(ss.saveHotelOrderInfo(1,1,null,"1","1","1","1","1","1","1","1","2021-05-16","2021-05-20","1",1));
    }
    public boolean saveHotelOrderInfo(int userId,int hotelId,List<String> ruzhuList,String xingming,String phone,String youxiang
        ,String shijian,String teshuyaoqiu,String fapiaoleixing,String taitou,String nasuirenshibiehao,String moveInTime
        ,String departureTime,String isNotDepartmentTime,int roomId){
        Boolean isSuccess = true;
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String order = formatter.format(calendar.getTime());
        order = order + "_" +userId;
        //System.out.println(order);
        int addResult = 0;
        /*try {*/
            String sql = "INSERT INTO hotelorder(orderId,userId,hotelId,moveIntoTime,departureTime,arrivalTime,"
                    +"specialRequirement,contactName,contactTele,contactEmail,invoiceTitle," +
                    "invoiceType,TaxpaperNumber,isNotDepartmentTime,nowState,isFreeUnsubscribe)" +
                    " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            jdbcTemplate.update(sql,order,userId,hotelId,moveInTime,departureTime,shijian,teshuyaoqiu,xingming,phone,
                    youxiang,taitou,fapiaoleixing,nasuirenshibiehao,isNotDepartmentTime,"ok","no");
        /*}catch (Exception e){
            isSuccess = false;
            return isSuccess;
        }*/
        /*try{*/
            sql = "INSERT INTO hotelordercheckin VALUES(?,?,?);";
            for(int i = 0;i < ruzhuList.size();i++) {
                jdbcTemplate.update(sql, order, roomId, ruzhuList.get(i));
            }
        /*}catch (Exception e){
            isSuccess = false;
            return isSuccess;
        }*/
        return isSuccess;
    }

    /*queryHotelofRoomByHotelId 的测试函数*/
    /*public void queryHotelofRoomByHotelIdTest(){
        HotelInfoDaoImpl ss = new HotelInfoDaoImpl();
        Map<Integer,List<RoomInfo>> mapList = new HashMap<Integer, List<RoomInfo>>();
        List<HotelInfo> hotelList = new ArrayList<HotelInfo>();
        for(int i = 0;i < 4;i++){
            HotelInfo hotel  = new HotelInfo(1000+i);
            hotelList.add(hotel);
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date ruzhu = sdf.parse("2021-04-22");
        Date likai =  sdf.parse("2021-04-23");
        mapList = ss.queryHotelofRoomByHotelId(hotelList,ruzhu,likai);
        List<RoomInfo> roomList= mapList.get(1003);
        for(int i = 0;i < roomList.size();i++){
            System.out.println(roomList.get(i).getRoomId());
        }
    }
*/
    /*为数据库中的房间添加每日的房间数量数据*/
    public void insertAllRoomDate() throws ParseException {
        int i = 0;
        int j = 0;
        for (;i < 2000;i++){
            for(j = 1;j <= 30;j++) {
                String sql = "insert into roomdate values(?,?,?)";
                String string = "2021-6-"+j;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date date = sdf.parse(string);
                if(i % 2 ==0){//单人间
                    template.update(sql,i,string,20);
                }else{//双刃剑
                    template.update(sql,i,string,10);
                }
            }
        }
        //template.update(sql,0,date,10);
        /*RoomDateInfo roomdate = new RoomDateInfo();
        //1.定义sql语句
        String sql = "select * from roomdate where roomId = ?";
        //2.执行
        roomdate = template.queryForObject(sql, new BeanPropertyRowMapper<RoomDateInfo>(RoomDateInfo.class), 0);
        if (roomdate != null){
            System.out.println(roomdate.toString());
        }else{
            System.out.println("读取失败");
        }*/
    }
    @Override
    public List<HotelInfo> recommendHotel(String userInput) {
        List<HotelInfo> hotelList = null;
       try {
            //1.定义sql语句
            String sql = "select * from hotel where hotelName like ?";
            //2.执行
            hotelList = template.query(sql, new BeanPropertyRowMapper<HotelInfo>(HotelInfo.class), "%"+userInput+"%");
        } catch (Exception e){
            System.out.println("根据用户手机号查询用户信息失败");
        }
        if (hotelList.size() != 0){
            //System.out.println(hotelList.size());
            //System.out.println(hotelList.get(0).toString());
            return hotelList;
        }else{
            System.out.println("读取失败");
        }
        return null;
    }
    public static Boolean judgeNewUser(int userId){
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        List<UserPreferInfo> userperfer = new ArrayList<UserPreferInfo>();
        try{
            String sql = "select * from userprefer where userId = ?";
            //2.执行
            userperfer = template.query(sql, new BeanPropertyRowMapper<UserPreferInfo>(UserPreferInfo.class),userId);
        }catch (Exception e) {
            System.out.println("查询用户偏爱表失败");
        }
        int k = 0;
        for(int i = 0;i < userperfer.size();i++){
            if(userperfer.get(i).getPreferWeight()!=0){
                k++;
            }
        }
        if(k!=0){//老用户
            return false;
        }else{//新用户
            return true;
        }
    }

    /*为数据库中的房间添加数据*/
    public void insertAllRoom(){
        String sql = "insert into room(roomId,hotelId,roomName,peopleLimite,roomPrice,roomInform,flag,relateService) values(?,?,?,?,?,?,?,?)";
        int i = 1000;//酒店id
        int j = 0;   //房间id

        for (;i < 2000;i++) {
            template.update(sql,j,i,"单人房",1,100,"优秀的单人间",false,"");
            j++;
            template.update(sql,j,i,"双人房",2,180,"优秀的双人间",false,"");
            j++;
        }
    }
    public HotelInfo queryOneHotel(int hotelId){
        HotelInfo hotel = new HotelInfo();
        try{
            //1.定义sql语句
            String sql = "select * from Hotel where hotelId = ?";
            //2.执行
            hotel = template.queryForObject(sql, new BeanPropertyRowMapper<HotelInfo>(HotelInfo.class), hotelId);
        }catch (Exception e){
            System.out.println("根据用户手机号查询用户信息失败");
        }
        return hotel;
    }
    @Override
    public List<HotelPictureInfo> queryHotelPicture(int hotelId) {
        return null;
    }

    @Override
    public Boolean queryIsCollectHotel(int userId, int hotelId) {
        return null;
    }

    @Override
    public Boolean setHotelCollect(int userId, int hotelId) {
        return null;
    }

    @Override
    public Boolean setHotelNotCollect(int userId, int hotelId) {
        return null;
    }

    @Override
    public List<HotelInfo> queryHotelInfoById(int hotelId) {
        return null;
    }

    @Override
    public List<HotelCommentInfo> queryHotelComment(int hotelId) {
        return null;
    }

    @Override
    public HotelCommentPictureInfo queryHotelCommentPicture(int hotelId) {
        return null;
    }

    @Override
    public List<RoomInfo> queryRoom(int hotelId, String arriveTime, String departmentTimes) {
        return null;
    }


    @Override
    public List<RoomDateInfo> queryTheTimeRoom(int hotelId, String checkInDate, String departureDate) {
        return null;
    }

    public List<String> queryHotelInPicture(int hotelId){
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        List<String> pList = new ArrayList<String>();
        List<HotelPictureRelationInfo> ppList = new ArrayList<HotelPictureRelationInfo>();
        try{
            //1.定义sql语句
            String sql = "select * from hotelpicturerelation where hotelId = ?";
            //2.执行
            ppList = template.query(sql, new BeanPropertyRowMapper<HotelPictureRelationInfo>(HotelPictureRelationInfo.class), hotelId);
        }catch (Exception e){
            System.out.println("查询酒店对应的照片");
        }
        for(int i = 0;i < ppList.size();i++){
            pList.add(ppList.get(i).getPicturePath());
        }
        return pList;
    }
    @Override
    public int addHotelComment(HotelCommentInfo comment) {
        String sql;
        int addResult = 0;
        sql = "INSERT INTO hotelcomment VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        addResult = jdbcTemplate.update(sql
                ,comment.getCommentId()
                ,comment.getParentId()
                ,comment.getUserId()
                ,comment.getHotelId()
                ,comment.getParentCommentId()
                ,comment.getCommentWord()
                ,comment.getCleanScore()
                ,comment.getAllScore()
                ,comment.getLocateScore()
                ,comment.getServiceScore()
                ,comment.getFacilitiesScore()
                ,comment.getComfortScore()
                ,comment.getEatScore()
                ,comment.getFlag());
        /*返回最近一次插入数据的id*/
        sql = "SELECT LAST_INSERT_ID();";
        addResult = jdbcTemplate.queryForObject(sql,Integer.class);
        return addResult;
    }

    @Override
    public int addHotelCommentPicture(int userId, int hotelCommentId, List<String> picturePathList) throws Exception {
        String sql;
        int addResult = 0;
        for (int i = 0; i < picturePathList.size(); i++) {
            sql = "INSERT INTO hotelcommentpicture VALUES(?,?,?);";
            addResult = jdbcTemplate.update(sql, hotelCommentId, picturePathList.get(i), i);
        }
        return addResult;
    }


    @Override
    public Boolean saveHotelOrderInfo(HotelOrderInfo hotelOrder) {
        return null;
    }

    @Override
    public HotelOrderInfo queryHotelOrderById(String orderId) {
        return null;
    }

    @Override
    public HotelPictureInfo queryHotelPictureById(int hotelId) {
        return null;
    }

    @Override
    public Boolean updateHotelOrder(String OrderId) {
        return null;
    }

    @Override
    public List<HotelInfo> queryCollectedHotelInfoByUserId(int userId) {
        return null;
    }

    @Override
    public List<HotelOrderInfo> queryHotelOrderInfo(int userId) {
        return null;
    }

    @Override
    public int increaseUserPreferHotel(int userId, int hotelId, float weight) throws Exception {
        String sql;
        sql = "UPDATE userprefer SET preferWeight = preferWeight+? where( userId = ? and tagId IN (SELECT tagId FROM taglink where type = '酒店' and linkId = ?));";
        int result = jdbcTemplate.update(sql,weight,userId,hotelId);
        return result;
    }

    @Override
    public int decreaseUserPreferHotel(int userId, int hotelId, float weight) throws Exception {
        String sql;
        sql = "UPDATE userprefer SET preferWeight = preferWeight-? where( userId = ? and tagId IN (SELECT tagId FROM taglink where type = '酒店' and linkId = ?));";
        int result = jdbcTemplate.update(sql,weight,userId,hotelId);
        return result;
    }

    @Override
    public int collectHotel(int userId, int hotelId) throws Exception {
        String sql;
        sql = "INSERT INTO hotelcollect VALUES(?,?);";
        int result=0;
        result = jdbcTemplate.update(sql,hotelId,userId);
        return result;
    }

    @Override
    public int disCollectHotel(int userId, int hotelId) throws Exception {
        String sql;
        sql = "DELETE FROM hotelcollect WHERE (hotel = ? and userId = ?);";
        int result=0;
        result = jdbcTemplate.update(sql,hotelId,userId);
        return result;
    }
   /* public static void updateImg(){
        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
        List<HotelInfo> hotelList = new ArrayList<HotelInfo>();
        try {
            //1.定义sql语句
            String sql = "select * from hotel ";
            //2.执行
            hotelList = template.query(sql, new BeanPropertyRowMapper<HotelInfo>(HotelInfo.class));
        }catch (Exception e){
            System.out.println("根据用户手机号查询用户信息失败");
        }

        int random = 0;
        for(int i = 0;i < hotelList.size();i++){
            random = (int)(random() * 48 + 1);
            try{
                String sql = "update hotel set overPicture = ? where hotelId = ?";
                int result = template.update(sql,random,hotelList.get(i).getHotelId());
            }catch (Exception e) {
                System.out.println("失败");
            }
        }
    }*/
}
