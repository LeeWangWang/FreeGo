package domain;

import java.sql.Date;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/3 19:27
 * @Description: 剩余房间实例信息
 */
public class RoomDateInfo {
    private int roomId;         //房间Id
    private Date roomdate;  //房间日期
    private int roomNum;        //剩余房间数量

    public RoomDateInfo() {}

    public RoomDateInfo(int roomId,Date roomdate, int roomNum) {
        this.roomId = roomId;
        this.roomdate = roomdate;
        this.roomNum = roomNum;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public Date getRoomdate() {
        return roomdate;
    }

    public void setRoomdate(Date roomdate) {
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
