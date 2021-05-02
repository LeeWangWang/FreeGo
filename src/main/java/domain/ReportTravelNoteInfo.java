package domain;

import java.sql.Date;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 21:09
 * @Description: 举报游记信息实体类
 */
public class ReportTravelNoteInfo {
    private int travelId;               //游记id
    private int userId;                 //用户id
    private String reportSelect;        //举报原因
    private String reportContent;       //举报内容
    private Date reportTime;        //举报时间
    private Boolean flag;               //是否受理

    public ReportTravelNoteInfo() {}

    public ReportTravelNoteInfo(int userId, String reportSelect, String reportContent, Date reportTime) {
        this.userId = userId;
        this.reportSelect = reportSelect;
        this.reportContent = reportContent;
        this.reportTime = reportTime;
    }

    public int getTravelId() {
        return travelId;
    }

    public void setTravelId(int travelId) {
        this.travelId = travelId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getReportSelect() {
        return reportSelect;
    }

    public void setReportSelect(String reportSelect) {
        this.reportSelect = reportSelect;
    }

    public String getReportContent() {
        return reportContent;
    }

    public void setReportContent(String reportContent) {
        this.reportContent = reportContent;
    }

    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "ReportTravelNoteInfo{" +
                "游记id=" + travelId +
                ", 用户id=" + userId +
                ", 举报原因='" + reportSelect + '\'' +
                ", 举报内容='" + reportContent + '\'' +
                ", 举报时间=" + reportTime +
                ", 是否受理=" + flag +
                '}';
    }
}