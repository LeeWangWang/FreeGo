package domain;

import org.joda.time.DateTime;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 21:53
 * @Description: 游记评论信息实体类
 */
public class TravelNoteCommentInfo {
    private int commentId;          //评论id
    private int userId;             //用户id
    private int travelNoteId;       //游记id
    private int parentId;           //父id
    private int commentLevel;       //评论等级
    private String commentTime;   //评论时间
    private String commentText;     //评论内容
    private Boolean flag;           //评论状态(是否删除)

    public TravelNoteCommentInfo() {}

    public TravelNoteCommentInfo(int commentId, int userId, int travelNoteId, int parentId, int commentLevel, String commentTime, String commentText, Boolean flag) {
        this.commentId = commentId;
        this.userId = userId;
        this.travelNoteId = travelNoteId;
        this.parentId = parentId;
        this.commentLevel = commentLevel;
        this.commentTime = commentTime;
        this.commentText = commentText;
        this.flag = flag;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTravelNoteId() {
        return travelNoteId;
    }

    public void setTravelNoteId(int travelNoteId) {
        this.travelNoteId = travelNoteId;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getCommentLevel() {
        return commentLevel;
    }

    public void setCommentLevel(int commentLevel) {
        this.commentLevel = commentLevel;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "游记评论信息{" +
                "评论id=" + commentId +
                ", 用户id=" + userId +
                ", 游记id=" + travelNoteId +
                ", 父id=" + parentId +
                ", 评论等级=" + commentLevel +
                ", 评论时间=" + commentTime +
                ", 评论内容='" + commentText + '\'' +
                ", 评论状态(是否删除)=" + flag +
                '}';
    }
}