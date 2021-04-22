package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 21:39
 * @Description: 景点出行人信息实体类
 */
public class TicketOrderTravelerInfo {
    private int ticketTravelerId;       //出行人id
    private int ticketOrderId;          //门票订单id
    private String travelerName;        //出行人姓名
    private String travelerTele;        //出行人电话
    private String travelerIdCard;      //出行人身份证
    private int travelerOrder;          //出行人顺序

    public TicketOrderTravelerInfo() {}

    public TicketOrderTravelerInfo(int ticketOrderId, String travelerName, String travelerTele, String travelerIdCard, int travelerOrder) {
        this.ticketOrderId = ticketOrderId;
        this.travelerName = travelerName;
        this.travelerTele = travelerTele;
        this.travelerIdCard = travelerIdCard;
        this.travelerOrder = travelerOrder;
    }

    public int getTicketTravelerId() {
        return ticketTravelerId;
    }

    public void setTicketTravelerId(int ticketTravelerId) {
        this.ticketTravelerId = ticketTravelerId;
    }

    public int getTicketOrderId() {
        return ticketOrderId;
    }

    public void setTicketOrderId(int ticketOrderId) {
        this.ticketOrderId = ticketOrderId;
    }

    public String getTravelerName() {
        return travelerName;
    }

    public void setTravelerName(String travelerName) {
        this.travelerName = travelerName;
    }

    public String getTravelerTele() {
        return travelerTele;
    }

    public void setTravelerTele(String travelerTele) {
        this.travelerTele = travelerTele;
    }

    public String getTravelerIdCard() {
        return travelerIdCard;
    }

    public void setTravelerIdCard(String travelerIdCard) {
        this.travelerIdCard = travelerIdCard;
    }

    public int getTravelerOrder() {
        return travelerOrder;
    }

    public void setTravelerOrder(int travelerOrder) {
        this.travelerOrder = travelerOrder;
    }

    @Override
    public String toString() {
        return "景点出行人信息{" +
                "出行人id=" + ticketTravelerId +
                ", 门票订单id=" + ticketOrderId +
                ", 出行人姓名='" + travelerName + '\'' +
                ", 出行人电话='" + travelerTele + '\'' +
                ", 出行人身份证='" + travelerIdCard + '\'' +
                ", 出行人顺序=" + travelerOrder +
                '}';
    }
}