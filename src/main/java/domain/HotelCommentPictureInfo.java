package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/3 10:42
 * @Description: 酒店评论图片关系
 */
public class HotelCommentPictureInfo {
    private int commentId;          //评论id
    private String picturePath;     //图片路径
    private int pictureOrder;       //图片顺序

    public HotelCommentPictureInfo() {}

    public HotelCommentPictureInfo(String picturePath, int pictureOrder) {
        this.picturePath = picturePath;
        this.pictureOrder = pictureOrder;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public int getPictureOrder() {
        return pictureOrder;
    }

    public void setPictureOrder(int pictureOrder) {
        this.pictureOrder = pictureOrder;
    }

    @Override
    public String toString() {
        return "酒店评论图片关系{" +
                "评论id=" + commentId +
                ", 图片路径='" + picturePath + '\'' +
                ", 图片顺序=" + pictureOrder +
                '}';
    }
}
