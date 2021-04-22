package domain;

import org.joda.time.DateTime;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 21:32
 * @Description: 门票订单信息实体类
 */
public class TicketOrderInfo {
    private int ticketOrderId;          //门票订单id
    private int ticketId;               //门票id
    private int userId;                 //用户id
    private DateTime ticketDate;        //门票日期
    private float ticketPrice;          //门票价格
    private DateTime ticketOrderTime;   //订单日期
    private int ticketNum;              //门票数量
    private float ticketOrderPrice;     //订单价格
    private String ticketRemark;        //门票标记
    private Boolean ticketOrderState;   //门票状态
    private DateTime unsubscribeTime;   //退订日期
    private float unsubscribePrice;     //退还金额
    private Boolean flag;               //订单状态(是否删除)

    public TicketOrderInfo(int ticketId, int userId, DateTime ticketDate, float ticketPrice,
                           DateTime ticketOrderTime, int ticketNum, float ticketOrderPrice, String ticketRemark,
                           Boolean ticketOrderState, DateTime unsubscribeTime, float unsubscribePrice, Boolean flag) {
        this.ticketId = ticketId;
        this.userId = userId;
        this.ticketDate = ticketDate;
        this.ticketPrice = ticketPrice;
        this.ticketOrderTime = ticketOrderTime;
        this.ticketNum = ticketNum;
        this.ticketOrderPrice = ticketOrderPrice;
        this.ticketRemark = ticketRemark;
        this.ticketOrderState = ticketOrderState;
        this.unsubscribeTime = unsubscribeTime;
        this.unsubscribePrice = unsubscribePrice;
        this.flag = flag;
    }

    public int getTicketOrderId() {
        return ticketOrderId;
    }

    public void setTicketOrderId(int ticketOrderId) {
        this.ticketOrderId = ticketOrderId;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public DateTime getTicketDate() {
        return ticketDate;
    }

    public void setTicketDate(DateTime ticketDate) {
        this.ticketDate = ticketDate;
    }

    public float getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(float ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public DateTime getTicketOrderTime() {
        return ticketOrderTime;
    }

    public void setTicketOrderTime(DateTime ticketOrderTime) {
        this.ticketOrderTime = ticketOrderTime;
    }

    public int getTicketNum() {
        return ticketNum;
    }

    public void setTicketNum(int ticketNum) {
        this.ticketNum = ticketNum;
    }

    public float getTicketOrderPrice() {
        return ticketOrderPrice;
    }

    public void setTicketOrderPrice(float ticketOrderPrice) {
        this.ticketOrderPrice = ticketOrderPrice;
    }

    public String getTicketRemark() {
        return ticketRemark;
    }

    public void setTicketRemark(String ticketRemark) {
        this.ticketRemark = ticketRemark;
    }

    public Boolean getTicketOrderState() {
        return ticketOrderState;
    }

    public void setTicketOrderState(Boolean ticketOrderState) {
        this.ticketOrderState = ticketOrderState;
    }

    public DateTime getUnsubscribeTime() {
        return unsubscribeTime;
    }

    public void setUnsubscribeTime(DateTime unsubscribeTime) {
        this.unsubscribeTime = unsubscribeTime;
    }

    public float getUnsubscribePrice() {
        return unsubscribePrice;
    }

    public void setUnsubscribePrice(float unsubscribePrice) {
        this.unsubscribePrice = unsubscribePrice;
    }

    @Override
    public String toString() {
        return "门票订单信息{" +
                "门票订单id=" + ticketOrderId +
                ", 门票id=" + ticketId +
                ", 用户id=" + userId +
                ", 门票日期=" + ticketDate +
                ", 门票价格=" + ticketPrice +
                ", 订单日期=" + ticketOrderTime +
                ", 门票数量=" + ticketNum +
                ", 订单价格=" + ticketOrderPrice +
                ", 门票标记='" + ticketRemark + '\'' +
                ", 门票状态=" + ticketOrderState +
                ", 退订日期=" + unsubscribeTime +
                ", 退还金额=" + unsubscribePrice +
                ", 订单状态(是否删除)=" + flag +
                '}';
    }
}