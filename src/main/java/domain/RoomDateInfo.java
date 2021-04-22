package domain;

import org.joda.time.DateTime;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/3 19:27
 * @Description: 剩余房间实例信息
 */
public class RoomDateInfo {
    private int roomId;         //房间Id
    private DateTime roomdate;  //房间日期
    private int roomNum;        //剩余房间数量

    public RoomDateInfo() {}

    public RoomDateInfo(DateTime roomdate, int roomNum) {
        this.roomdate = roomdate;
        this.roomNum = roomNum;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public DateTime getRoomdate() {
        return roomdate;
    }

    public void setRoomdate(DateTime roomdate) {
        this.roomdate = roomdate;
    }

    public int getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }

    @Override
    public String toString() {
        return "剩余房间实例信息{" +
                "房间Id=" + roomId +
                ", 房间日期=" + roomdate +
                ", 剩余房间数量=" + roomNum +
                '}';
    }
}
