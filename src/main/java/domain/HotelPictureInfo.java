package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/3 10:32
 * @Description: 酒店图片关系
 */
public class HotelPictureInfo {
    private int hotelId;            //酒店id
    private String picturePath;     //图片路径
    private int order;              //图片顺序

    public HotelPictureInfo() {}

    public HotelPictureInfo(int hotelId, String picturePath, int order) {
        this.hotelId = hotelId;
        this.picturePath = picturePath;
        this.order = order;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "酒店图片关系{" +
                "酒店id=" + hotelId +
                ", 图片路径='" + picturePath + '\'' +
                ", 图片顺序=" + order +
                '}';
    }
}
