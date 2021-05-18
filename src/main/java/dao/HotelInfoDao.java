package dao;


import domain.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface HotelInfoDao {
    /**
    * @Author:  李旺旺
    * @Date:    2021/3/31 20:49
    * @param:   [locateId]
    * @Description: 系统根据位置编号locateId查询酒店信息表（HotelList）、酒店图片关系表（HotelPictureRelationList）,
    *               查询成功返回酒店信息实例集合List<HotelInfo>,若查询失败，返回 null。
    */
    List<HotelInfo> queryHotelInfoByLocate(int locateId);

    /**
     * 通过用户的输入查找该酒店在一个时间段内的房间数
     *
     * @param hotelList
     * @param
     * @return Map<Integer,List<RoomDateInfo>> 酒店id对应的房间数量
     */
    public Map<Integer,List<RoomInfo>> queryHotelofRoomByHotelId(List<HotelInfo> hotelList, Date ruzhu, Date likai);
    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 10:26
    * @param:   [userId]
    * @Description: 根据用户输入从用户偏好表（UserPreferList）、酒店信息表（HotelList）中查询酒店信息，生成酒店信息HotelInfo的实例集合并返回。
    */
    List<HotelInfo> recommendHotel(String userId);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 10:35
    * @param:   [hotelId]
    * @Description: 根据酒店id从酒店信息表（HotelPictureRelation）中查询酒店和图片关系，生成酒店图片关系HotelPictureRelationInfo的实例集合。
    */
    List<HotelPictureInfo> queryHotelPicture(int hotelId);

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 10:48
     * @param:   [userId, hotelId]
     * @Description: 根据用户id和酒店id查询酒店收藏表（HotelCollectList）若里面存在匹配的数据返回true，若没有返回false。
     */
    Boolean queryIsCollectHotel(int userId, int hotelId);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 10:37
    * @param:   [userId, hotelId]
    * @Description: 系统把用户id和酒店id写入酒店收藏表（HotelCollectList），若成功写入返回true，若写入失败，返回false。
    */
    Boolean setHotelCollect(int userId, int hotelId);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 10:37
    * @param:   [userId, hotelId]
    * @Description: 系统通过用户id和酒店id查找酒店收藏表（HotelCollectList）,查找到后删除该记录并返回true，若没有查找到或删除失败则返回false。
    */
    Boolean setHotelNotCollect(int userId, int hotelId);

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/2 16:41
     * @param:   [hotelId]
     * @Description: 根据酒店id从酒店信息表（HotelList）中查询酒店信息，生成HotelInfo的实例集合并返回。
     */
    List<HotelInfo> queryHotelInfoById(int hotelId);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 10:39
    * @param:   [hotelId]
    * @Description: 根据酒店id从酒店评论表（HotelCommentList）中查询与该酒店id有关的所有评论的文字部分，生成HotelCommentInfo实例集合并返回。
    */
    List<HotelCommentInfo> queryHotelComment(int hotelId);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 10:44
    * @param:   [hotelId]
    * @Description: 根据酒店评论实例中的评论id从酒店评论图片关系表（HotelCommentPictureRelationList）中查询与该评论有关所有图片关系，
                    每条评论生成一个HotelCommentPictureRelationInfo实例。
    */
    HotelCommentPictureInfo queryHotelCommentPicture(int hotelId);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 19:20
    * @param:   [hotelId, arriveTime, departmentTimes]
    * @Description: 根据酒店id，到达时间、离开时间从房间信息表（RoomList）和房间日期表（RoomDate）中查询与该酒店id有关的所有房间，生成RoomInfo实例集合并返回。
    */
    List<RoomInfo> queryRoom(int hotelId, String arriveTime, String departmentTimes);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 19:28
    * @param:   [hotelId, checkInDate, departureDate]
    * @Description: 根据酒店id、入住日期、离开日期房间读取房间信息表（RoomList）利用房间id查询房间日期表（RoomDateList）将在入住日期和离开日期中仍有剩余的房间展示出来，
    *               产生RoomDetailInfo实例集合并返回。
    */
    List<RoomDateInfo> queryTheTimeRoom(int hotelId, String checkInDate, String departureDate);


    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 14:47
     * @param:   [hotelOrder]
     * @Description: 系统通过将用户的输入打包为酒店订单实体保存进酒店订单表（HotelOrderList），酒店订单房间关系表（HotelOrderRoomRelationList）、
     *               房间日期表（RoomDateList）若成功保存返回true，若保存失败返回false。
     */
    Boolean saveHotelOrderInfo(HotelOrderInfo hotelOrder);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 14:52
    * @param:   [orderId]
    * @Description: 系统根据订单id查询酒店订单表（hotelOrderList），生成Order实体并返回。
    */
    HotelOrderInfo queryHotelOrderById(String orderId);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 14:54
    * @param:   [hotelId]
    * @Description: 系统酒店id查询酒店图片关系表（HotelPictureRelationList），查询与该酒店相关顺序为1的图片，查询该酒店的图片关系实例并返回。
    */
    HotelPictureInfo queryHotelPictureById(int hotelId);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 14:55
    * @param:   [OrderId]
    * @Description: 系统根据订单id修改酒店订单表（HotelOrderList）该订单状态为退订，更新房间日期表（RoomDateList）、酒店订单房间联系表（HotelOrderRoomRelationList）
    *               将原来预定出去的房间解除。若退订成功返回true，若退订失败返回false。
    */
    Boolean updateHotelOrder(String OrderId);

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/3 10:27
     * @param:   [userId]
     * @Description: 系统根据用户id查询酒店收藏表（HotelColletedList）,返回酒店id列表，根据酒店id查询酒店信息表（HotelList），返回HotelInfo实例集合，若查询失败，返回null。
     */
    List<HotelInfo> queryCollectedHotelInfoByUserId(int userId);

    /**
    * @Author:  李旺旺
    * @Date:    2021/4/3 14:58
    * @param:   [userId]
    * @Description: 系统根据用户编号userId查询酒店订单表（HotelOrderInfoList）、酒店图片关系表（HotelPictureRelationList），查询该用户所有的酒店订单，
    *               查询成功返回酒店订单实例集合List<HotelOrderInfo>,若查询失败，返回 null。
    */
    List<HotelOrderInfo> queryHotelOrderInfo(int userId);

    //关于景点的偏好的修改
    int increaseUserPreferHotel(int userId, int hotelId, float weight)throws Exception;
    int decreaseUserPreferHotel(int userId, int hotelId, float weight)throws Exception;
    //收藏景点
    int collectHotel(int userId, int hotelId)throws Exception;
    //取消收藏景点
    int disCollectHotel(int userId, int hotelId)throws Exception;
    //添加评论
    int addHotelComment(HotelCommentInfo hotelCommentInfo)throws Exception;
    //添加评论的图片
    int addHotelCommentPicture(int userId, int hotelCommentId, List<String> picturePathList)throws Exception;
}
