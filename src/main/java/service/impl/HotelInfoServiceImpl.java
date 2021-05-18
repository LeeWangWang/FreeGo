package service.impl;

import dao.HotelInfoDao;
import dao.impl.HotelInfoDaoImpl;
import domain.HotelCommentInfo;
import domain.HotelInfo;
import domain.RoomInfo;
import service.HotelInfoService;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:28
 * @Description:
 */

public class HotelInfoServiceImpl implements HotelInfoService {
    private HotelInfoDao hotelInfoDao;
    public HotelInfoServiceImpl(){}
    public HotelInfoServiceImpl(HotelInfoDao hotelInfoDao){
        this.hotelInfoDao = hotelInfoDao;
    }

    @Override
    public List<HotelInfo> recommendHotel(String userInput) {
        HotelInfoDaoImpl Impl = new HotelInfoDaoImpl();
        return Impl.recommendHotel(userInput);
    }

    @Override
    public Map<Integer,List<RoomInfo>> queryHotelofRoomByHotelId(List<HotelInfo> hotelList, Date ruzhu, Date likai){
        HotelInfoDaoImpl impl = new HotelInfoDaoImpl();
        return impl.queryHotelofRoomByHotelId(hotelList,ruzhu,likai);
    }
    @Override
    public Map<Integer,List<RoomInfo>> queryHotelofRoomByHotelId(List<HotelInfo> hotelList){
        HotelInfoDaoImpl impl = new HotelInfoDaoImpl();
        return impl.queryHotelofRoomByHotelId(hotelList);
    }

    //收藏酒店
    @Override
    public int collectHotel(String userIdStr, String hotelIdStr) {
        int collectResult = 0;
        int preferResult = 0;
        int userId = Integer.parseInt(userIdStr);
        int hotelId = Integer.parseInt(hotelIdStr);
        try {
            collectResult = hotelInfoDao.collectHotel(userId,hotelId);
            return collectResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            preferResult = hotelInfoDao.increaseUserPreferHotel(userId,hotelId,(float)0.5);
            return preferResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

   //取消收藏行为
    @Override
    public int disCollectHotel(String userIdStr, String hotelIdStr) {
        int disCollectResult = 0;
        int preferResult = 0;
        int userId = Integer.parseInt(userIdStr);
        int hotelId = Integer.parseInt(hotelIdStr);
        try {
            disCollectResult = hotelInfoDao.disCollectHotel(userId,hotelId);
            return disCollectResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            preferResult = hotelInfoDao.decreaseUserPreferHotel(userId,hotelId,(float)0.5);
            return preferResult;
        }catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
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
                            List<String> HotelCommentPictureList) {

        int addCommentResult=0,addCommentPictureResult=0,dealPreferResult=0;
        int parentId = Integer.parseInt(parentIdStr);
        int parentCommentId = Integer.parseInt(parentCommentIdStr);
        int hotelId = Integer.parseInt(hotelIdStr);
        int userId = Integer.parseInt(userIdStr);
        int cleanScore = Integer.parseInt(cleanScoreStr);
        int allScore = Integer.parseInt(allScoreStr);
        int locateScore = Integer.parseInt(locateScoreStr);
        int serviceScore = Integer.parseInt(serviceScoreStr);
        int facilitiesScore = Integer.parseInt(facilitiesScoreStr);
        int comfortScore = Integer.parseInt(comfortScoreStr);
        int eatScore = Integer.parseInt(eatScoreStr);

        //添加评论
        try {
            HotelCommentInfo hotelCommentInfo = new HotelCommentInfo(0,parentId,parentCommentId,userId,hotelId,
                    commentText,allScore,locateScore,cleanScore,facilitiesScore, serviceScore,comfortScore,
                    eatScore,false);
            addCommentResult = hotelInfoDao.addHotelComment(hotelCommentInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //添加评论的图片
        try {
            addCommentResult = hotelInfoDao.addHotelCommentPicture(userId,0,HotelCommentPictureList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //更新
        try {
            if(allScore==1){
                dealPreferResult = hotelInfoDao.decreaseUserPreferHotel(userId,hotelId,(float)0.8);
            }
            if(allScore==2){
                dealPreferResult = hotelInfoDao.decreaseUserPreferHotel(userId,hotelId,(float)0.4);
            }
            if(allScore==3){
                dealPreferResult = hotelInfoDao.increaseUserPreferHotel(userId,hotelId,(float)0.1);
            }
            if(allScore==4){
                dealPreferResult = hotelInfoDao.increaseUserPreferHotel(userId,hotelId,(float)0.4);
            }
            if(allScore==5){
                dealPreferResult = hotelInfoDao.increaseUserPreferHotel(userId,hotelId,(float)0.8);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    //评论景点这个行为
    public int commentScenic(String parentIdStr
            ,String parentCommentIdStr
            ,String userIdStr
            ,String scenicIdStr
            ,String scenicGradeStr
            ,String commentText
            ,String scenicCommentStateStr
            ,List<String> hotelCommentPictureList){
        return 0;
    }

}
