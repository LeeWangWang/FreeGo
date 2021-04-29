package domain;

import org.joda.time.DateTime;

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
    private DateTime publishDate;       //发布日期
    private int pageViews;              //浏览量
    private DateTime travelTime;        //出发时间
    private int travelDays;             //旅行天数
    private String travelPerson;        //旅行人物
    private int travelPrice;            //人均费用
    private String travelLocate;        //游记位置
    private Boolean isPublish;          //是否发布
    private Boolean flag;               //游记状态(0:未删除，1:已删除)

    public TravelNoteInfo() {}

    public TravelNoteInfo(String travelNoteTitle, String travelNoteCover, String travelNoteText, DateTime publishDate,
                          int pageViews, DateTime travelTime, int travelDays, String travelPerson, int travelPrice,
                          String travelLocate, Boolean isPublish, Boolean flag) {
        this.travelNoteTitle = travelNoteTitle;
        this.travelNoteCover = travelNoteCover;
        this.travelNoteText = travelNoteText;
        this.publishDate = publishDate;
        this.pageViews = pageViews;
        this.travelTime = travelTime;
        this.travelDays = travelDays;
        this.travelPerson = travelPerson;
        this.travelPrice = travelPrice;
        this.travelLocate = travelLocate;
        this.isPublish = isPublish;
        this.flag = flag;
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

    public DateTime getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(DateTime publishDate) {
        this.publishDate = publishDate;
    }

    public int getPageViews() {
        return pageViews;
    }

    public void setPageViews(int pageViews) {
        this.pageViews = pageViews;
    }

    public DateTime getTravelTime() {
        return travelTime;
    }

    public void setTravelTime(DateTime travelTime) {
        this.travelTime = travelTime;
    }

    public int getTravelDays() {
        return travelDays;
    }

    public void setTravelDays(int travelDays) {
        this.travelDays = travelDays;
    }

    public String getTravelPerson() {
        return travelPerson;
    }

    public void setTravelPerson(String travelPerson) {
        this.travelPerson = travelPerson;
    }

    public int getTravelPrice() {
        return travelPrice;
    }

    public void setTravelPrice(int travelPrice) {
        this.travelPrice = travelPrice;
    }

    public String getTravelLocate() {
        return travelLocate;
    }

    public void setTravelLocate(String travelLocate) {
        this.travelLocate = travelLocate;
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
                ", 浏览量=" + pageViews +
                ", 出发时间=" + travelTime +
                ", 旅行天数=" + travelDays +
                ", 旅行人物='" + travelPerson + '\'' +
                ", 人均费用=" + travelPrice +
                ", 游记位置='" + travelLocate + '\'' +
                ", 是否发布=" + isPublish +
                ", 游记状态(是否删除)=" + flag +
                '}';
    }

}