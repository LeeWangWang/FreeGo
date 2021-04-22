package domain;

import org.joda.time.DateTime;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 20:37
 * @Description: 酒店订单信息实体类
 */
public class HotelOrderInfo {
    private String orderId;             //订单id
    private int userId;                 //用户id
    private int hotelId;                //酒店id
    private DateTime moveIntoTime;      //入住时间
    private DateTime departureTime;     //离开时间
    private DateTime arrivalTime;       //到达时间
    private String specialRequirement;  //特殊要求
    private String contactName;         //联系人
    private String contactTele;         //联系电话
    private String contactEmail;        //联系邮箱
    private String invoiceTitle;        //发票抬头
    private String invoiceType;         //发票类型
    private String TaxpaperNumber;      //纳税人编号
    private String isNotDepartmentTime; //是否记录离开时间
    private String nowState;            //订单状态
    private DateTime unsubscribeTime;   //退订时间
    private String isFreeUnsubscribe;   //是否免费取消
    private Boolean flag;               //订单状态(是否删除)

    public HotelOrderInfo() { }

    public HotelOrderInfo(int userId, int hotelId, DateTime moveIntoTime, DateTime departureTime,
                          DateTime arrivalTime, String specialRequirement, String contactName, String contactTele,
                          String contactEmail, String invoiceTitle, String invoiceType, String taxpaperNumber,
                          String isNotDepartmentTime, String nowState, DateTime unsubscribeTime, String isFreeUnsubscribe, Boolean flag) {
        this.userId = userId;
        this.hotelId = hotelId;
        this.moveIntoTime = moveIntoTime;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.specialRequirement = specialRequirement;
        this.contactName = contactName;
        this.contactTele = contactTele;
        this.contactEmail = contactEmail;
        this.invoiceTitle = invoiceTitle;
        this.invoiceType = invoiceType;
        TaxpaperNumber = taxpaperNumber;
        this.isNotDepartmentTime = isNotDepartmentTime;
        this.nowState = nowState;
        this.unsubscribeTime = unsubscribeTime;
        this.isFreeUnsubscribe = isFreeUnsubscribe;
        this.flag = flag;
    }

    public HotelOrderInfo(String orderId, int userId, int hotelId, DateTime moveIntoTime, DateTime departureTime,
                          String contactName, String contactTele, String isNotDepartmentTime, String nowState,
                          String isFreeUnsubscribe, Boolean flag) {
        this.orderId = orderId;
        this.userId = userId;
        this.hotelId = hotelId;
        this.moveIntoTime = moveIntoTime;
        this.departureTime = departureTime;
        this.contactName = contactName;
        this.contactTele = contactTele;
        this.isNotDepartmentTime = isNotDepartmentTime;
        this.nowState = nowState;
        this.isFreeUnsubscribe = isFreeUnsubscribe;
        this.flag = flag;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public DateTime getMoveIntoTime() {
        return moveIntoTime;
    }

    public void setMoveIntoTime(DateTime moveIntoTime) {
        this.moveIntoTime = moveIntoTime;
    }

    public DateTime getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(DateTime departureTime) {
        this.departureTime = departureTime;
    }

    public DateTime getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(DateTime arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getSpecialRequirement() {
        return specialRequirement;
    }

    public void setSpecialRequirement(String specialRequirement) {
        this.specialRequirement = specialRequirement;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactTele() {
        return contactTele;
    }

    public void setContactTele(String contactTele) {
        this.contactTele = contactTele;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getInvoiceTitle() {
        return invoiceTitle;
    }

    public void setInvoiceTitle(String invoiceTitle) {
        this.invoiceTitle = invoiceTitle;
    }

    public String getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(String invoiceType) {
        this.invoiceType = invoiceType;
    }

    public String getTaxpaperNumber() {
        return TaxpaperNumber;
    }

    public void setTaxpaperNumber(String taxpaperNumber) {
        TaxpaperNumber = taxpaperNumber;
    }

    public String getIsNotDepartmentTime() {
        return isNotDepartmentTime;
    }

    public void setIsNotDepartmentTime(String isNotDepartmentTime) {
        this.isNotDepartmentTime = isNotDepartmentTime;
    }

    public String getNowState() {
        return nowState;
    }

    public void setNowState(String nowState) {
        this.nowState = nowState;
    }

    public DateTime getUnsubscribeTime() {
        return unsubscribeTime;
    }

    public void setUnsubscribeTime(DateTime unsubscribeTime) {
        this.unsubscribeTime = unsubscribeTime;
    }

    public String getIsFreeUnsubscribe() {
        return isFreeUnsubscribe;
    }

    public void setIsFreeUnsubscribe(String isFreeUnsubscribe) {
        this.isFreeUnsubscribe = isFreeUnsubscribe;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "酒店订单信息{" +
                "订单id='" + orderId + '\'' +
                ", 用户id=" + userId +
                ", 酒店id=" + hotelId +
                ", 入住时间=" + moveIntoTime +
                ", 离开时间=" + departureTime +
                ", 到达时间=" + arrivalTime +
                ", 特殊要求='" + specialRequirement + '\'' +
                ", 联系人='" + contactName + '\'' +
                ", 联系电话='" + contactTele + '\'' +
                ", 联系邮箱='" + contactEmail + '\'' +
                ", 发票抬头='" + invoiceTitle + '\'' +
                ", 发票类型='" + invoiceType + '\'' +
                ", 纳税人编号='" + TaxpaperNumber + '\'' +
                ", 是否记录离开时间='" + isNotDepartmentTime + '\'' +
                ", 订单状态='" + nowState + '\'' +
                ", 退订时间=" + unsubscribeTime +
                ", 是否免费取消='" + isFreeUnsubscribe + '\'' +
                ", 订单状态(是否删除)=" + flag +
                '}';
    }
}