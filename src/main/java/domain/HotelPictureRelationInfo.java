package domain;/**
 * 一些声明信息
 * Description: <br/>
 * date: 2021/4/30 16:33<br/>
 *
 * @author hp<br />
 * @version
 * @since JDK 1.8
 */

/**
 * ClassName: HotelPictureRelationInfo <br/>
 * Description: <br/>
 * date: 2021/4/30 16:33<br/>
 * @author hp<br />
 */
public class HotelPictureRelationInfo {
    private int hotelId;
    private String picturePath;
    private int order;

    public HotelPictureRelationInfo() {
    }

    public HotelPictureRelationInfo(int hotelId, String picturePath, int order) {
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
        return "HotelPictureRelationInfo{" +
                "hotelId=" + hotelId +
                ", picturePath='" + picturePath + '\'' +
                ", order=" + order +
                '}';
    }
}
