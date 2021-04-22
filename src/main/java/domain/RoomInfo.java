package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 21:15
 * @Description: 房间信息实体类
 */
public class RoomInfo {
    private int roomId;             //房间id
    private int hotelId;            //酒店Id
    private String roomName;        //房间名称
    private int peopleLimite;       //人数限制
    private String relateService;   //相关服务
    private float roomPrice;        //房间价格
    private String roomInform;      //房间介绍
    private Boolean flag;           //房间状态(是否删除)

    public RoomInfo() {
    }

    public RoomInfo(int hotelId, String roomName, int peopleLimite, String relateService, float roomPrice, String roomInform, Boolean flag) {
        this.hotelId = hotelId;
        this.roomName = roomName;
        this.peopleLimite = peopleLimite;
        this.relateService = relateService;
        this.roomPrice = roomPrice;
        this.roomInform = roomInform;
        this.flag = flag;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getPeopleLimite() {
        return peopleLimite;
    }

    public void setPeopleLimite(int peopleLimite) {
        this.peopleLimite = peopleLimite;
    }

    public String getRelateService() {
        return relateService;
    }

    public void setRelateService(String relateService) {
        this.relateService = relateService;
    }

    public float getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(float roomPrice) {
        this.roomPrice = roomPrice;
    }

    public String getRoomInform() {
        return roomInform;
    }

    public void setRoomInform(String roomInform) {
        this.roomInform = roomInform;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "房间信息{" +
                "房间id=" + roomId +
                ", 酒店Id=" + hotelId +
                ", 房间名称='" + roomName + '\'' +
                ", 人数限制=" + peopleLimite +
                ", 相关服务='" + relateService + '\'' +
                ", 房间价格=" + roomPrice +
                ", 房间介绍='" + roomInform + '\'' +
                ", 房间状态(是否删除)=" + flag +
                '}';
    }
}