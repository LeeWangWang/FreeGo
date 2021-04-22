package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 21:29
 * @Description: 门票信息实体类
 */
public class TicketInfo {
    private int ticketId;           //门票id
    private int scenicId;           //景点id
    private String ticketName;      //门票名称
    private String ticketType;      //门票类型
    private Boolean ticketState;    //门票状态

    public TicketInfo() {}

    public TicketInfo(int scenicId, String ticketName, String ticketType, Boolean ticketState) {
        this.scenicId = scenicId;
        this.ticketName = ticketName;
        this.ticketType = ticketType;
        this.ticketState = ticketState;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public int getScenicId() {
        return scenicId;
    }

    public void setScenicId(int scenicId) {
        this.scenicId = scenicId;
    }

    public String getTicketName() {
        return ticketName;
    }

    public void setTicketName(String ticketName) {
        this.ticketName = ticketName;
    }

    public String getTicketType() {
        return ticketType;
    }

    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }

    public Boolean getTicketState() {
        return ticketState;
    }

    public void setTicketState(Boolean ticketState) {
        this.ticketState = ticketState;
    }

    @Override
    public String toString() {
        return "门票信息{" +
                "门票id=" + ticketId +
                ", 景点id=" + scenicId +
                ", 门票名称='" + ticketName + '\'' +
                ", 门票类型='" + ticketType + '\'' +
                ", 门票状态=" + ticketState +
                '}';
    }
}