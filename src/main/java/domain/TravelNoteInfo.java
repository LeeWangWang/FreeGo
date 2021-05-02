package domain;

import java.sql.Date;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 21:49
 * @Description: 游记信息实体类
 */
public class TravelNoteInfo {
    private int travelNoteId;           //游记id
    private String travelNoteTitle;     //游记标题
    private String travelNoteCover;     //游记封面
    private String travelNoteText;      //游记正文
    private Date publishDate;           //发布日期
    private Date travelTime;            //出发时间
    private int travelDays;             //旅行天数
    private int travelPerson;           //旅行人物
    private int travelPrice;            //人均费用
    private int travelLocate;           //游记位置
    private int pageViews;              //浏览量
    private Boolean isPublish;          //是否发布（1:未发表，1:已发表）
    private Boolean flag;               //游记状态(0:未删除，1:已删除)

    public TravelNoteInfo() {}

    public TravelNoteInfo(String travelNoteTitle, String travelNoteCover, String travelNoteText, Date publishDate, Date travelTime, int travelDays, int travelPerson, int travelPrice, int travelLocate) {
        this.travelNoteTitle = travelNoteTitle;
        this.travelNoteCover = travelNoteCover;
        this.travelNoteText = travelNoteText;
        this.publishDate = publishDate;
        this.travelTime = travelTime;
        this.travelDays = travelDays;
        this.travelPerson = travelPerson;
        this.travelPrice = travelPrice;
        this.travelLocate = travelLocate;
    }

    public int getTravelNoteId() {
        return travelNoteId;
    }

    public void setTravelNoteId(int travelNoteId) {
        this.travelNoteId = travelNoteId;
    }

    public String getTravelNoteTitle() {
        return travelNoteTitle;
    }

    public void setTravelNoteTitle(String travelNoteTitle) {
        this.travelNoteTitle = travelNoteTitle;
    }

    public String getTravelNoteCover() {
        return travelNoteCover;
    }

    public void setTravelNoteCover(String travelNoteCover) {
        this.travelNoteCover = travelNoteCover;
    }

    public String getTravelNoteText() {
        return travelNoteText;
    }

    public void setTravelNoteText(String travelNoteText) {
        this.travelNoteText = travelNoteText;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Date getTravelTime() {
        return travelTime;
    }

    public void setTravelTime(Date travelTime) {
        this.travelTime = travelTime;
    }

    public int getTravelDays() {
        return travelDays;
    }

    public void setTravelDays(int travelDays) {
        this.travelDays = travelDays;
    }

    public int getTravelPerson() {
        return travelPerson;
    }

    public void setTravelPerson(int travelPerson) {
        this.travelPerson = travelPerson;
    }

    public int getTravelPrice() {
        return travelPrice;
    }

    public void setTravelPrice(int travelPrice) {
        this.travelPrice = travelPrice;
    }

    public int getTravelLocate() {
        return travelLocate;
    }

    public void setTravelLocate(int travelLocate) {
        this.travelLocate = travelLocate;
    }

    public int getPageViews() {
        return pageViews;
    }

    public void setPageViews(int pageViews) {
        this.pageViews = pageViews;
    }

    public Boolean getPublish() {
        return isPublish;
    }

    public void setPublish(Boolean publish) {
        isPublish = publish;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "游记信息{" +
                "游记id=" + travelNoteId +
                ", 游记标题='" + travelNoteTitle + '\'' +
                ", 游记封面='" + travelNoteCover + '\'' +
                ", 游记正文='" + travelNoteText + '\'' +
                ", 发布日期=" + publishDate +
                ", 出发时间=" + travelTime +
                ", 旅行天数=" + travelDays +
                ", 旅行人物='" + travelPerson + '\'' +
                ", 人均费用=" + travelPrice +
                ", 游记位置='" + travelLocate + '\'' +
                ", 浏览量=" + pageViews +
                ", 是否发布=" + isPublish +
                ", 游记状态(是否删除)=" + flag +
                '}';
    }

}