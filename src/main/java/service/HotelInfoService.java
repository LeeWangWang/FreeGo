package service;

import domain.HotelInfo;
import domain.RoomInfo;


import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:28
 * @Description:
 */
public interface HotelInfoService {
    /**
     * 根据用户输入的地点去查找名字中带用户输入的酒店
     * @param userInput
     * @return
     */
    public List<HotelInfo> recommendHotel(String userInput);

    /**
     * ruzhu：入住时间
     * likai：离开时间
     * hotelList：只名字符合的酒店列表
     * @param hotelList
     * @param ruzhu
     * @param likai
     * @return
     */
    public Map<Integer,List<RoomInfo>> queryHotelofRoomByHotelId(List<HotelInfo> hotelList, Date ruzhu, Date likai);
    public Map<Integer,List<RoomInfo>> queryHotelofRoomByHotelId(List<HotelInfo> hotelList);

    public int collectHotel(String userIdStr, String hotelIdStr);

    public int disCollectHotel(String userIdStr, String hotelIdStr);

    public int commentHotel(String parentIdStr,
                            String userIdStr,
                            String hotelIdStr,
                            String parentCommentIdStr,
                            String commentText,
                            String cleanScoreStr,
                            String allScoreStr,
                            String locateScoreStr,
                            String serviceScoreStr,
                            String facilitiesScoreStr,
                            String comfortScoreStr,
                            String eatScoreStr,
                            String HotelCommentStateStr,
                            List<String> HotelCommentPictureList);
}
