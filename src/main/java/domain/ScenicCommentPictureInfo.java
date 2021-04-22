package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/4 10:34
 * @Description: 景点评论图片关系
 */
public class ScenicCommentPictureInfo {
    private int scenicCommentId;        //景点评论id
    private String picturePath;         //图片路径
    private int pictureOrder;           //图片顺序

    public ScenicCommentPictureInfo() {}

    public ScenicCommentPictureInfo(String picturePath, int pictureOrder) {
        this.picturePath = picturePath;
        this.pictureOrder = pictureOrder;
    }

    public int getScenicCommentId() {
        return scenicCommentId;
    }

    public void setScenicCommentId(int scenicCommentId) {
        this.scenicCommentId = scenicCommentId;
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
        return "景点评论图片关系{" +
                "景点评论id=" + scenicCommentId +
                ", 图片路径='" + picturePath + '\'' +
                ", 图片顺序=" + pictureOrder +
                '}';
    }
}
