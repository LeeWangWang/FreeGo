package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 21:53
 * @Description: 游记评论信息实体类
 */
public class TravelNoteCommentInfo {
    private int commentId;          //评论id
    private int userId;             //用户id
    private int parentId;           //父id
    private String commentText;     //评论内容
    private Boolean flag;           //评论状态(是否删除)

    public TravelNoteCommentInfo() {}

    public TravelNoteCommentInfo(int userId, int parentId, String commentText, Boolean flag) {
        this.userId = userId;
        this.parentId = parentId;
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

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
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
                ", 父id=" + parentId +
                ", 评论内容='" + commentText + '\'' +
                ", 评论状态(是否删除)=" + flag +
                '}';
    }
}