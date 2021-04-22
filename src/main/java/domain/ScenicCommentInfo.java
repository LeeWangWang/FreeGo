package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 21:24
 * @Description: 景点评论信息实体类
 */
public class ScenicCommentInfo {
    private int scenicCommentId;            //评论id
    private int parentId;                   //父id
    private int userId;                     //用户id
    private int scenicId;                   //景点id
    private int scenicGrade;                //所有评分
    private String commentText;             //评论内容
    private Boolean scenicCommentState;     //评论状态(是否删除)

    public ScenicCommentInfo() {
    }

    public ScenicCommentInfo(int parentId, int userId, int scenicId, int scenicGrade, String commentText, Boolean scenicCommentState) {
        this.parentId = parentId;
        this.userId = userId;
        this.scenicId = scenicId;
        this.scenicGrade = scenicGrade;
        this.commentText = commentText;
        this.scenicCommentState = scenicCommentState;
    }

    public int getScenicCommentId() {
        return scenicCommentId;
    }

    public void setScenicCommentId(int scenicCommentId) {
        this.scenicCommentId = scenicCommentId;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getScenicId() {
        return scenicId;
    }

    public void setScenicId(int scenicId) {
        this.scenicId = scenicId;
    }

    public int getScenicGrade() {
        return scenicGrade;
    }

    public void setScenicGrade(int scenicGrade) {
        this.scenicGrade = scenicGrade;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Boolean getScenicCommentState() {
        return scenicCommentState;
    }

    public void setScenicCommentState(Boolean scenicCommentState) {
        this.scenicCommentState = scenicCommentState;
    }

    @Override
    public String toString() {
        return "景点评论信息{" +
                "评论id=" + scenicCommentId +
                ", 父id=" + parentId +
                ", 用户id=" + userId +
                ", 景点id=" + scenicId +
                ", 所有评分=" + scenicGrade +
                ", 评论内容='" + commentText + '\'' +
                ", 评论状态(是否删除)=" + scenicCommentState +
                '}';
    }
}