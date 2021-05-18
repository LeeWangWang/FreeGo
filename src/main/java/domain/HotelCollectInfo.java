package domain;/**
 * 一些声明信息
 * Description: <br/>
 * date: 2021/4/28 16:04<br/>
 *
 * @author hp<br />
 * @version
 * @since JDK 1.8
 */

/**
 * ClassName: HotelCollectInfo <br/>
 * Description: <br/>
 * date: 2021/4/28 16:04<br/>
 * @author hp<br />
 */
public class HotelCollectInfo {
    private int hotelId;
    private int userId;

    public HotelCollectInfo(int hotelId, int userId) {
        this.hotelId = hotelId;
        this.userId = userId;
    }

    public HotelCollectInfo() {
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
