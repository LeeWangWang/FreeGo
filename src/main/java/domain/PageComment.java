package domain;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/5/11 14:00
 * @Description:
 */
public class PageComment {

    private List<UserInfo> userList;        //用户信息列表
    private List<TravelNoteCommentInfo> commentInfoList;    //评论信息列表

    public PageComment() {}

    public PageComment(List<UserInfo> userList, List<TravelNoteCommentInfo> commentInfoList) {
        this.userList = userList;
        this.commentInfoList = commentInfoList;
    }

    public List<UserInfo> getUserList() {
        return userList;
    }

    public void setUserList(List<UserInfo> userList) {
        this.userList = userList;
    }

    public List<TravelNoteCommentInfo> getCommentInfoList() {
        return commentInfoList;
    }

    public void setCommentInfoList(List<TravelNoteCommentInfo> commentInfoList) {
        this.commentInfoList = commentInfoList;
    }

}
